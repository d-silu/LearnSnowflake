- Every database comes with two schemas.
  
  - `PUBLIC` schema: Default schema, can be used to create any other objects.
  
  - `INFORMATION_SCHEMA`: Special schema for the system that contains views and table functions with provide access to the metadata for the database and account.

**INFORMATION_SCHEMA**

- Also know as Data Dictionary.

- Includes metadata information about the objects within the database as well a account-level objects such as roles.

- More than 20 system-defined views are included in every INFORMATION_SCHEMA. 

- These views can be divided into *account views* and *database views*.

- INFORMATION_SCHEMA account views:

  |View|Description|
  |----|-----------|
  |APPLICABLE_ROLES|Displays one row for each role grant.|
  |DATABASES| Displays one row for each database defined in the account.|
  |ENABLED_ROLES|isplays one row for each currently enabled role in the session.|
  |INFORMATION_SCHEMA_CATALOG_NAME | Displays the name of hte database in which the INFORMATION_SCHEMA resides.|
  |LOAD_HISTORY|Displays one row for each file loaded into tables using COPY INTO TABLE command, and returns history for all data loaded in the past 14 days except for data loaded using Snowpipe.|


- INFORMARTION_SCHEMA database views:

  |View|Description|
  |----|-----------|
  |COLUMNS| Displays one row for each column in the tables defined in the specified (or current) database.|
  |EXTERNAL_TABLES| Displays one row for each external table in the specified (or current) database.|
  |FILE_FORMATS|Displays one row for each UDF or external function defined in the specified (or current) database.|
  |OBJECT_PRIVILEGES|Displays one row for each access privilege granted for all objects defined in your account|
  |PIPES| Displays one row for each pipe defined in the specified (or current) database.|
  |PROCEDURES| Displays one row for each stored procedure defined for the specified (or current) database.|
  |REFERENTIAL_CONSTRAINTS | Displays one row for each referential integrity constraint defined in the specified (or current) database|
  |SCHEMATA| Displays one row for each schema in the specified (or current) database.|
  |SEQUENCES| Displays one row for each sequence defined in the specified (or current) database.|
  |STAGES| Displays one row for each stage defined in the specified (or current) database|
  |TABLE_CONSTRAINTS| Displays one row for each referential integrity constraint defined for the tables in the specified (or current) database.|
  |TABLE_PRIVILEGES| Displays one row for each table privilege that has been granted to each role in the specified (or current) database.|
  | TABLE_STORAGE_METRICS| Displays table-level storage utilization information, includes table metadata, and displays the number of storage types billed for each table. Rows are maintained in this view until the corresponding tables are no longer billed for any storage, regardless of various states that the data in the tables may be in (i.e. active, Time Travel, fail-safe or retained for clones) |
  | TABLES| Displyas one row for each table and view in the specified (or current) database.|
  | USAGE_PRIBILEGES| Displays one row for each privilege defined for sequences in the specified (or current) database.|
  | VIEWS| Displays one row for each view in the specified (or current) database.|



- SONFLAKE database includes **ACCOUNT_USAGE schema**, which is very similar to the INFORMATION_SCHEMA, but with three differences:
  
  - SNOWFLAKE database <u>ACCOUNT_USAGE schema includes records for dropped objects</u>, whereas the INFORMATION_SCHEMA does not.
  
  - <u>ACCOUNT_USAGE schema has a longer retention time (up to 1 year) for historical usage data.</u> Whereas the INFORMATION_SCHEMA has data available ranging from seven days to six months.
  
  - Most views in the INFORMATION_SCHEMA have no latency, but the latency time for ACCOUNT_USAGE could range from 45 minutes to 3 hours.
    
    For the INFORMATION_SCHEMA, there may be a one-to two-hour delay in updating storage-related statistics for ACTIVE_BYTES, TIME_TRAVEL_BYTES, FAILSAFE_BYTES, and RETAINED_FOR_CLONE_BYTES.

- <u>Common use of ACCOUNT_USAGE schema is to keep track of credits used over time by each virtual warehouse in the account</u>.

- Only ACCOUNTADMIN role has access to SNOWFLAKE.ACCOUNT_USAGE schema, unless the ACCOUNTADMIN grants privileges to other roles.