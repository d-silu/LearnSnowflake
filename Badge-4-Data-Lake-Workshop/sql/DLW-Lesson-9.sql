use role sysadmin;

use schema mels_smoothie_challenge_db.trails;

show views;

select * from cherry_creek_trail;

alter view cherry_creek_trail 
rename to v_cherry_creek_trail;

-- external table

create or replace external table t_cherry_creek_trail(
    my_filename varchar(50) as (metadata$filename::varchar(50))
)
location=@trails_parquet
auto_refresh=true
file_format=(type=parquet);


select get_ddl('view','mels_smoothie_challenge_db.trails.v_cherry_creek_trail');

create or replace view V_CHERRY_CREEK_TRAIL( POINT_ID, TRAIL_NAME, LNG, LAT, COORD_PAIR ) as select   $1:sequence_1 as point_id,  $1:trail_name::varchar as trail_name,  $1:latitude::number(11,8) as lng,  $1:longitude::number(11,8) as lat,  lng||' '||lat as coord_pair from @trails_parquet (file_format => ff_parquet) order by point_id;

create or replace external table t_cherry_creek_trail(
    point_id number as ($1:sequence_1::number),
    LNG number(11,8) as ($1:latitude::number(11,8)),
    LAT number(11,8) as ($1:longitude::number(11,8)),
    coord_pair varchar(50) as (lng::varchar||' '||lat::varchar)
)
location=@trails_parquet
auto_refresh=true 
file_format=ff_parquet;

select * from t_cherry_creek_trail;

-- grading

select GRADER(step, (actual = expected), actual, expected, description) as graded_results from
(
  SELECT
  'DLKW09' as step
  ,( select row_count
     from mels_smoothie_challenge_db.information_schema.tables
     where table_schema = 'TRAILS'
    and table_name = 'SMV_CHERRY_CREEK_TRAIL')   
   as actual
  ,3526 as expected
  ,'Secure Materialized View Created' as description
 ); 