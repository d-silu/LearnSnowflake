1) Is the architecture of Snowflake: shared disk? shared nothing? shared data? shared
   memory?

2) Are databases stored within warehouses? Are warehouses stored within databases?

3) Does Snowflake store data with compression? Encryption? Both?

4) When a warehouse is resized, what queries are affected? Only current? Current and subsequent? Only subsequent?

5) Costs are broken down into what two major categories?

6) Storage costs are based on the daily average of stored data. Is this based on the
   data's compressed size or uncompressed size?

7) What things aren't required because Snowflake is a true SaaS solution?

8) Can Snowflake be hosted on a company's internal cloud? What on-premise options are offered by
   Snowflake?

9) Can Snowflake be purchased for installation on a company's internal servers or Virtual Private
   Cloud(VPC)?

10) Snowflake uses MPP compute clusters. Are these called Virtual Data Marts? or Virtual
    Warehouses?

11) Does Snowflake recommend only running no more than 2 warehouses simultaneously to avoid
    contention? 5?

12) Are Snowflake Data Warehouses like Data Marts in that each one is assigned to work on a subset
    of the data stored in the account?

13) What is Partner Connect?

14) How do you access and connect to Partner Connect Partners?

15) What is SnowSQL? How do you get a copy for installation?

16) What drivers, connectors and component collections are available for programmatic interfacing with
    Snowflake?

17) Partners are also classified according to their functionality. “Data Integration” is one category, what are the
    others?

18) If you were presented with a list of the functional categories, could you recognize them?

19) Which functional category do each the following partners fall into? Matillion? Looker? Databricks?

20) Do Python and Node.js require SnowSQL to connect? Are these connectors used instead of the WebUI or in
    addition to it?

21) What is the difference between a Technology Partner and a Solution Partner?

**Account Options & Assurance**:

1) What are some industry compliance standards Snowflake has been certified in or
   awarded?
2) What choices are available when choosing a cloud platform provider for your Snowflake
   account?
3) What are regions and availability zones and how are they affected by your choice of a cloud platform provider?
4) What are the benefits for moving from Snowflake’s Standard Edition to Enterprise?
   What are the benefits for moving from Enterprise to Business Critical?
5) What factors should be considered when choosing the Geographic Region for your
   account?

**Container Hierarchy & Details**

1) How does [Database]->[Schema]->[Table] fit in with [Account]?
2) What are the four types of Snowflake tables and which ones have fail-safe storage?
3) What are the differences between standard and secure views?
4) What are the different types of stages?
5) What are the command-line commands that moves files into stages? What command moves
   files from stages into tables? From tables back out to stages?
6) Disregarding replication functionality, can a database span multiple accounts? Can a schema
   span multiple accounts? Can an account span multiple cloud-as-a-platform providers?
7) Can a single Snowflake account load data from stages on more than one cloud provider?
8) Can you deduce the cloud platform provider and region of an account based on the account
   URL?
9) What is a namespace in Snowflake and how does it relate to the container hierarchy?
1. ### **Loading Options:**
   
   - What are the four supported options for loading data in Snowflake?
   - Can you briefly describe the significance of each option?

2. ### **Understanding Stages:**
   
   - What is the purpose of a stage in data loading within Snowflake?
   - How do internal and external stages differ?

3. ### **Loading Data into Snowflake Tables:**
   
   - What are the main steps to load staged data into Snowflake tables?
   - Why is the concept of a virtual warehouse relevant in this process?

4. ### **Internal vs Externa Stage Types:**
   
   - Name and briefly explain the types of internal and external stages.
   - How does each type serve a different purpose in the data-loading process?



1) What do resource monitors measure?
2) What actions can resource monitors trigger based on usage thresholds?
3) Who can create resource monitors?
4) What are the scheduling options for resource monitor tracking and actions?
5) How are notifications enabled for resource monitors?

1) In what ways does Snowflake protect my data from user errors?
2) Which automatic Snowflake features help to provide business continuity for different types
   of system failures?
3) What are the differences between Time Travel and Fail-Safe?
4) How can I use zero-copy cloning to protect data?
5) What are key requirements for database replication-failover-failback?
