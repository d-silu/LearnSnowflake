use role sysadmin;

use database zenas_athleisure_db;

use schema zenas_athleisure_db.products;

list @UNI_KLAUS_ZMD;

select $1
from @uni_klaus_zmd/product_coordination_suggestions.txt;

select $1
from @uni_klaus_zmd/sweatsuit_sizes.txt;

select $1
from @uni_klaus_zmd/swt_product_line.txt;

create or replace file format zmd_file_format_1
RECORD_DELIMITER='^';

select $1
from @uni_klaus_zmd/product_coordination_suggestions.txt
    (file_format => zmd_file_format_1);

create or replace file format zmd_file_format_2
FIELD_DELIMITER = '^';  

select $1
from @uni_klaus_zmd/product_coordination_suggestions.txt
(file_format => zmd_file_format_2);


-- third file format
create or replace file format zmd_file_format_3
    FIELD_DELIMITER = '='
    RECORD_DELIMITER = '^'
    TRIM_SPACE=True;


select $1, $2
from @uni_klaus_zmd/product_coordination_suggestions.txt
(file_format => zmd_file_format_3);

create or replace view zenas_athleisure_db.products.SWEATBAND_COORDINATION AS
    select
        REPLACE($1, CHR(10)||CHR(13)) as product_code,
        REPLACE($2, CHR(10)||CHR(13)) as has_matching_sweatsuit
    from @uni_klaus_zmd/product_coordination_suggestions.txt
        (file_format => zmd_file_format_3);


create or replace file format zmd_file_format_1
RECORD_DELIMITER=';'
TRIM_SPACE=TRUE;

select REPLACE($1,CHR(13)||CHR(10),'') as sizes_available
from @uni_klaus_zmd/sweatsuit_sizes.txt
    (file_format => zmd_file_format_1)
where sizes_available <>'';


create or replace view zenas_athleisure_db.products.sweatsuit_sizes as 
    select REPLACE($1,CHR(13)||CHR(10),'') as sizes_available
    from @uni_klaus_zmd/sweatsuit_sizes.txt
        (file_format => zmd_file_format_1)
    where sizes_available <>'';


select $1
from @uni_klaus_zmd/swt_product_line.txt;

drop file format zenas_athleisure_db.products.zmd_file_format_2;

create or replace file format zenas_athleisure_db.products.zmd_file_format_2
    RECORD_DELIMITER=';'
    FIELD_DELIMITER='|'
    TRIM_SPACE=True;

select
    replace($1,chr(13)||chr(10),'') as product_code,
    replace($2, chr(13)||chr(10),'') as headband_description,
    replace($3,chr(13)||chr(10),'') as wristband_description
from @zenas_athleisure_db.products.uni_klaus_zmd/swt_product_line.txt
    (file_format => zenas_athleisure_db.products.zmd_file_format_2);


create or replace view zenas_athleisure_db.products.SWEATBAND_PRODUCT_LINE AS 
select
    replace($1,chr(13)||chr(10),'') as product_code,
    replace($2, chr(13)||chr(10),'') as headband_description,
    replace($3,chr(13)||chr(10),'') as wristband_description
from @zenas_athleisure_db.products.uni_klaus_zmd/swt_product_line.txt
    (file_format => zenas_athleisure_db.products.zmd_file_format_2);



select * from zenas_athleisure_db.products.sweatband_coordination;
select * from zenas_athleisure_db.products.sweatband_product_line;
select * from zenas_athleisure_db.products.sweatsuit_sizes;

-- grading
use role accountadmin;
use schema util_db.public;
select GRADER(step, (actual = expected), actual, expected, description) as graded_results from
(
 SELECT
   'DLKW02' as step
   ,( select sum(tally) from
        (select count(*) as tally
        from ZENAS_ATHLEISURE_DB.PRODUCTS.SWEATBAND_PRODUCT_LINE
        where length(product_code) > 7 
        union
        select count(*) as tally
        from ZENAS_ATHLEISURE_DB.PRODUCTS.SWEATSUIT_SIZES
        where LEFT(sizes_available,2) = char(13)||char(10))     
     ) as actual
   ,0 as expected
   ,'Leave data where it lands.' as description
); 