use role sysadmin;

use schema mels_smoothie_challenge_db.trails;

show stages;

select $1
from @trails_parquet
    (file_format=>ff_parquet);


select
    $1:"sequence_1" as sequence_1,
    $1:"trail_name"::varchar as trail_name,
    $1:"latitude" as latitude,
    $1:"longitude" as longitude,
    $1:"sequence_2" as sequence_2,
    $1:"elevation" as elevation
from @trails_parquet
    (file_format => ff_parquet);


create or replace view mels_smoothie_challenge_db.trails.CHERRY_CREEK_TRAIL as
select 
 $1:sequence_1 as point_id,
 $1:trail_name::varchar as trail_name,
 $1:latitude::number(11,8) as lng, --remember we did a gut check on this data
 $1:longitude::number(11,8) as lat
from @trails_parquet
(file_format => ff_parquet)
order by point_id;

select * from cherry_creek_trail;

select top 100
    lng || ' ' || lat as coord_pair,
    'POINT(' || coord_pair || ')' as trail_point
from cherry_creek_trail;


create or replace view cherry_creek_trail as
select 
 $1:sequence_1 as point_id,
 $1:trail_name::varchar as trail_name,
 $1:latitude::number(11,8) as lng,
 $1:longitude::number(11,8) as lat,
 lng||' '||lat as coord_pair
from @trails_parquet
(file_format => ff_parquet)
order by point_id;

select * from cherry_creek_trail;

select 
    'LINESTRING('||
    listagg(coord_pair, ',') 
    within group (order by point_id)
    ||')' as my_linestring
from cherry_creek_trail
group by trail_name;

create or replace view mels_smoothie_challenge_db.trails.DENVER_AREA_TRAILS as
select
$1:features[0]:properties:Name::string as feature_name
,$1:features[0]:geometry:coordinates::string as feature_coordinates
,$1:features[0]:geometry::string as geometry
,$1:features[0]:properties::string as feature_properties
,$1:crs:properties:name::string as specs
,$1 as whole_object
from @trails_geojson (file_format => ff_json);

-- grading
select GRADER(step, (actual = expected), actual, expected, description) as graded_results from
(
SELECT
'DLKW06' as step
 ,( select count(*) as tally
      from mels_smoothie_challenge_db.information_schema.views 
      where table_name in ('CHERRY_CREEK_TRAIL','DENVER_AREA_TRAILS')) as actual
 ,2 as expected
 ,'Mel\'s views on the geospatial data from Camila' as description
 );


 