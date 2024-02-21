### **Project Kick-Off**
- Data Engineers will use a role like SYSADMIN for most of their tasks. SYSADMIN is a creative role and Data Engineers are creative creators.

- Data Engineers in most companies don't even have the ACCOUNTADMIN role. You may use this role a time or two, but not often. When in doubt, SYSADMIN is the role to choose! 

- To set SYSADMIN as default role `ALTER USER <my user name> SET DEFAULT_ROLE = 'SYSADMIN';`

- **Note**
    - AWS bucket names cannot have underscores. 
    - Snowflake stage names cannot have dashes.

### **Time Zones Around the World**

- [Timeanddate Map](https://www.timeanddate.com/time/map/)

- The Prime Meridian (Zero Longitude) flows through Greenwich, England, United Kingdom, the time in that region has historically been used as THE starting point for other time zones.

- **GMT**: Greenwich Mean Time; **UTC**: Universal Coordinated TIme; **NTZ**: No Time Zone; **LTZ**: Local Time Zone;

- **GMT+3**: Whatever time it is in Greenwich, England, plus 3 hours.

- **GMT-4**: Whatever time it is in Greenwich, England, minus 4 hours.

- GMT+0 and UTC+0 not result in the same timestamps.

- UTC TImestamp Storage Format:

    `YYYY-MM-DDTHH:MI:SS.SSSOFFSET DIRECTION HH:MI`

    - `YYYY`: 4-digit Year.
    - `MM`: 2-digit Month.
    - `DD`: 2-digit Day.
    - `HH`: Hour
    - `SS.SSS`: 2-digit Seconds and 3-digit Milliseconds.
    - `+/-`: Direction of offset from UTC+0
    - `HH:MI` offset hour and minute amount that the time represents from UTC.

- `-0600` is the same thing as UTC-6.

- Every Snowflake Account's time zone is initially set to UTC-7. Because that's the time zone for San Mateo, California, where the Snowflake was founded.

- To change the timestamp on a Snowflake worksheet:

    ```sql
    alter session set timezone = 'Asia/Kolkata';
    select current_timestamp();
    ```

- Snowflake uses [IANA list](https://data.iana.org/time-zones/tzdb-2021a/zone1970.tab) for time zone names.

- The work of a Data Engineer is to take RAW data and refine that data until it matches what the customer`*` is looking for.

    - `*`A customer is any person, department or organization that you are trying to help by delivering data in a certain format. 

- Data Engineers often perform a series of ETL steps and so they have different "layers" where data is expected to have reached certain levels of refinement or transformation.

- Snowflake's Query Profiler tells how the query is materialized and where it's expensive. 

- Snowflake `COPY INTO` statement is smart enough to know which files it already loaded and it doesn't load the same file, twice.

    - Add a FORCE=TRUE to `copy_into` statement for duplicate load.

- Forgotten Tasks Can Eat Up Credits, Fast.

- When you have tasks that are dependent on other tasks, you must resume the dependent tasks BEFORE the triggering tasks.

- But, while suspending tasks the triggering task need to be suspended first before suspending dependent task.

**Merge Statement**

- A SQL merge lets you compare new records to already loaded records and do different things based on what you learn by doing the comparison. 

- To define a very simple merge, we'll first figure out:

    - Where our rows are coming from = our SOURCE. (RAW.LOGS)
    - Where we want to load our rows to = our TARGET.  (ENHANCED.LOGS_ENHANCED)

