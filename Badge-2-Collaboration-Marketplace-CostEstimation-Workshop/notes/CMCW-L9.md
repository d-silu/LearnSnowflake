- PARSE_HEADER property tells Snowflake to look at that first row and use it to figure out the column names.

- By setting ERROR_ON_COLUMN_COUNT_MISMATCH to FALSE in a file format, we'll be telling Snowflake that it's fine if the file has 3 columns but the table has 18.

- If you want to load a 3-column file into an 18-column table?

    - 

[Scripting](https://docs.snowflake.com/en/sql-reference-snowflake-scripting)