create or replace task AGS_GAME_AUDIENCE.RAW.LOAD_LOGS_ENHANCED
	warehouse=COMPUTE_WH
	schedule='5 minute'
	as select 'hello';


--You have to run this grant or you won't be able to test your tasks while in SYSADMIN role
--this is true even if SYSADMIN owns the task!!
grant execute task on account to role SYSADMIN;

--Now you should be able to run the task, even if your role is set to SYSADMIN
execute task AGS_GAME_AUDIENCE.RAW.LOAD_LOGS_ENHANCED;

--the SHOW command might come in handy to look at the task 
show tasks in account;

--you can also look at any task more in depth using DESCRIBE
describe task AGS_GAME_AUDIENCE.RAW.LOAD_LOGS_ENHANCED;

--Run the task a few times to see changes in the RUN HISTORY
execute task AGS_GAME_AUDIENCE.RAW.LOAD_LOGS_ENHANCED;

--make a note of how many rows you have in the table
select count(*)
from AGS_GAME_AUDIENCE.ENHANCED.LOGS_ENHANCED;

--Run the task to load more rows
execute task AGS_GAME_AUDIENCE.RAW.LOAD_LOGS_ENHANCED;

--check to see how many rows were added
select count(*)
from AGS_GAME_AUDIENCE.ENHANCED.LOGS_ENHANCED;

--clone the table to save this version as a backup
--since it holds the records from the UPDATED FEED file, we'll name it _UF
create table ags_game_audience.enhanced.LOGS_ENHANCED_UF 
clone ags_game_audience.enhanced.LOGS_ENHANCED;

-- mergin
MERGE INTO AGS_GAME_AUDIENCE.ENHANCED.LOGS_ENHANCED e 
USING AGS_GAME_AUDIENCE.RAW.LOGS r 
ON r.user_login = e.GAMER_NAME
AND r.datetime_iso8601 = e.GAME_EVENT_UTC
AND r.user_event = e.GAME_EVENT_NAME
WHEN MATCHED THEN 
    UPDATE SET IP_ADDRESS = 'Hey I updated matching rows!';

    
--let's truncate so we can start the load over again
-- remember we have that cloned back up so it's fine
truncate table AGS_GAME_AUDIENCE.ENHANCED.LOGS_ENHANCED;

// COMPTEX Merge

create or replace task AGS_GAME_AUDIENCE.RAW.LOAD_LOGS_ENHANCED
	warehouse=COMPUTE_WH
	schedule='5 minute'
	as
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
        from AGS_GAME_AUDIENCE.RAW.LOGS logs
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


--Testing cycle for MERGE. Use these commands to make sure the Merge works as expected

--Write down the number of records in your table 
select * from AGS_GAME_AUDIENCE.ENHANCED.LOGS_ENHANCED;

--Run the Merge a few times. No new rows should be added at this time 
EXECUTE TASK AGS_GAME_AUDIENCE.RAW.LOAD_LOGS_ENHANCED;

--Check to see if your row count changed 
select * from AGS_GAME_AUDIENCE.ENHANCED.LOGS_ENHANCED;

--Insert a test record into your Raw Table 
--You can change the user_event field each time to create "new" records 
--editing the ip_address or datetime_iso8601 can complicate things more than they need to 
--editing the user_login will make it harder to remove the fake records after you finish testing 
INSERT INTO ags_game_audience.raw.game_logs 
select PARSE_JSON('{"datetime_iso8601":"2025-01-01 00:00:00.000", "ip_address":"196.197.196.255", "user_event":"fake event", "user_login":"fake user"}');

--After inserting a new row, run the Merge again 
EXECUTE TASK AGS_GAME_AUDIENCE.RAW.LOAD_LOGS_ENHANCED;

--Check to see if any rows were added 
select * from AGS_GAME_AUDIENCE.ENHANCED.LOGS_ENHANCED;

select * from AGS_GAME_AUDIENCE.ENHANCED.LOGS_ENHANCED
where gamer_name like '%fake user%';

--When you are confident your merge is working, you can delete the raw records 
delete from ags_game_audience.raw.game_logs where raw_log like '%fake user%';

--You should also delete the fake rows from the enhanced table
delete from AGS_GAME_AUDIENCE.ENHANCED.LOGS_ENHANCED
where gamer_name = 'fake user';

--Row count should be back to what it was in the beginning
select count(*) from AGS_GAME_AUDIENCE.ENHANCED.LOGS_ENHANCED; 
