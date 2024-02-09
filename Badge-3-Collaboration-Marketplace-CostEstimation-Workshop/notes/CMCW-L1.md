- Once an account is provisioned, it cannot be moved to another cloud or region. 

- `select current_region()`

- Every Snowflake Account has an Account Identifier.

    - 🔠 Org ID + . + Account Name =  Account IDENTIFIER

- Every Snowflake Account also has an Account LOCATOR.

- Every Snowflake Account comes with two Databases. 

    - SNOWFLAKE - ACCOUNT_USAGE

        - People at Snowflake often fall into the habit of calling it "the Account Usage Share" -- _because it's a share given to every account and behind the scenes it's based on a direct share called ACCOUNT_USAGE_.

        - Intended to help customers manage and understand their billing and usage. 

        - Can not be dropped, renamed, or altered.

    - SNOWFLAKE_SAMPLE_DATA - SAMPLE_DATA