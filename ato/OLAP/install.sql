\pset tuples_only on

-- Support to auto-generate UUIDs (aka GUIDs)
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Support crosstab function to do PIVOT thing for Sales.vSalesPersonSalesByFiscalYears
CREATE EXTENSION tablefunc;

-- create dim tables for AdventureWorksDW
CREATE TABLE DimAccount
(
    AccountKey                    SERIAL PRIMARY KEY,
    ParentAccountKey              INT,
    AccountCodeAlternateKey       INT,
    ParentAccountCodeAlternateKey INT,
    AccountDescription            VARCHAR(50),
    AccountType                   VARCHAR(50),
    Operator                      VARCHAR(50),
    CustomMembers                 VARCHAR(300),
    ValueType                     VARCHAR(50),
    CustomMemberOptions           VARCHAR(200)
);


CREATE TABLE DimCurrency
(
    CurrencyKey          SERIAL PRIMARY KEY,
    CurrencyAlternateKey CHAR(3)     NOT NULL,
    CurrencyName         VARCHAR(50) NOT NULL
);

CREATE TABLE DimCustomer
(
    CustomerKey          SERIAL PRIMARY KEY,
    GeographyKey         INT,
    CustomerAlternateKey VARCHAR(15) NOT NULL,
    Title                VARCHAR(8),
    FirstName            VARCHAR(50),
    MiddleName           VARCHAR(50),
    LastName             VARCHAR(50),
    NameStyle            BOOLEAN,
    BirthDate            DATE,
    MaritalStatus        CHAR(1),
    Suffix               VARCHAR(10),
    Gender               VARCHAR(1),
    EmailAddress         VARCHAR(50),
    YearlyIncome         MONEY,
    TotalChildren        SMALLINT,
    NumberChildrenAtHome SMALLINT,
    EnglishEducation     VARCHAR(40),
    SpanishEducation     VARCHAR(40),
    FrenchEducation      VARCHAR(40),
    EnglishOccupation    VARCHAR(100),
    SpanishOccupation    VARCHAR(100),
    FrenchOccupation     VARCHAR(100),
    HouseOwnerFlag       CHAR(1),
    NumberCarsOwned      SMALLINT,
    AddressLine1         VARCHAR(120),
    AddressLine2         VARCHAR(120),
    Phone                VARCHAR(20),
    DateFirstPurchase    DATE,
    CommuteDistance      VARCHAR(15)
);

CREATE TABLE DimDate
(
    DateKey              INT         NOT NULL,
    FullDateAlternateKey DATE        NOT NULL,
    DayNumberOfWeek      SMALLINT    NOT NULL,
    EnglishDayNameOfWeek VARCHAR(10) NOT NULL,
    SpanishDayNameOfWeek VARCHAR(10) NOT NULL,
    FrenchDayNameOfWeek  VARCHAR(10) NOT NULL,
    DayNumberOfMonth     SMALLINT    NOT NULL,
    DayNumberOfYear      SMALLINT    NOT NULL,
    WeekNumberOfYear     SMALLINT    NOT NULL,
    EnglishMonthName     VARCHAR(10) NOT NULL,
    SpanishMonthName     VARCHAR(10) NOT NULL,
    FrenchMonthName      VARCHAR(10) NOT NULL,
    MonthNumberOfYear    SMALLINT    NOT NULL,
    CalendarQuarter      SMALLINT    NOT NULL,
    CalendarYear         SMALLINT    NOT NULL,
    CalendarSemester     SMALLINT    NOT NULL,
    FiscalQuarter        SMALLINT    NOT NULL,
    FiscalYear           SMALLINT    NOT NULL,
    FiscalSemester       SMALLINT    NOT NULL
);

CREATE TABLE DimDepartmentGroup
(
    DepartmentGroupKey       SERIAL PRIMARY KEY,
    ParentDepartmentGroupKey INT,
    DepartmentGroupName      VARCHAR(50)
);
CREATE TABLE DimEmployee
(
    EmployeeKey                          SERIAL PRIMARY KEY,
    ParentEmployeeKey                    INT,
    EmployeeNationalIDAlternateKey       VARCHAR(15),
    ParentEmployeeNationalIDAlternateKey VARCHAR(15),
    SalesTerritoryKey                    INT,
    FirstName                            VARCHAR(50) NOT NULL,
    LastName                             VARCHAR(50) NOT NULL,
    MiddleName                           VARCHAR(50),
    NameStyle                            BOOLEAN     NOT NULL,
    Title                                VARCHAR(50),
    HireDate                             DATE,
    BirthDate                            DATE,
    LoginID                              VARCHAR(256),
    EmailAddress                         VARCHAR(50),
    Phone                                VARCHAR(25),
    MaritalStatus                        CHAR(1),
    EmergencyContactName                 VARCHAR(50),
    EmergencyContactPhone                VARCHAR(25),
    SalariedFlag                         BOOLEAN,
    Gender                               CHAR(1),
    PayFrequency                         SMALLINT,
    BaseRate                             MONEY, -- Consider using NUMERIC or DECIMAL for precision
    VacationHours                        SMALLINT,
    SickLeaveHours                       SMALLINT,
    CurrentFlag                          BOOLEAN     NOT NULL,
    SalesPersonFlag                      BOOLEAN     NOT NULL,
    DepartmentName                       VARCHAR(50),
    StartDate                            DATE,
    EndDate                              DATE,
    Status                               VARCHAR(50),
    EmployeePhoto                        BYTEA  -- varbinary(max) in SQL Server is equivalent to BYTEA in PostgreSQL
);


SELECT 'Copying data into Public.DimAccount';
\copy Public.DimAccount FROM './DimAccount.csv' DELIMITER E'|' CSV;

SELECT 'Copying data into Public.DimCurrency';
\copy Public.DimCurrency FROM './DimCurrency.csv' DELIMITER E'|' CSV;

SELECT 'Copying data into Public.DimCustomer';
\copy Public.DimCustomer FROM './DimCustomer.csv' DELIMITER E'|' CSV;

SELECT 'Copying data into Public.DimDate';
\copy Public.DimDate FROM './DimDate.csv' DELIMITER E'|' CSV;

SELECT 'Copying data into Public.DimDepartmentGroup';
\copy Public.DimDepartmentGroup FROM './DimDepartmentGroup.csv' DELIMITER E'|' CSV;

SELECT 'Copying data into Public.DimEmployee';
\copy Public.DimEmployee FROM './DimEmployee.csv' DELIMITER E'|' CSV;
