-- Check Dora setup 

select util_db.public.grader(step, (actual = expected), actual, expected, description) as graded_results from
(SELECT 
 'DORA_IS_WORKING' as step
 ,(select 123 ) as actual
 ,123 as expected
 ,'Dora is working!' as description
);


-- query Zean's stage that connects Klaus's S3 bucket

use role sysadmin; use database ZENAS_ATHLEISURE_DB;
use schema ZENAS_ATHLEISURE_DB.PRODUCTS;

show stages;

list @uni_klaus_clothing;

list @uni_klaus_zmd;

-- grading
select GRADER(step, (actual = expected), actual, expected, description) as graded_results from
(
 SELECT
 'DLKW01' as step
  ,( select count(*)  
      from ZENAS_ATHLEISURE_DB.INFORMATION_SCHEMA.STAGES 
      where stage_url ilike ('%/clothing%')
      or stage_url ilike ('%/zenas_metadata%')
      or stage_url like ('%/sneakers%')
   ) as actual
, 3 as expected
, 'Stages for Klaus bucket look good' as description
); 
