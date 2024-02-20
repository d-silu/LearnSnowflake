select 
TO_GEOGRAPHY('LINESTRING('||
listagg(coord_pair, ',') 
within group (order by point_id)
||')') as my_linestring
,st_length(my_linestring) as length_of_trail --this line is new! but it won't work!
from cherry_creek_trail
group by trail_name;

select * from denver_area_trails;

select feature_name, st_length(to_geometry(geometry)) as trail_length
from denver_area_trails;

select get_ddl('view','denver_area_trails');


create or replace view mels_smoothie_challenge_db.trails.denver_area_trails (
    feature_name,
    feature_coordinates,
    geometry,
    trail_length,
    feature_properties,
    specs,
    whole_object
) as 
select 
    $1:features[0]:properties:Name::string as feature_name,
    $1:features[0]:geometry:coordinates::string as feature_coordinates,
    $1:features[0]:geometry::string as geometry,
    st_length(to_geography(geometry)) as trial_length,
    $1:features[0]:properties::string as feature_properties,
    $1:crs:properties:name::string as specs,
    $1 as whole_object
from @trails_geojson(file_format => ff_json);


--So let's make it look like geoJSON instead.
create view DENVER_AREA_TRAILS_2 as
select 
trail_name as feature_name
,'{"coordinates":['||listagg('['||lng||','||lat||']',',')||'],"type":"LineString"}' as geometry
,st_length(to_geography(geometry)) as trail_length
from cherry_creek_trail
group by trail_name;


--Create a view that will have similar columns to DENVER_AREA_TRAILS 
select feature_name, geometry, trail_length
from DENVER_AREA_TRAILS
union all
select feature_name, geometry, trail_length
from DENVER_AREA_TRAILS_2;

--Add more GeoSpatial Calculations to get more GeoSpecial Information! 
create or replace view trails_and_boundaries as
select feature_name
, to_geography(geometry) as my_linestring
, st_xmin(my_linestring) as min_eastwest
, st_xmax(my_linestring) as max_eastwest
, st_ymin(my_linestring) as min_northsouth
, st_ymax(my_linestring) as max_northsouth
, trail_length
from DENVER_AREA_TRAILS
union all
select feature_name
, to_geography(geometry) as my_linestring
, st_xmin(my_linestring) as min_eastwest
, st_xmax(my_linestring) as max_eastwest
, st_ymin(my_linestring) as min_northsouth
, st_ymax(my_linestring) as max_northsouth
, trail_length
from DENVER_AREA_TRAILS_2;

select * from trails_and_boundaries;


select 
    min(min_eastwest) as western_edge,
    min(min_northsouth) as southern_edge,
    max(max_eastwest) as eastern_edge,
    max(max_northsouth) as northern_edge
from trails_and_boundaries;

-- create a bounding box with a polygon

select 'POLYGON((' ||
    min(min_eastwest)|| ' ' || max(max_northsouth) || ',' ||
    max(max_eastwest)|| ' ' || max(max_northsouth) || ',' ||
    max(max_eastwest)|| ' '|| min(min_northsouth) || ',' ||
    min(min_eastwest) || ' ' || max(max_northsouth) || '))' as my_polygon
from trails_and_boundaries;


-- grading
select GRADER(step, (actual = expected), actual, expected, description) as graded_results from
(
 SELECT
  'DLKW07' as step
   ,( select round(max(max_northsouth))
      from MELS_SMOOTHIE_CHALLENGE_DB.TRAILS.TRAILS_AND_BOUNDARIES)
      as actual
 ,40 as expected
 ,'Trails Northern Extent' as description
 ); 