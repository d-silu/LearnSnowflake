**DDL Commands**

- DDL: _Data Definition Language_

- SQL commands used to define the database schema.

- These commands create, modify and delete database structures or objects, but do not manipulate data.

- E.g. : `CREATE`, `ALTER`, `TRUNCATE`, `RENAME`, `DROP`, `DESCRIBE`, `SHOW`, `USE`, `SET/UNSET`, `COMMENT`

**DCL Commands**

- DCL: _Data Control Language_.

- SQL commands used to enable access control.

- E.g.: `GRANT`, `REVOKE`

**DML Commands**

- DML: _Data Manipulation Language_

- SQL commands used to manipulate the data.

- E.g.: `INSERT`, `MERGE`, `UPDATE`, `DELETE`, `COPY INTO`, `PUT`, `GET`, `LIST`, `VALIDATE`, `REMOVE`

**TCL Commands**

- TCL: _Transaction Control Language_

- SQL commands used to manage transaction blocks within Snowflake.

- E.g.: `BEGIN`, `COMMIT`, `ROLLBACK`, `CREATE`

**DQL Commmands**

- DQL: _Data Query Language_

- SQL commands used as either a statement or a clause to retrieve data.

- E.g. `SELECT`, `FROM`, `WHERE`, `GROUP BY`, `ORDER BY`, `HAVING`, `WINDOW`, `LIMIT/FETCH`

- Snowflake can be access via the Web UI, SnowSQL CLI, JDBC/ODBC connectors.

- An uncorrelated subquery is an independent query that doesn't depend on any columns of the outer query.

- An uncorrelated subquery returns a single result that is used by the outer query only once.

- A correlated subquery references one or more external columns.

- A correlated subquery is evaluated on each row of the outer query table and returns one result per row that is evaluated.

- Derived column values are also referred as *computed column values* or *virtual column values*.

- Derived columns are not stored physically, rather are recalculated each time they are referenced in a query.

- *Note*: When inserting multiple rows of data into a VARCHAR data type, each data type being inserted into VARCHAR columns must be the same or else the insert will fail.

    e.g. A VARCHAR data type can accept data values such as the word one or the number 1, but never both the types of values in the same INSERT statement.

    ```sql
    INSERT INTO TEST1(ID, DEPT)
    VALUES (1, 'one'), (2,2);
    ```

**Query Operators**

- *Arithmetic Operators*

    - +, - , *, /, %

    - Subtraction is the only arithmetic operation allowed on DATE expressions.

- *Comparison Operators*

    - Mostly used in a WHERE clause.

    - Equal (`=`), Not equal (`!=` or `<>`), Less than (`<`), Less than or equal (`<=`), Greater than (`>`), Greater than or equal (`>=`)

- *Logical Operators*

    - Only used in WHERE clause.

    - Order of precedence: NOT, AND OR.

    

- *Subquery, and set set operators.

-