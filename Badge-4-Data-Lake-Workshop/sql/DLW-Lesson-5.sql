use role sysadmin;

create or replace database MELS_SMOOTHIE_CHALLENGE_DB;

create or replace schema TRAILS;

drop schema public;

show schemas;

show stages;

list @trails_geojson;

list @trails_parquet;

create or replace file format mels_smoothie_challenge_db.trails.ff_json
    type = json;

create or replace file format mels_smoothie_challenge_db.trails.ff_parquet
    type=parquet;

-- query data
select $1
from @trails_geojson
(file_format=>ff_json);

select $1
from @trails_parquet
(file_format => ff_parquet);


-- grading 

select GRADER(step, (actual = expected), actual, expected, description) as graded_results from
(
SELECT
'DLKW05' as step
 ,( select sum(tally)
   from
     (select count(*) as tally
      from mels_smoothie_challenge_db.information_schema.stages 
      union all
      select count(*) as tally
      from mels_smoothie_challenge_db.information_schema.file_formats)) as actual
 ,4 as expected
 ,'Camila\'s Trail Data is Ready to Query' as description
 ); 


 