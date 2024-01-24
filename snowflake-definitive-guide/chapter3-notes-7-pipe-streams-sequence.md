- *Pipes* are objects that contain a COPY command that is used by Snowpipe.

- Snowpipe is used for continous, serverless loading of data into a Snowflake target table.

- Snowflake *Streams*, also known as change data capture (CDC), keep track of certain changes made to a table including inserts, updated, and deletes.

- A *Sequence* object is used to generate unique numbers. Sequences are often used as surrogate keys for primary key values.

- Sequences are user-defined database objects; thus, the sequence value can be shared by multiple tables because sequences are not tied to any specific table.

- Creating and using a sequence
  
  ```sql
  CREATE OR REPLACE SEQUENCE SEQ_01 START = 1 INCREMENT = 1;
  
  SELECT SEQ_01.NEXTVAL;
  ```

- Alternative to use a sequence is identity columns which can generage auto-incrementing numbers.

- Every stream contains 3 metadata columns:
  
  - `METADATA$ACTION` : Tells the kind of operation happened, i.e. inserted or deleted.
  
  - `METADATA$ISUPDATE` : Shows TRUE when the table is updated.
  
  - `METADATA$ROW_ID` : Unique hash key of the operation

- Snowflake streams are a powerful way to handle changing data sets.

- One of the most important reasons for using table streams is to keep the staging table and production table in sync.

- A staging table is used along with streams, helps to protect undesired changes from being made to the production table.

- Creating streams
  
  ```sql
  CREATE OR REPLACE STREAM <stream-name> 
  ON TABLE <table-name>;
  
  SELECT * FROM <stream-name>;
  ```
