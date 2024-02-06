- Worksheets are the place where teammates will be able to
write, run, save, and share code.

- Every worksheet
has four configuration settings thatvare saved with the worksheet and are called the *context settings*.

- In Snowflake, Warehouses are "workforces" -- they are used to perform the processing of data. 

- Snowflake Warehouse Sizes like eXtra-Small, Small, Medium, etc. all have one cluster. 

- A small warehouse has one cluster made up of just a few servers. A larger warehouse has one cluster, made up of more servers.

- Cluster just means a "group" of servers.

- All warehouses have a single cluster until scaled OUT.

**Scaling Warehouse UP/DOWN**
- Changing the size of warehouse changes the number of servers in the cluster. 

- Changing the size of an existing warehouse is called scaling up or scaling down.

**Scaling Warehouse In/Out**

- If multi-cluster/elastic warehousing is available (Enterprise edition or above) a warehouse is capable of scaling out in times of increased demand.  (Adding temporary teams, made up of a collection of temporary workers). 
- If multi-cluster scaling out takes place, clusters are added for the period of demand and then clusters are removed (snap back) when demand decreases. (Removing temporary teams). 
- The number of servers in the original cluster dictates the number of servers in each cluster during periods where the warehouse scales out by adding clusters. 

- Opposite of scalling out is Snapping Back or scalling in.

- The word "metadata" means "data about data."

- The INFORMATION_SCHEMA that gets created in every Snowflake Database holds metadata. In other words, it holds statistics about the number of databases, schemas, tables, views and more. It also holds data about the object names and other object details. 