**Benifits of Cloud Computing**

- Doesn't require users to be directly or actively involved in the management of those computer system resources.

- Access to unlimited storage capacity, automatic software updates, instant scalability, high speed, and cost reduction.

**Advantages of Snowflake**

1. **Cloud-Based SaaS Architecture**: Snowflake is built on a cloud-native architecture and runs on public clouds like AWS, Azure and GCP. Snowlfake is a true SaaS tool with no manual maintenance, updatation, and patchup.

2. **User Friendly Unistore UI**: Snowflake supports data lake, data collaboration, data analytics, data applications, data science, data sharing, cybersecurity on a single platform.

3. **Data Warehousing**: Snowflake serves as a fully managed data warehouse, enabling organizations to store and analyze large volumns of structured and semistructured data efficiently.

4. **Infinite Scalability**: Snowflake's unique architecture allows for infinite scalability of both storage and compute resources without impacting performance. 

5. **Multi-Cluster Workload**: Snowflake supports multiple compute clusters for concurrent workloads.

6. **Multi-Cloud support**: Snowflake can run across multiple cloud providers, ensuring flexibility and avoiding vendor lockin.

7. **Automatic Compute Resource Scaling**:  Snowflake automatically scales resources up or down based on demand, ensuring optimal performance and cost efficiency.

8. **Security Features**: Snowflake security features include data encryption at rest and in transit, role-based access control (RBAC), and support for single-sign-on (SSO) ensuring the protection of sensitvie data.

9. **Zero-Copy Cloning**: Snowflake allows users to copy a whole database or specific objects without duplicating the physical data. In turn this reduces storage costs.

10. **Secure Data Sharing**: Organizations can securely share data with external parties, facilitating collaboration and data monetization without the need for complex data movement.

11. **Schema-on-Read Approach**: Snowflake supports a schema-on-read approach, allowing users to store semi-structured data and apply the structure when querying, offering flexibility in data storage and analysis.

12. **TIme Travel and Versioning**: Snowflake provides features like time travel and versioning allowing users to <u>view historical data and worksheets</u> and revert to previous state, aiding in auditing and compliance.

13. **Cost-effectiviness**: Snowflake's pay-per-use principle model allows users to only pay of the resources they use.

14. **Felixible Integration**: Snowflake integrates seamlessly with various data sources, third-party tools, drivers and and analytics platforms. 

15. **Multi-language Develop Support**: With Snowpark developers, data scientists, and data engineers can use Java, Python and Scala to deploy code in a serverless manner on cloud.

16. **Regular Updates**: Snowflake deploys two scheduled release each wekk and one behavior change realease each month.

**Limitations of Snowflake**

1. **Pricing Complexity**: Though Snowflake is cost-effective, its <u>biling structure can be complex</u> for some users, and organizations with unpredictable data workloads. Need careful monitoring and cost management.

2. **Lack of Customization**: Snowflake's managed service approach limits the ability to customize the underlying infrastructure. Not suitable for organizations with highly specialized needs or specific performance requirements.

3. **Geographical Data Residency**: Compliance with data residency requirements may be a concern for organizations operating on restricted and regulated regions.

4. **Vendor Lock-in**: Data migration operations on Snowflake can be challenging due to its unique architecture and proprietary features. Which creates dependency on the platform and limit options for future changes.

5. **Dependancy on Internet or Limited Offline Access**: Being a cloud-based solution, Snowflake requires stable internet connection.  ETL workload of Organizations with specific network constraint may suffer greatly.

6. **Integration Limitations**: Integration of specific tools or legacy systems might require additional development and workaround.

7. **Learning Curve**: Implementing and optimizing Snowflake might require a learning curve for users unfamiliar with cloud data warehouses and specific Snowflake features.

**Snowflake Timeline**

- **2012** - Snowflake's founders started on the Idea of cloud-native, scalable warehouse solution.

- **2015** - Snowflake's cloud-build data warehouse become commercially available.

- **2018** - Snowflake introduced <u>*Secure Data Sharing*</u> capabilities.

- **2021** - Snowflake introduced the ability to manage multiple accounts with ease using Snowflake Organizations.

- **June 2021** - Snowflake introduced <u>*Snowpark* a multi-lingual developer framework</u>.

- **2021** - *Snowsight* was introduced as the <u>default user interface</u> in newly created Snowflake accounts.

- **2022** - Snowflake introduced <u>*Security Data Lake* to empower cybersecurity work loads</u> reducing the dependancy on SIEM tools.

- **June 2022**: Snowflake introduced <u>Materialized tables</u>.

**Snowsight Preference**

- Snowflake Support is available from within the User menu.

- Support is not available for free trial accounts.

- Snowsight supports <u>versioning of worksheets</u>, user can revert back to a particular version at any time.

- <u>Context setting</u> is like selecting the Virtual Warehouse, User, Role, Database, and Schema to be used in the worksheet.

- <i>Context</i> for a worksheet can be set using the <u>drop-down menu or by executin a query with `USE` command</u>.

- For <i>Snowflake trial org accounts</i> <u>default role is SYSADMIN</u> and <u>default virtual warehouse is `COMPUTE_WH`</u>.

- `Ctrl + Enter` is the shortcut for Run botton.

- The 4 buttons on below the query pane and to the right of the object listings:
  
  - <button type="button">Objects</button> Whether you see the objects to the left of the screen.
  
  - <button type="button">Query</button> Deselecting this buttons hides query pane, showing a full view of the results.
  
  - <button type="button">Results</button> Selecting this buttons also gives a full view of the results.
  
  - <button type="button">Chart</button> Selecting this button deselects Results and shows charts for the result.

- 
