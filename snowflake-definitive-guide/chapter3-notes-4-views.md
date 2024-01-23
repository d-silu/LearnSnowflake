- Views are of two types: materialized and nonmaterialized.

- By default, nonmaterialized view is created.

- A view is considered to be a virtual table created by a query expression.

- Purpose of view is to display selected rows and columns from one or more tables.

- Creating Materialized views requires Snowflake Enterprise Edition.

    ```sql
    USE ROLE SYSADMIN;

    CREATE OR REPLACE MATERIALIZED VIEW <view-name>AS
    SELECT CC_NAME
    FROM (
        SELECT * 
        FROM <any-table>
    );
    ```

- Creating a Materialized view requires a warehouse.

- A materialized view object gets periodically refreshed with the data from the base table.

- Materialized views are generally used to aggregate as well as filter data so that the results of resource-intensive operations can be stored in a materialized view for improved data performance.

- <u>Data accessed through materialized view is always current, regardless of the amount of DML that has been performed on the base table.</u>

- It is not possible to use the INSERT, UPDATE or DELETE command on views.

- Using the view in subquery, it is possible to update a base table.

    ```sql
    DELETE FROM <base-table> WHERE <column-name> >
    (SELECT AVG(column) FROM <view-name>);
    ```

- A view definition cannot be updated with ALTER VIEW command, but using ALTER MATERIALIZED VIEW command can be used to rename a materialized view, to add or replace comments, to modify the view to be a secure view, etc.

- Changes to a source table's structure do not automatically propagate to views. e.g. dropping a table column won't drop the column in the view.

**When to Use Which View**

- When to use <i>regular or nonmaterialized view</i>:

    - when the results of the view change frequently.
    
    - The underlying query isn't so complex and expensive to rerun.

- When to use <i>materialized view</i>:
    
    - The query consumes a lot of resources

    - Results of the view are used often

    - Underlying table doesn't change frequently.

    - If a table needs to be clustered in a multiple ways, materialized view can be used with a cluster key that is different from the cluster key of the base table.


- Materialized view can query only a single table, and joins are not supported.