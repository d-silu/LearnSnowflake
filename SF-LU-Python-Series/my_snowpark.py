from snowflake.snowpark.session import Session
import snowflake.connector as sf
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
# print(connection_parameters)
def create_session_object(connection_parameters=connection_parameters):
    # pass    
    # session = sf.connect(**connection_parameters)
    # cursor = session.cursor()
    # cursor.execute("SELECT * FROM ")
    
    
    # pip install snowflake-snowpark-python
    # pip install snowflake-python-connector
    
    session = Session.builder.configs(connection_parameters).create()
    
    print(session)
    return session

create_session_object()

# https://app.snowflake.com/rozczzy/fs96365/worksheets
