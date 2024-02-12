### **Snowflake Pricing**

----------

- The Snowflake architecture *separates data warehousing into three distinct layers*: **storage, virtual warehouses (compute)**, and **cloud services**. 

- Snowflake pricing is based on the actual usage of these layers and of serverless features.

- **Snowflake Credit**

    - Snowflake credits are used to pay for the consumption of resources on Snowflake. 
    - A Snowflake credit is a unit of measure, and it is consumed only when a customer is using resources, such as when a virtual warehouse is running, the cloud services layer is performing work, or serverless features are used.


- **Storage**

    - A monthly fee for data stored in Snowflake is caclulated using the average amount of storage used per month after compression.

    - Depending on file types, compression can reduce the total storage needs substantially.

- **Virtual Warehouses (Compute)**

    - One or more compute clusters that enable customers to load data and perform queries.

    - Customers pay for virtual warehouses using Snowflake credits.

    - Snowflake supports a wide range of virtual warehouse sizes: X-small, Small, Medium, Large, X-Large, 2X-Large, 3X-Large, etc. 

    - The size of the virtual warehouse determines how fast queries will run.

    - When a virtual warehouse is paused, it doesn't consume Snowflake credits.
    
    - Snowflake warehouses are billed per second with a one-minute minimum.

    |Warehouse Size|Standard|Snowpark-Optimized|
    |--------------|--------|------------------|
    |XS|1|N/A|
    |S|2|N/A|
    |M|4|6|
    |L|8|12|
    |XL|16|24|
    |2XL|32|48|
    |3XL|64|96|
    |4XL|128|192|
    |5XL|256|384|
    |6XL|512|786|


- **Cloud Services**

    - Provides all permanent state management and overall coordination of Snowflake.
    - Cloud services resources are automatically assigned by Snowflake based on the requirements of the workload. 
    - Customers pay for cloud services using Snowflake credits.
    - Typical utilization of cloud services (up to 10% of daily compute credits) is included for free, which means most customers will not see incremental charges for cloud services usage.

- **Serverless Features**

    - Snowflake offers some serverless features that use Snowflake-managed compute resources and consume Snowflake credits when they are use.

    1. **Snowpipe & Snowpipe Streaming**

        - Rapidly ingests streaming data.

        - Is an automated service.

        - Requires no virtual warehouses.

        - Uses Snowflake-managed compute resources, which are paid for with Snowflake credits and are billed per second, plus incurs a fixed Snowflake credit charge per file.

    2. **Database Replication**

        - Seamlessly replicates data across regions and cloud platforms.

        - Requires no virtual warehouses.

        - Uses Snowflake-managed compute resources, which are paid for with Snowflake credits and are billed per second, plus incurs standard storage and data transfer costs.
    
    3. **Materialized Views Maintentance**

        - Automatically syncs materialized views with underlying base tables.

        - Requires no virtual warehouses.

        - Uses Snowflake-managed compute resources, which are paid for with Snowflake credits and are billed per second.
    
    4. **Automatic Clustering**

        - Maintains optimal clustering state using defined cluster keys.

        - Applies to tables and materialized views.

        - Uses Snowflake-managed compute resources, which are paid for with Snowflake credits and are billed per second.

    5. **Searh Optimization Service**

        - Greatly speed up point lookup queries in massive tables.

        - Pair SOS with smaller virtual warehouses to lower costs.

        - Uses Snowflake-managed compute resources, which are paid for with Snowflake credits and are billed per second.
    

- **Snowflake Editions**

    - Snowflake offers four different Editions:

        1. Standard

        2. Enterprise

        3. Business Critical

        4. Virtual Private Snowflake

- **Buying Snowflake Service**
    - There are two ways to buy the Snowflake Service: *On Demand* or *Pre-paid Capacity*.

    - **On Demand**

        - The easiest and most flexible way to purchase the Snowflake Service is On Demand. 
        
        - Similar to Amazon AWS, customers are charged a fixed rate for the services that are consumed and are billed in arrears every month.

    - **Pre-Purchased Capacity**

        - Snowflake provides customers the option to pre-purchase Capacity. 
        
        - A capacity purchase is a specific dollar commitment to Snowflake. 
        
        - The Capacity purchased is then consumed on a monthly basis. 
        
        - Capacity purchases provide more service options, lower prices, and a long-term price guarantee.

        - For a capacity purchase, the price of Snowflake credits is determined at the time the order is placed and is based on the size of the total committed customer purchase.

- **Data Transfer**: Customers who wish to move or copy their data between regions or clouds will incur data transfer charges. Features such as External Tables, External Functions and Data Lake Export may incur data transfer charges.

[Snowflake Pricing Guide](https://www.snowflake.com/pricing/pricing-guide/)


- **Q**: Snowflake cost is broken into 4 categories:

    - The average compressed storage used per month.

    - Compute credits based on the amount of time various warehouses were in use.

    - Cloud services like state management and coordination.

    - Serverless features like Snowpipe, replication and clustering.


[Snowflake Pricing](https://www.snowflake.com/en/data-cloud/pricing-options/)

- Formula for Costs of Compute : ${Credit Cost * Credits Per Hour * Hours}$

- Replication will happen on the PROVIDING account and not on the CONSUMING account.

- In the real world, most people will have roles that are: 

    - Not able to create a Warehouse.
    - Not able to change the size of a Warehouse.
    - Not able to modify Resource Monitors.
    - Not be able to view, create, or modify Budgets.

- Just because the the resource monitor notifies and suspends at 95% usage, doesn't mean you won't use 100% of the quota. There is some reporting lag time that can come into play so that your resource monitor is not able to shut things down at exactly 95%. If you need to be more conservative in keeping costs below a certain amount, you might use settings like 70/80/90 or even 65/75/85.

- There are two options for Monitor Type when setting up the Resource Monitor.

    - ACCOUNT

    - WAREHOUSE

- In production usage, two completely different companies cannot see each other's usage. 

- Resource Monitors allow you to track and control Warehouse/Compute usage, but as Snowflake users become more sophisticated using many serverless tasks and advanced features, Budgets have been added so that users have similar tracking and control for other aspects of Snowflake. 

- **Budgets**

    - Budgets are only available in Paid Accounts.
    - Once a Trial Account has been converted to paid, Budgets will need to be activated.
    - Budgets are needed in additon to Resource Monitors because they include projections.
    - Budgets are needed in additon to Resource Monitors because they cover more usage types.

