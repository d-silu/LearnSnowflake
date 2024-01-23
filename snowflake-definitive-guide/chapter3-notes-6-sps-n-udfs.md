- Stored procedures and UDFs are used to achieve functionalities that are not possible with Snowflake's built-in functions.

- UDFs can return multiple values (tabular).

- Stored procedures return only a single value.

- Stored procedures return scalar value, but can also return multiple values if the return type is a variant.

- UDFs can be created using SQL, JavaScript, Python and Java.

- It is possible to create secure UDFs.

![](./images/sps-n-udfs.png)

**Difference between UDFs and Stored Procedures**:

|Uer Defined Functions|Stored Procedures|
|---------------------|-----------------|
|Called as part of the SQL statement.|Called as an independent statement using CALL statement.|
|Can return tabular values.|Returns scalar value.|
|To perform some calculation, include a value for every input row.|To perform database operations such as SELECT, DELETE, or CREATE.|

- The CALL statement can call only one stored procedure per statement.

- A SQL UDF evaluates SQL statement and can refer to other UDFs, although <u>a SQL UDF cannot refer to itself either directly or indirectly</u>.

- JavaScript UDFs have access to the basic standard JavaScript library needed to create arrays, variables, and simple objects.

- Math operations and error handling operations cannot be performed with JavaScript UDFs, because Snowflake doesn't support external libraries.

- JavaScript UDFs, and Procedures can be found:

    ```sql
    USE ROLE SYSADMIN;
    
    CREATE OR REPLACE DATABASE DEMO3C_DB;
    
    CREATE OR REPLACE FUNCTION JS_PROPERTIES()
    RETURN string LANGUAGE JAVASCRIPT AS 
        $$ RETURN Object.getOwnPropertyNames(this); $$;
    
    SELECT JS_PROPERTIES();
    ```

