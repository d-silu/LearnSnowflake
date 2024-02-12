- Rename an object: 
    ```sql
    ALTER DATABASE <DB|Table|stage|Pipe|Stream> RENAME TO <new-name>;```

- The select statement can be created as a view like 
    ```sql
    create view intl_db.public.NATIONS_SAMPLE_PLUS_ISO 
    ( iso_country_name
    ,country_name_official
    ,alpha_code_2digit
    ,region) AS
    <put select statement here>
    ;
    ```

- If you find yourself using the logic of a select statement over and over again, it can be more convenient to wrap the statement in a view, and run simple queries on the view. 

- Views can make your code more modular and organized. 