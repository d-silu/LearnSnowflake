1. What are the different types of databases, schemas, and tables that can be created? If a particular type is not specifically stated at the time of creation, what is the default type for each?

   _Ans_:

   - There are two types of databases: permanent(persistent, default) and transient database.

   - There are two types of schemas: regular or permanent (default) and transient schemas.

   - There are 4 main types of tables: permanent/persistent, transient, temporary, and external tables.

2. What is the difference between scalar and tabular UDFs?

   _Ans_: A scalar UDF returns a single value, whereas a tabular UDF returns multiple values.

3. What kinds of things can you do with a stored procedure that you cannot do with a UDF?

   _Ans_: A stored procedure can be used to perform database operations like SELECT, DELETE and CREATE. UDFs can't be used to perform database operations.

4. What would happen if we used the CREATE DATABASE command and the database we want to create already exists? What if we used the CREATE OR REPLACE DATABASE command?

   _Ans_:

   - If `CREATE DATABASE` command is used and the database exists already, we are about to get an error.

   - If a database already exists and we are using `CREATE OR REPLACE` command, then the existing database will be overwritten completely.

   - If a database exists and we don't want to overwrite it, then we can use `CREATE DATABASE IF NOT EXISTS <db-name>`.

5. What is the default retention time for a database? Can the database retention time be changed? Can the default retention time be changed?

   _Ans_:
   - If `CREATE DATABASE` command is used and the database exists already, we are about to get an error.

   - If a database already exists and we are using `CREATE OR REPLACE` command, then the existing database will be overwritten completely.

   - If a database exists and we don't want to overwrite it, then we can use `CREATE DATABASE IF NOT EXISTS <db-name>`.

   - Default retention time for a database is one day. Which can be changed up to maximum 90 days for a permanent database for Enterprise and higher editions of Snowflake.

   - We can't change the default retention time for any object.
   
6. Why might you choose to use the TRUNCATE TABLE command rather than the DROP TABLE command?

   _Ans_: 

   - The `TRUNCATE TABLE` command only removes data. Whereas the `DROP TABLE` command drops the table object.

   - Both `TRUNCATE` and `DELETE` are used to drop the records and preserve the table structure.

   - The `TRUNCATE` command clears the table load history metadata whereas the `DELETE` command retains the metadata.


7. Are there any storage or compute costs associated with views?

   _Ans_:

      - Regular views only incur compute costs but do not incur any storage cost.

      - Only Materialized views incur storage and compute cost.


8. What is the difference between a fully qualified object name and a partially qualified object name?

   _Ans_:

   - Fully qualified object name: `<database>.<schema>.<table/view/procedure/stream/>`

   - Partial qualified name: `<table/view/procedure/stream/function>`

   - Partial qualified name is tied to the Worksheet's database and schema and can mislead the manipulation. Whereas a full qualified object name makes it simpler to use other database objects in a worksheet without explicitly defining the `use database/schema` command.

9. When using stages, what is the default file format? What other file formats does Snowflake support?

   _Ans_:

   - Default file format for Snowflake stage's is CSV.

   - However, we can use JSNO, Avro, ORC, Parquet and XML File formats.

10. What is unique about the SNOWFLAKE database that comes with every Snowflake account?

      _Ans_:

      - Two Snowflake databases come with every account, SNOWFLAKE and SNOWFLAKE_SAMPLE_DATA.

      - The SNOWFLAKE database is a system defined, read-only shared database managed and owned by Snowflake Inc.

      - The SNOWFLAKE_SAMPLE_DATA database is imported into the user account at the time of setup.
   
11. In what ways can Snowflake tasks be triggered?

      _Ans_:

      - In Snowflake a task can be triggered in two ways: 

      - On a scheduled defined time while creating the task.

      - Task dependencies can be established by creating child tasks.

      - There is no event source that can trigger a task.

12. Describe the `METADATA$ACTION`, `METADATA$ISUPDATE`, and
    `METADATA$ROW_ID` columns in a Snowflake stream.

      _Ans_:

      - `METADATA$ACTION`: Specified the INSERT or DELETE action.

      - `METADATA$ISUPDATE`: Specifies whether the INSERT or DELETE action is part of an UPDATE applied to the rows in the source table or view.

      - `METADATA$ROW_ID`: Specifies the unique and immutable ID for the row, which can be used to track changes to specific rows over time.


13. Give examples of use cases or reasons why you might want to use Snowflake streams.

      _Ans_:

      - To handle changing data sets.
      
      - To keep the staging table and production table in sync.

      - Using stream on a staging table to load data to production table is reliable way.