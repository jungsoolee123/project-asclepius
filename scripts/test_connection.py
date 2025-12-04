import os
import snowflake.connector
from dotenv import load_dotenv

# Load environment variables from .env file
load_dotenv()

def test_snowflake_connection():
    """
    Test the connectivity to Snowflake using credentials from .env file.
    """
    try:
        # Establish connection to Snowflake
        print("Attempting to connect to Snowflake...")
        
        conn = snowflake.connector.connect(
            user=os.getenv('SNOWFLAKE_USER'),
            password=os.getenv('SNOWFLAKE_PASSWORD'),
            account=os.getenv('SNOWFLAKE_ACCOUNT'),
            warehouse=os.getenv('SNOWFLAKE_WAREHOUSE'),
            database=os.getenv('SNOWFLAKE_DATABASE'),
            schema=os.getenv('SNOWFLAKE_SCHEMA'),
            role=os.getenv('SNOWFLAKE_ROLE')
        )
        
        # Create a cursor object
        cur = conn.cursor()
        
        # Execute a simple query to verify connection
        cur.execute("SELECT CURRENT_VERSION()")
        one_row = cur.fetchone()
        
        print("Connection Successful!")
        print(f"Snowflake Version: {one_row[0]}")
        
        # Close connection resources
        cur.close()
        conn.close()
        
    except Exception as e:
        print("Connection Failed")
        print(f"Error: {e}")

if __name__ == "__main__":
    test_snowflake_connection()