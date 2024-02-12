from snowflake.snowpark import Session
from snowflake.snowpark import functions as F 

import dotenv
import os

dotenv.load_dotenv()

connection_parameters = dict(
    account=os.getenv('ACCOUNT'),
    user=os.getenv('SFUSER'),
    password=os.getenv('PASSWORD'),
    role=os.getenv('ROLE'),
    warehouse=os.getenv("WAREHOUSE"),
    database=os.getenv('DATABASE'),
    schema=os.getenv('SCHEMA')
)

session = Session.builder.configs(connection_parameters).create()

df_table = session.table('LEARNERS_POOL')

df_table.show()