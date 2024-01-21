1. Name the three Snowflake architecture layers.
   
   <i>Ans</i>: 
   
   - Service Layer
   
   - Compute Layer
   
   - Storage Layer

2. Which of the three Snowflake layers are multitenant?
   
   _Ans_: 
   
   - Snowflake <u>cloud services layer</u> and the <u>data storage layer</u> are multitenant.
   
   - The query processing (virtual warehouse) layer is not multitenant.

3. In which of the three Snowflake architecture layers will you find the
   virtual warehouse cache? The result cache?
   
   _Ans_: 
   
   - Virtual warehouse cache/data cache is implemented in *Virtual Warehouse (compute) Layer*. 
   
   - The Result cache layer and Metadata cache layer presents in the Cloud service layer.

4. If you are experiencing higher than expected costs for Snowflake
   cloud services, what kinds of things might you want to investigate?
   
   _Ans_:
   
   - Simple queries accessing session information or using session variables.
   
   - Large, complex queries with many joins.
   
   - Single-row insertion, rather than bulk or batch loading.
   
   - Frequently use of INFORMATION_SCHEMA commands.
   
   - Frequently use of metadata-oly commands such as the SHOW command.

5. Explain the difference between scaling up and scaling out.
   
   _Ans_:
   
   **Scaling Up**:
   
   - Manual resizing of a virtual warehouse to a larger or smaller size and is most often undertaken to improve query performance and handle large workloads.
   
   **Scaling Out**
   
   - Automatic process of increasing and decreasing the number of compute clusters and is more often used to maximize concurrency, achieved usign multicluster virtual warehouses.

6. What effect does scaling up or scaling out have on storage used in
   Snowflake?
   
   _Ans_: Scaling up/down/in/out can be done with Snowflake compute resource like virtual warehouse. This has no effect on storage.

7. The shared-nothing architecture evolved from the shared-disk
   architecture. NoSQL alternatives have also been created. What one
   main problem have they all been trying to solve?
   
   _Ans_:
   
   - Scalability was the biggest issue in the shared-nothing, shared-disk and NoSQL databases.
   
   - Snowflake minimizes this problem by combining the shared-disk capability to share storage and cloud service; and also implements the shared-nothing architecture by limiting the compute to the individual virtual warehouses.
   
   - Virtual warhouses and storage can be scaled independent of each other.

8. In a Snowflake multicluster environment, what scaling policies can be
   selected?
   
   _Ans_: There are two scaling policies available in Snowflake Multicluster Virtual warhouse:
   
   *Standard*: to minimize query waiting time 
   
   *Economy*: to conserve credits

9. What components do you need to configure specifically for
   multicluster virtual warehouses?
   
   _Ans_:
   
   - Mode:
     
     - Auto-scale: Standard or Economy
     
     - Maximized: both Min cluster and Max cluster are same.
   
   - Min clusters
   
   - Max clusters

10. What are two options to change the virtual warehouse that will be used to run a SQL command within a specific worksheet
    
    _Ans_: 
    
    - Via the drop-down menu on top-right corner of virtual warehouse.
    
    - Using SQL query like `USE WAREHOUSE <warehouse-name>`.
