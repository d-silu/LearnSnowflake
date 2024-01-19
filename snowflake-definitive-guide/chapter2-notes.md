**Shared-Disk Architecture**

![](./images/shared-disk.png)

- Data is stored in a central storage location and is accessible from multiple database cluster nodes.

- Data is constantly available to all cluster nodes.

- All data modifications are written to the shared disk.

- _Limitations_:
  
  - Limited by the performance of the disk.
  
  - Requires complex on-disk locking mechanism to ensure data consistency, which causes <u>bottlenecks</u>.
  
  - Data concurrency problem
  
  - Adding more compute nodes

- _Example_: Oracle RAC

**Shared-Nothing Architecture**

![](./images/shared-nothing.png)

- Storage and compute are scaled together.

- _Limitations_:
  
  - Limited by the need to distribute and query data across nodes.
  
  - <u>Overhead</u>: Distributed cluster nodes along with the associated disk storage, CPU, and memory requires data to be shuffled between nodes.
  
  - Resizing a cluster is time consuming.

- _Example_: IBM DB2, Vertica, and Pivotal Greenplum.

**NoSQL Databases - _"Not Only SQL"_**

- Shared -nothing architecture.

- Stores nonrelational data without first requiring transformation of the data.

- Does not require schema.

- Good choice for storing email, web links, social media posts and tweets, road maps, and spatial data.

- There are <u>four</u> types of NoSQL DBs:
  
  1.  Document stores: _MongoDB_
  
  2. Key-value (KV) stores: _DynamoDB_
  
  3. Column family data stores / Wide column data stores: _Cassandra_
  
  4. Graph DBs: _Neo4j, Amazon Neptune_

- Great for Create Read Update and Delete (CRUD) operations.

- <i>Limitations</i>:
  
  - Poor performance on complex calculations like aggregations, window functions, arbitrary ordering, etc.
  
  - Not recommended for ad-hoc analysis
  
  - Users need specialized skills and not compatible with SQL-based tools.

**Snowflake Architecture**

![](./images/sf-architecture.png)

- Storage and compute are physically separated, but logically integrated.

- 
