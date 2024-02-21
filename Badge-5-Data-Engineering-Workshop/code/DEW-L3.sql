select current_timestamp();

--what time zone is your account(and/or session) currently set to? Is it -0700?
select current_timestamp();

--worksheets are sometimes called sessions -- we'll be changing the worksheet time zone
alter session set timezone = 'UTC';
select current_timestamp();

--how did the time differ after changing the time zone for the worksheet?
alter session set timezone = 'Africa/Nairobi';
select current_timestamp();

alter session set timezone = 'Pacific/Funafuti';
select current_timestamp();

alter session set timezone = 'Asia/Shanghai';
select current_timestamp();

--show the account parameter called timezone
show parameters like 'timezone';

alter session set timezone = 'Asia/Kolkata';
select current_timestamp();


list @uni_kishore;

copy into ags_game_audience.raw.game_logs
from @uni_kishore/updated_feed
    file_format = (format_name=ff_json_logs);

select * from game_logs;

select count(*) from logs;

select *
from game_logs
where $1:"agent" is null;


--looking for empty AGENT column
select * 
from ags_game_audience.raw.LOGS
where agent is null;

--looking for non-empty IP_ADDRESS column
select 
RAW_LOG:ip_address::text as IP_ADDRESS
,*
from ags_game_audience.raw.LOGS
where RAW_LOG:ip_address::text is not null;

create or replace view logs as 
select
    RAW_LOG:ip_address::text as IP_ADDRESS,
    RAW_LOG:user_event::text as user_event,
    raw_log:user_login::text as user_login,
    to_timestamp_ntz(raw_log:datetime_iso8601) as datetime_iso8601,
    raw_log
from game_logs
where raw_log:ip_address::text is not null;

select * from logs;

select * from logs 
where user_login like '%prajina%';

select count(*) from logs;
