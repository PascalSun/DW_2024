#!/bin/bash

# Set SQL Server command-line tool (sqlcmd) environment variables
export SA_PASSWORD=YourStrong!Passw0rd
export SERVER=localhost

# Create databases
/opt/mssql-tools/bin/sqlcmd -S $SERVER -U SA -P $SA_PASSWORD -Q "CREATE DATABASE Adventureworks;"
/opt/mssql-tools/bin/sqlcmd -S $SERVER -U SA -P $SA_PASSWORD -Q "CREATE DATABASE AdventureworksDW;"
/opt/mssql-tools/bin/sqlcmd -S $SERVER -U SA -P $SA_PASSWORD -Q "CREATE DATABASE AdventureworksDWDemo;"

# Assuming the .sql files are adapted for SQL Server and placed in the respective directories
# Import the .sql files into the respective databases
#/opt/mssql-tools/bin/sqlcmd -S $SERVER -U SA -P $SA_PASSWORD -d Adventureworks -i /data/AdventureWorkOLTP/install.sql
#/opt/mssql-tools/bin/sqlcmd -S $SERVER -U SA -P $SA_PASSWORD -d AdventureworksDW -i /data/AdventureWorkDW/install.sql
#/opt/mssql-tools/bin/sqlcmd -S $SERVER -U SA -P $SA_PASSWORD -d AdventureworksDWDemo -i /data/AdventureWorkDWDemo/installdemo.sql
