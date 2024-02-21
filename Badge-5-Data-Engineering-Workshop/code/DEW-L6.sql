use role sysadmin;

use SCHEMA ags_game_audience.raw;

create or replace stage UNI_KISHORE_PIPELINE
    URL = 's3://uni-kishore-pipeline';

list @uni_kishore_pipeline;

create or replace table ags_game_audience.raw.PIPELINE_LOGS 
LIKE ags_game_audience.raw.game_logs;

select * from pipeline_logs;

copy into ags_game_audience.raw.pipeline_logs
from @ags_game_audience.raw.uni_kishore_pipeline
    file_format=(format_name=ff_json_logs);

select count(*) from ags_game_audience.raw.pipeline_logs;

create or replace view AGS_GAME_AUDIENCE.RAW.PL_LOGS(
	IP_ADDRESS,
	USER_EVENT,
	USER_LOGIN,
	DATETIME_ISO8601,
	RAW_LOG
) as 
select
    RAW_LOG:ip_address::text as IP_ADDRESS,
    RAW_LOG:user_event::text as user_event,
    raw_log:user_login::text as user_login,
    to_timestamp_ntz(raw_log:datetime_iso8601) as datetime_iso8601,
    raw_log
from ags_game_audience.raw.pipeline_logs
where raw_log:ip_address::text is not null;

select count(*) from ags_game_audience.raw.pl_logs;

-- Task 2

create or replace task AGS_GAME_AUDIENCE.RAW.GET_NEW_FILES
    USER_TASK_MANAGED_INITIAL_WAREHOUSE_SIZE = 'XSMALL'
	schedule='5 minute'
	as copy into ags_game_audience.raw.pipeline_logs
    from @ags_game_audience.raw.uni_kishore_pipeline
        file_format=(format_name=ff_json_logs);


-- Task 4
CREATE OR REPLACE TASK AGS_GAME_AUDIENCE.RAW.LOAD_LOGS_ENHANCED
    USER_TASK_MANAGED_INITIAL_WAREHOUSE_SIZE = 'XSMALL'
	after AGS_GAME_AUDIENCE.RAW.GET_NEW_FILES
	AS
        MERGE INTO AGS_GAME_AUDIENCE.ENHANCED.LOGS_ENHANCED e 
        USING (
                SELECT 
                  logs.ip_address
                , logs.user_login GAMER_NAME
                , logs.user_event GAME_EVENT_NAME
                , logs.datetime_iso8601 GAME_EVENT_UTC
                , city
                , region
                , country
                , timezone GAMER_LTZ_NAME
                , convert_timezone('UTC',GAMER_LTZ_NAME, GAME_EVENT_UTC) game_event_ltz
                , DAYNAME(game_event_ltz) DOW_NAME
                , TOD_NAME
                from AGS_GAME_AUDIENCE.RAW.PL_LOGS logs
                JOIN IPINFO_GEOLOC.demo.location loc 
                ON IPINFO_GEOLOC.public.TO_JOIN_KEY(logs.ip_address) = loc.join_key
                AND IPINFO_GEOLOC.public.TO_INT(logs.ip_address) 
                BETWEEN start_ip_int AND end_ip_int
                JOIN AGS_GAME_AUDIENCE.RAW.TIME_OF_DAY_LU TODL
                    ON hour(game_event_ltz) = TODL.HOUR
            ) r 
        ON r.gamer_name = e.GAMER_NAME
        AND r.game_event_utc = e.GAME_EVENT_UTC
        AND r.game_event_name = e.GAME_EVENT_NAME
        WHEN NOT MATCHED THEN 
        INSERT (
            IP_ADDRESS, GAMER_NAME, GAME_EVENT_NAME, GAME_EVENT_UTC,
            CITY,REGION,COUNTRY,GAMER_LTZ_NAME, GAME_EVENT_LTZ,
            DOW_NAME, TOD_NAME)
            VALUES 
            (    IP_ADDRESS, GAMER_NAME, GAME_EVENT_NAME, GAME_EVENT_UTC,
            CITY,REGION,COUNTRY,GAMER_LTZ_NAME, GAME_EVENT_LTZ,
            DOW_NAME, TOD_NAME);

execute task AGS_GAME_AUDIENCE.RAW.LOAD_LOGS_ENHANCED;


CREATE OR REPLACE TASK AGS_GAME_AUDIENCE.RAW.GET_NEW_FILES 
	WAREHOUSE=COMPUTE_WH
	SCHEDULE='5 minute'
	AS
    copy into ags_game_audience.raw.pipeline_logs
    from @ags_game_audience.raw.uni_kishore_pipeline
        file_format=(format_name=ff_json_logs);

execute task ags_game_audience.raw.GET_NEW_FILES;


-- Truncate table
truncate table ags_game_audience.ENHANCED.LOGS_ENHANCED;

--Turning on a task is done with a RESUME command
alter task AGS_GAME_AUDIENCE.RAW.LOAD_LOGS_ENHANCED resume;
alter task AGS_GAME_AUDIENCE.RAW.GET_NEW_FILES resume;


// CHECK 

--Step 1 - how many files in the bucket?
list @AGS_GAME_AUDIENCE.RAW.UNI_KISHORE_PIPELINE;

--Step 2 - number of rows in raw table (should be file count x 10)
select count(*) from AGS_GAME_AUDIENCE.RAW.PIPELINE_LOGS;

--Step 3 - number of rows in raw table (should be file count x 10)
select count(*) from AGS_GAME_AUDIENCE.RAW.PL_LOGS;

--Step 4 - number of rows in enhanced table (should be file count x 10 but fewer rows is okay)
select count(*) from AGS_GAME_AUDIENCE.ENHANCED.LOGS_ENHANCED;

// Suspend tasks 
-- To shutting down the tasks each day
alter task AGS_GAME_AUDIENCE.RAW.GET_NEW_FILES suspend;
alter task AGS_GAME_AUDIENCE.RAW.LOAD_LOGS_ENHANCED suspend;


use role accountadmin;
grant EXECUTE MANAGED TASK on account to SYSADMIN;

--switch back to sysadmin
use role sysadmin;
