use role accountadmin;

alter database openstreetmap_denver rename to sonra_denver_co_usa_free;

use role sysadmin;

-- Melanie's Location into a 2 Variables (mc for melanies cafe)
set mc_lat='-104.97300245114094';
set mc_lng='39.76471253574085';

--Confluence Park into a Variable (loc for location)
set loc_lat='-105.00840763333615'; 
set loc_lng='39.754141917497826';

--Test your variables to see if they work with the Makepoint function
select st_makepoint($mc_lat,$mc_lng) as melanies_cafe_point;
select st_makepoint($loc_lat,$loc_lng) as confluent_park_point;

--use the variables to calculate the distance from 
--Melanie's Cafe to Confluent Park
select st_distance(
        st_makepoint($mc_lat,$mc_lng)
        ,st_makepoint($loc_lat,$loc_lng)
        ) as mc_to_cp;

use role sysadmin;

use database mels_smoothie_challenge_db;

create schema locations;

create or replace function distance_to_mc(loc_lat number(38,32), loc_lng number(38,32))
    RETURNS FLOAT
    AS 
    $$
   st_distance(
        st_makepoint('-104.97300245114094','39.76471253574085')
        ,st_makepoint(loc_lat,loc_lng)
        )
    $$;

--Tivoli Center into the variables 
set tc_lat='-105.00532059763648'; 
set tc_lng='39.74548137398218';

select distance_to_mc($tc_lat,$tc_lng);

create or replace view mels_smoothie_challenge_db.locations.competition as
select * 
from SONRA_DENVER_CO_USA_FREE.DENVER.V_OSM_DEN_AMENITY_SUSTENANCE
where 
    ((amenity in ('fast_food','cafe','restaurant','juice_bar'))
    and 
    (name ilike '%jamba%' or name ilike '%juice%'
     or name ilike '%superfruit%'))
 or 
    (cuisine like '%smoothie%' or cuisine like '%juice%');


SELECT
 name
 ,cuisine
 , ST_DISTANCE(
    st_makepoint('-104.97300245114094','39.76471253574085')
    , coordinates
  ) AS distance_from_melanies
 ,*
FROM  competition
ORDER by distance_from_melanies;

CREATE OR REPLACE FUNCTION distance_to_mc(lat_and_lng GEOGRAPHY)
  RETURNS FLOAT
  AS
  $$
   st_distance(
        st_makepoint('-104.97300245114094','39.76471253574085')
        ,lat_and_lng
        )
  $$
  ;


  SELECT
 name
 ,cuisine
 ,distance_to_mc(coordinates) AS distance_from_melanies
 ,*
FROM  competition
ORDER by distance_from_melanies;



-- Tattered Cover Bookstore McGregor Square
set tcb_lat='-104.9956203'; 
set tcb_lng='39.754874';

--this will run the first version of the UDF
select distance_to_mc($tcb_lat,$tcb_lng);

--this will run the second version of the UDF, bc it converts the coords 
--to a geography object before passing them into the function
select distance_to_mc(st_makepoint($tcb_lat,$tcb_lng));

--this will run the second version bc the Sonra Coordinates column
-- contains geography objects already
select name
, distance_to_mc(coordinates) as distance_to_melanies 
, ST_ASWKT(coordinates)
from SONRA_DENVER_CO_USA_FREE.DENVER.V_OSM_DEN_SHOP
where shop='books' 
and name like '%Tattered Cover%'
and addr_street like '%Wazee%';


select * from sonra_denver_co_usa_free.denver.v_osm_den_shop_outdoors_and_sport_vehicles;

select * from sonra_denver_co_usa_free.denver.v_osm_den_shop;

select * from sonra_denver_co_usa_free.denver.v_osm_den_shop
where shop='bicycle';

select *
from sonra_denver_co_usa_free.denver.v_osm_den_shop_outdoors_and_sport_vehicles
where shop = 'bicycle';

create or replace view mels_smoothie_challenge_db.locations.DENVER_BIKE_SHOPS as
select *, 
    MELS_SMOOTHIE_CHALLENGE_DB.LOCATIONS.distance_to_mc(coordinates) DISTANCE_TO_MELANIES 
from sonra_denver_co_usa_free.denver.v_osm_den_shop_outdoors_and_sport_vehicles
where shop = 'bicycle';

select name, distance_to_melanies
from denver_bike_shops
order by 2;


select *, 
    MELS_SMOOTHIE_CHALLENGE_DB.LOCATIONS.distance_to_mc(coordinates) DISTANCE_TO_MELANIES 
from sonra_denver_co_usa_free.denver.v_osm_den_shop
where shop = 'bicycle'
order by distance_to_melanies;


-- grading
select GRADER(step, (actual = expected), actual, expected, description) as graded_results from
(
  SELECT
  'DLKW08' as step
  ,( select truncate(distance_to_melanies)
      from mels_smoothie_challenge_db.locations.denver_bike_shops
      where name like '%Mojo%') as actual
  ,14084 as expected
  ,'Bike Shop View Distance Calc works' as description
 ); 