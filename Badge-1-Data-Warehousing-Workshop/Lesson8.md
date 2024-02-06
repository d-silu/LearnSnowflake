- Snowflake stages are
more like cloud folders
or directories where you place files
so that Snowflake services can pick
them up and pull them into database
structures quickly and securely.

- Snowflake has two types of stages.
    
    - Internal stages which act almost like directories inside a Snowflake account's local storage.

    - External stages,and these stages act more like a secure gateway between cloud storage services and Snowflake services.

- To create an
external stage, you will need
a cloud services account.
External stages can be based on any
of the three cloud storage platforms
supported by Snowflake.

- **Components of an External Stage**
    1. Cloud storage location
    2. Cloud storage access credentials.
    3. Stage Definition.

- Snowflake always assumes you really mean to type everything in UPPER CASE so it converts it for you. Because of this, you can type lower case or mixed case when creating or querying objects, and Snowflake will convert it to all upper-case behind the scene.

- Unless you use quotes when creating things, and then you'll have to use quotes forever after that to deal with the object.

-A Snowflake Account on AWS or GCP or Azure can have stage objects that point to, and load files from AWS, Azure and/or GCP.

- To use the COPY INTO statement, it is best to have 4 things in place:

    1. A table 
    2. A stage object
    3. A file
    4. A file format 

    ```sql
    copy into my_table_name
    from @like_a_window_into_an_s3_bucket
    files = ( 'IF_I_HAD_A_FILE_LIKE_THIS.txt')
    file_format = ( format_name='EXAMPLE_FILEFORMAT' );
    ```