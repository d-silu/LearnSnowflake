- To create another account from one account, use ORGADMIN. 

- Set role ORGADMIN, Go to Admin>Accounts>Create account.

- Once you add an object to a share it becomes harder to transfer ownership. In that case, you have to remove the object from the share it, transfer ownership on the object, and then add it back to the share.

- When both the providers and consumers are from different cloud and different regions, the provider has to bear the data replication charge.

- When both parties are on same cloud and of same region, then only the consumer has to pay based on their use.

- Snowflake will manage the replication on behalf of the provider, and the database `SNOWFLAKE$GDS` is a reminder of that. 

- **Listing**: 
    
    - A listing is a vehicle for sharing. 
    - A listing not only allows for a nicer name, you can also add information into the listing that will make it much easier for consumers to use your data. 
    - One thing that might make the data easier to use would be adding a Data Dictionary. 

- To convert regular views to secure views

    ```sql
    alter view <view_name>
    set secure;
    ```

- You can't share a share.

- When Data Transfer is chosen as the Usage Type, what will green represent on the graph?: COPY (COPY INTO statements)