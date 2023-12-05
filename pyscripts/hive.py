from pyhive import hive

# Hive connection parameters
host_name = "localhost"
port = 10000  # default HiveServer2 port
user = "hive"
password = ""
database = "ssb"

# Establish the connection
conn = hive.Connection(host=host_name, port=port, username=user, database=database)

# Create a cursor
cursor = conn.cursor()

# Example query
query = "SHOW DATABASES"

# Execute the query
cursor.execute(query)

# Fetch results
for result in cursor.fetchall():
    print(result)

# Close the cursor and connection
cursor.close()
conn.close()
