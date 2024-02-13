- Materialized Views, External Tables, and Iceberg Tables provide access to data that has not been loaded.

- **Materialized Views**

    - A Materialized View is like a view that is frozen in place (more or less looks and acts like a table).

    - The big difference is that if some part of the underlying data changes,  Snowflake recognizes the need to refresh it, automatically.

    - Choose to create a materialized view if they have a view with intensive logic that they query often but that does NOT change often.  
    
    - We can't use a Materialized view on top of staged data. 

- **External Table**

    - An External Table is a table put over the top of non-loaded data.

    - An External Table points at a stage folder and includes a reference to a file format

- **Iceberge Tables**

    - Iceberg is an open-source table type, which means a private company does not own the technology. Iceberg Table technology is not proprietary. 
    - Iceberg Tables are a layer of functionality you can lay on top of parquet files (just like the Cherry Creek Trails file we've been using) that will make files behave more like loaded data. In this way, it's like a file format, but also MUCH more. 
    - Iceberg Table data will be editable via Snowflake! Read that again. Not just the tables are editable (like the table name), but the data they make available (like the data values in columns and rows). So, you will be able to create an Iceberg Table in Snowflake, on top of a set of parquet files that have NOT BEEN LOADED into Snowflake, and then run INSERT and UPDATE statements on the data using SQL 🤯. 

**Which of the scenarios below are use cases for data that could remain non-loaded for some period of time?**

- Data Mining
- Machine Learning Explorations for Predictive Models
- Rapid Prototyping
- Proof of Concept Efforts
- Unstructured Data
- Regulated Data that cannot legally be moved.