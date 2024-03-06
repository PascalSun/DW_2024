#!/bin/bash
echo "Starting SQL Server..."
# Start SQL Server in the background
/opt/mssql/bin/sqlservr &
# Function to check if SQL Server is ready
check_sql_server() {
  /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "YourStrongPassw0rd" -Q "SELECT 1" > /dev/null 2>&1
  return $?
}

# Wait for SQL Server to start
echo "Waiting for SQL Server to start..."
until check_sql_server; do
  echo "SQL Server is not ready yet. Waiting..."
  sleep 5
done

echo "SQL Server is up and running. Executing install.sh script..."
./install.sh

echo "install.sh script execution complete. SQL Server will continue to run."

# Keep the script running to allow SQL Server to remain in the foreground
wait