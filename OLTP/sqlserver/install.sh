#!/bin/bash
# Set SQL Server command-line tool (sqlcmd) environment variables
export SA_PASSWORD=YourStrongPassw0rd
export SERVER=localhost

echo $SA_PASSWORD
echo $SERVER
# Create databases
/opt/mssql-tools/bin/sqlcmd -S $SERVER -U SA -P $SA_PASSWORD -Q "CREATE DATABASE Adventureworks;"
/opt/mssql-tools/bin/sqlcmd -S $SERVER -U SA -P $SA_PASSWORD -Q "CREATE DATABASE AdventureworksDW;"
/opt/mssql-tools/bin/sqlcmd -S $SERVER -U SA -P $SA_PASSWORD -Q "CREATE DATABASE AdventureworksDWDemo;"

