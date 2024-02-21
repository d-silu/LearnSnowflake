use role sysadmin;

create or replace database ags_game_audience;

create or replace schema ags_game_audience.raw;

drop schema ags_game_audience.public;

-- creating stage 

create stage uni_kishore
    url = 's3://uni-kishore';

list @uni_kishore;

-- creating ff 
create or replace file format AGS_GAME_AUDIENCE.RAW.FF_JSON_LOGS
    type = json
    strip_outer_array=True;

select $1
from @uni_kishore/kickoff
    (file_format => ff_json_logs);

-- load stage data to table
copy into ags_game_audience.raw.game_logs
from @uni_kishore/kickoff
    file_format= (format_name=ff_json_logs);

select * from ags_game_audience.raw.game_logs;

create or replace view ags_game_audience.raw.logs as
select
    $1:"agent"::varchar as agent,
    $1:"user_event"::varchar as user_event,
    $1:"user_login"::varchar as user_login,
    to_timestamp_ntz($1:"datetime_iso8601") as datetime_iso8601,
    RAW_LOG
from ags_game_audience.raw.game_logs;


select * from logs;

use role sysadmin;