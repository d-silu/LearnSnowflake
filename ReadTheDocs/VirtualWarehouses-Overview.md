**Virtual Warehouse**:

- A cluster of compute resources in Snowlake.

- A virtual warehouse is available in two types: Standard, Snowpark-optimized.

- Warehouse provides the required resources i.e. CPU, memory, and temporary storage to execute sql queries, to perform DML operations, loading and unloading of tables.

- While a warehouse is running it consumes Snowflake credits.

- Warehouses can be started and stopped at any time.

- Warehouses can be resized at any time, even while running, to accomodate the needs for more or less compute resources, based on the type of operations being perormed by the warehouse.

- Default size of warehouse created in Snowsight and CREATE WAREHOUSE query is **X-small**.

- Default size of warehouse created using Classic Console is **X-Large**.

- Warehouse of size **5X-Large** and **6X-Large** are availave on _AWS regions_, and _in preview in US Governement (requires FIPS support on ARM) and Azure regions_.
  
  | Warehouse Size | Credits/Hour | Credits/Second |
  | -------------- | ------------ | -------------- |
  | X-Small        | 1            | 0.0003         |
  | Small          | 2            | 0.0006         |
  | Medium         | 4            | 0.0011         |
  | Large          | 8            | 0.0022         |
  | X-Large        | 16           | 0.0044         |
  | 2X-Large       | 32           | 0.0089         |
  | 3X-Large       | 64           | 0.0178         |
  | 4X-Large       | 128          | 0.0356         |
  | 5X-Large       | 256          | 0.0711         |
  | 6X-Large       | 512          | 0.1422         |

- Snowflake uses per-second billing with a 60-second minimum each time the warehouse starts.
  
  | Running TIme | Credits (X-Small) | Credits (X-Large) |
  | ------------ | ----------------- | ----------------- |
  | 0-60 Seconds | 0.017             | 0.267             |
  | 61 seconds   | 0.017             | 0.271             |
  | 2 minutes    | 0.033             | 0.533             |
  | 10 minutes   | 0.167             | 2.667             |
  | 1 hour       | 1.000             | 16.000            |

- For multi-cluster warehosue, the number of credits billed is calucalated based on the warehouse size and the number of clusters that run within the time period.

**Impact of Warehouse Size on Data Loading and Query Processing**

- Warehouse size does not always improve data loading performance.

- Data loading performance is influenced more by the number of iels being loaded and the size of each file.

- Unless hundreds or thousands of files are being loaded, using a smaller warehouse like Small, Medium and Large is sufficient.

- Query performance scalses with warehouse size, as larger warehouse containes provides more compute power.

- A warehouse can be resized at any time, and the additional resources do not impact any running queries. 

- After the compure resources are fully provisoned, they become available for use by queued or newly submitted queries.



- Snowflake warehouses has auto-suspend and auto-resume enabled by default.

- Auto-suspend and auto-resume _apply to the entire warehouse and not to the individual clusters in the warehouse_.

- Number of queries that a warehouse can process is determined by the size and complexity of each query.

- If queries are queuing more than desired, another warehouse can be created and queries can be manually redirected to the new warehouse, as well as can be resized the warehouse for use.

- Warehouse resizing is primarily intended for improving query performance.

- Multi-cluster warehouse offers _automated_ warehouse scaling for concurrency to create additional warehouses and redirecting queries without any manual intervention.

- Multi-cluster warehouses are an Enterprise Edition feature.

- When a session is initiated in Snowflake, the session does not by default have a warehouse associated with it.

- Until a session has a warehouse associated with it, queries cannot be submitted within the session.

- Snowflake supports specifying a default warehouse for each individual user to facilitate querying immediately after a session is initiated.

- The default warehouse for a user is used as the warehouse for all sessions initiated by the user.

- A default warehouse can be specified when creating or modifying the user, either through the web interface or using `CREATE USER`/`ALTER USER`.

- Apart form users, Snowflake clients liek SnowSQL, JDBC driver, ODBC driver, Python Connectors can have default warehouse as a connection parameter when initiating a session.




























