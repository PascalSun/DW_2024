-- Create databases
CREATE DATABASE AdventureWorks;
GO

CREATE DATABASE AdventureWorksDW;
GO

-- Create login
CREATE
LOGIN docker
WITH PASSWORD = 'YourStrong!Passw0rd';
GO

-- Create users and assign permissions in AdventureWorks
USE AdventureWorks;
CREATE USER docker FOR LOGIN docker;
ALTER ROLE db_owner ADD MEMBER docker;
GO

-- Create users and assign permissions in AdventureWorksDW
USE AdventureWorksDW;
CREATE USER docker FOR LOGIN docker;
ALTER ROLE db_owner ADD MEMBER docker;
GO

-- Add any additional initialization SQL here
-- For example, table creation, data seeding, etc.
