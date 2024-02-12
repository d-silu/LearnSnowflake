- **Data Types**: The type of column to store a particular type of data.
- **Data Structure Types**: File storage structures.

    - Structured Data - CSV, TSV
    - Semi-structured Data - XML, JSON, AVRO, Parquet, ORC, TXT files with semistructured data layout.
    - Unstructured Data - MP3, MP4, PNG, PDF, etc.

- To store semi-structured data, Snowflake provides VARIANT data type.

- Snowflake added support for Unstructured data in August 2021.

- Snowflake's goal is to make it very easy for you to combine all three types of data so that you can analyze and process it together rather than needing to use multiple tools to do your data work. 

- A Proof of Concept (PoC) needs just enough data development to show a concept or idea to others which will give them a rough idea of how the app would behave.

- Snowflake has tools for leaving data in files. These files can be left in cloud folders like AWS S3 buckets.

- **Snowflake Stages**

    - It's a named gateway that allows Snowflake users to easily connect to cloud folders and access the data stored in them.

- If we don't tell Snowflake anything about our file structure, what will it presume about the structure?

    - The file data is flat.

    - The data rows are separated by Carriage Return/Line Feed symbols.

    - The data columns are separated using commas.

- Many data files use CRLF (Carriage Return Line Feed) as the record delimiter, so if a different record delimiter is used, the CRLF can end up displayed or loaded.

- 13 is the ASCII for Carriage return, hence chr(13) = carriage Return Character.
- 10 is the ASCII for Line Feed, chr(10) = Line Feed Character.

- The  SELECT $1 Query method won't work for Unstructured Data, neither will file formats.

- **Directory Tables.**
    - They are attached to a Stage (internal or external).  
    - You have to enable them.
    - You have to refresh them.

- What is it called when we put one function inside of another? : _Nesting_

- Cross Joins are also called "cartesian products" and many times when data professionals talk about cartesian products they are describing a bad join that resulted in many more records than they intended.


**DATA LAKE**

- The Data Lake metaphor was introduced to the world in 2011 by James Dixon, who was the Chief Technology Officer for a company called Pentaho, at that time.

<u><i>If you think of a data mart as a store of bottled water -- cleansed and packaged and structured for easy consumption -- the data lake is a large body of water in a more natural state. The contents of the data lake stream in from a source to fill the lake, and various users of the lake can come to examine, dive in, or take samples.</i></u>

- When we talk about Data Lakes at Snowflake, we tend to mean data that has not been loaded into traditional/native Snowflake tables.