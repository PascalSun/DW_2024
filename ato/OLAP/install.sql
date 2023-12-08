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

CREATE TABLE DimGeography
(
    GeographyKey             SERIAL PRIMARY KEY,
    City                     VARCHAR(30),
    StateProvinceCode        VARCHAR(3),
    StateProvinceName        VARCHAR(50),
    CountryRegionCode        VARCHAR(3),
    EnglishCountryRegionName VARCHAR(50),
    SpanishCountryRegionName VARCHAR(50),
    FrenchCountryRegionName  VARCHAR(50),
    PostalCode               VARCHAR(15),
    SalesTerritoryKey        INT,
    IpAddressLocator         VARCHAR(15)
);

CREATE TABLE DimOrganization
(
    OrganizationKey       SERIAL PRIMARY KEY,
    ParentOrganizationKey INT,
    PercentageOfOwnership VARCHAR(16),
    OrganizationName      VARCHAR(50),
    CurrencyKey           INT
);

CREATE TABLE DimProduct
(
    ProductKey            SERIAL PRIMARY KEY,
    ProductAlternateKey   VARCHAR(25),
    ProductSubcategoryKey INT,
    WeightUnitMeasureCode CHAR(3),
    SizeUnitMeasureCode   CHAR(3),
    EnglishProductName    VARCHAR(50),
    SpanishProductName    VARCHAR(50),
    FrenchProductName     VARCHAR(50),
    StandardCost          MONEY,
    FinishedGoodsFlag     BOOLEAN     NOT NULL,
    Color                 VARCHAR(15) NOT NULL,
    SafetyStockLevel      SMALLINT,
    ReorderPoint          SMALLINT,
    ListPrice             MONEY,
    Size                  VARCHAR(50),
    SizeRange             VARCHAR(50),
    Weight                FLOAT,
    DaysToManufacture     INT,
    ProductLine           CHAR(2),
    DealerPrice           MONEY,
    Class                 CHAR(2),
    Style                 CHAR(2),
    ModelName             VARCHAR(50),
    LargePhoto            BYTEA,
    EnglishDescription    VARCHAR(400),
    FrenchDescription     VARCHAR(400),
    ChineseDescription    VARCHAR(400),
    ArabicDescription     VARCHAR(400),
    HebrewDescription     VARCHAR(400),
    ThaiDescription       VARCHAR(400),
    GermanDescription     VARCHAR(400),
    JapaneseDescription   VARCHAR(400),
    TurkishDescription    VARCHAR(400),
    StartDate             TIMESTAMP,
    EndDate               TIMESTAMP,
    Status                VARCHAR(7)
);

CREATE TABLE DimProductCategory
(
    ProductCategoryKey          SERIAL PRIMARY KEY,
    ProductCategoryAlternateKey INT,
    EnglishProductCategoryName  VARCHAR(50) NOT NULL,
    SpanishProductCategoryName  VARCHAR(50) NOT NULL,
    FrenchProductCategoryName   VARCHAR(50) NOT NULL
);

CREATE TABLE DimProductSubcategory
(
    ProductSubcategoryKey          SERIAL PRIMARY KEY,
    ProductSubcategoryAlternateKey INT,
    EnglishProductSubcategoryName  VARCHAR(50) NOT NULL,
    SpanishProductSubcategoryName  VARCHAR(50) NOT NULL,
    FrenchProductSubcategoryName   VARCHAR(50) NOT NULL,
    ProductCategoryKey             INT
);

CREATE TABLE DimPromotion
(
    PromotionKey             SERIAL PRIMARY KEY,
    PromotionAlternateKey    INT,
    EnglishPromotionName     VARCHAR(255),
    SpanishPromotionName     VARCHAR(255),
    FrenchPromotionName      VARCHAR(255),
    DiscountPct              FLOAT,
    EnglishPromotionType     VARCHAR(50),
    SpanishPromotionType     VARCHAR(50),
    FrenchPromotionType      VARCHAR(50),
    EnglishPromotionCategory VARCHAR(50),
    SpanishPromotionCategory VARCHAR(50),
    FrenchPromotionCategory  VARCHAR(50),
    StartDate                TIMESTAMP NOT NULL,
    EndDate                  TIMESTAMP,
    MinQty                   INT,
    MaxQty                   INT
);

CREATE TABLE DimReseller
(
    ResellerKey          SERIAL PRIMARY KEY,
    GeographyKey         INT,
    ResellerAlternateKey VARCHAR(15),
    Phone                VARCHAR(25),
    BusinessType         VARCHAR(20) NOT NULL,
    ResellerName         VARCHAR(50) NOT NULL,
    NumberEmployees      INT,
    OrderFrequency       CHAR(1),
    OrderMonth           SMALLINT,
    FirstOrderYear       INT,
    LastOrderYear        INT,
    ProductLine          VARCHAR(50),
    AddressLine1         VARCHAR(60),
    AddressLine2         VARCHAR(60),
    AnnualSales          MONEY,
    BankName             VARCHAR(50),
    MinPaymentType       SMALLINT,
    MinPaymentAmount     MONEY,
    AnnualRevenue        MONEY,
    YearOpened           INT
);

CREATE TABLE DimSalesReason
(
    SalesReasonKey          SERIAL PRIMARY KEY,
    SalesReasonAlternateKey INT         NOT NULL,
    SalesReasonName         VARCHAR(50) NOT NULL,
    SalesReasonReasonType   VARCHAR(50) NOT NULL
);
CREATE TABLE DimSalesTerritory
(
    SalesTerritoryKey          SERIAL PRIMARY KEY,
    SalesTerritoryAlternateKey INT,
    SalesTerritoryRegion       VARCHAR(50) NOT NULL,
    SalesTerritoryCountry      VARCHAR(50) NOT NULL,
    SalesTerritoryGroup        VARCHAR(50),
    SalesTerritoryImage        BYTEA
);
CREATE TABLE DimScenario
(
    ScenarioKey  SERIAL PRIMARY KEY,
    ScenarioName VARCHAR(50)
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

SELECT 'Copying data into Public.DimGeography';
\copy Public.DimGeography FROM './DimGeography.csv' DELIMITER E'|' CSV;

SELECT 'Copying data into Public.DimOrganization';
\copy Public.DimOrganization FROM './DimOrganization.csv' DELIMITER E'|' CSV;

SELECT 'Copying data into Public.DimProduct';
\copy Public.DimProduct FROM './DimProduct.csv' DELIMITER E'|' CSV;

SELECT 'Copying data into Public.DimProductCategory';
\copy Public.DimProductCategory FROM './DimProductCategory.csv' DELIMITER E'|' CSV;

SELECT 'Copying data into Public.DimProductSubcategory';
\copy Public.DimProductSubcategory FROM './DimProductSubcategory.csv' DELIMITER E'|' CSV;

SELECT 'Copying data into Public.DimPromotion';
\copy Public.DimPromotion FROM './DimPromotion.csv' DELIMITER E'|' CSV;

SELECT 'Copying data into Public.DimReseller';
\copy Public.DimReseller FROM './DimReseller.csv' DELIMITER E'|' CSV;

SELECT 'Copying data into Public.DimSalesReason';
\copy Public.DimSalesReason FROM './DimSalesReason.csv' DELIMITER E'|' CSV;

SELECT 'Copying data into Public.DimSalesTerritory';
\copy Public.DimSalesTerritory FROM './DimSalesTerritory.csv' DELIMITER E'|' CSV;

SELECT 'Copying data into Public.DimScenario';
\copy Public.DimScenario FROM './DimScenario.csv' DELIMITER E'|' CSV;


-- create fact tables for AdventureWorksDW

CREATE TABLE FactAdditionalInternationalProductDescription
(
    ProductKey         INT         NOT NULL,
    CultureName        VARCHAR(50) NOT NULL,
    ProductDescription TEXT        NOT NULL
);
CREATE TABLE FactCallCenter
(
    FactCallCenterID    SERIAL PRIMARY KEY,
    DateKey             INT         NOT NULL,
    WageType            VARCHAR(15) NOT NULL,
    Shift               VARCHAR(20) NOT NULL,
    LevelOneOperators   SMALLINT    NOT NULL,
    LevelTwoOperators   SMALLINT    NOT NULL,
    TotalOperators      SMALLINT    NOT NULL,
    Calls               INT         NOT NULL,
    AutomaticResponses  INT         NOT NULL,
    Orders              INT         NOT NULL,
    IssuesRaised        SMALLINT    NOT NULL,
    AverageTimePerIssue SMALLINT    NOT NULL,
    ServiceGrade        FLOAT       NOT NULL,
    Date                TIMESTAMP   NULL
);
CREATE TABLE FactCurrencyRate
(
    CurrencyKey  INT       NOT NULL,
    DateKey      INT       NOT NULL,
    AverageRate  FLOAT     NOT NULL,
    EndOfDayRate FLOAT     NOT NULL,
    Date         TIMESTAMP NULL
);
CREATE TABLE FactFinance
(
    FinanceKey         SERIAL PRIMARY KEY,
    DateKey            INT       NOT NULL,
    OrganizationKey    INT       NOT NULL,
    DepartmentGroupKey INT       NOT NULL,
    ScenarioKey        INT       NOT NULL,
    AccountKey         INT       NOT NULL,
    Amount             FLOAT     NOT NULL,
    Date               TIMESTAMP NULL
);
CREATE TABLE FactInternetSales
(
    ProductKey            INT         NOT NULL,
    OrderDateKey          INT         NOT NULL,
    DueDateKey            INT         NOT NULL,
    ShipDateKey           INT         NOT NULL,
    CustomerKey           INT         NOT NULL,
    PromotionKey          INT         NOT NULL,
    CurrencyKey           INT         NOT NULL,
    SalesTerritoryKey     INT         NOT NULL,
    SalesOrderNumber      VARCHAR(20) NOT NULL,
    SalesOrderLineNumber  SMALLINT    NOT NULL,
    RevisionNumber        SMALLINT    NOT NULL,
    OrderQuantity         SMALLINT    NOT NULL,
    UnitPrice             MONEY       NOT NULL,
    ExtendedAmount        MONEY       NOT NULL,
    UnitPriceDiscountPct  FLOAT       NOT NULL,
    DiscountAmount        FLOAT       NOT NULL,
    ProductStandardCost   MONEY       NOT NULL,
    TotalProductCost      MONEY       NOT NULL,
    SalesAmount           MONEY       NOT NULL,
    TaxAmt                MONEY       NOT NULL,
    Freight               MONEY       NOT NULL,
    CarrierTrackingNumber VARCHAR(25) NULL,
    CustomerPONumber      VARCHAR(25) NULL,
    OrderDate             TIMESTAMP   NULL,
    DueDate               TIMESTAMP   NULL,
    ShipDate              TIMESTAMP   NULL
);

CREATE TABLE FactInternetSalesReason
(
    SalesOrderNumber     VARCHAR(20) NOT NULL,
    SalesOrderLineNumber SMALLINT    NOT NULL,
    SalesReasonKey       INT         NOT NULL
);
CREATE TABLE FactProductInventory
(
    ProductKey   INT   NOT NULL,
    DateKey      INT   NOT NULL,
    MovementDate DATE  NOT NULL,
    UnitCost     MONEY NOT NULL,
    UnitsIn      INT   NOT NULL,
    UnitsOut     INT   NOT NULL,
    UnitsBalance INT   NOT NULL
);
CREATE TABLE FactResellerSales
(
    ProductKey            INT         NOT NULL,
    OrderDateKey          INT         NOT NULL,
    DueDateKey            INT         NOT NULL,
    ShipDateKey           INT         NOT NULL,
    ResellerKey           INT         NOT NULL,
    EmployeeKey           INT         NOT NULL,
    PromotionKey          INT         NOT NULL,
    CurrencyKey           INT         NOT NULL,
    SalesTerritoryKey     INT         NOT NULL,
    SalesOrderNumber      VARCHAR(20) NOT NULL,
    SalesOrderLineNumber  SMALLINT    NOT NULL,
    RevisionNumber        SMALLINT,
    OrderQuantity         SMALLINT,
    UnitPrice             MONEY,
    ExtendedAmount        MONEY,
    UnitPriceDiscountPct  FLOAT,
    DiscountAmount        FLOAT,
    ProductStandardCost   MONEY,
    TotalProductCost      MONEY,
    SalesAmount           MONEY,
    TaxAmt                MONEY,
    Freight               MONEY,
    CarrierTrackingNumber VARCHAR(25),
    CustomerPONumber      VARCHAR(25),
    OrderDate             TIMESTAMP,
    DueDate               TIMESTAMP,
    ShipDate              TIMESTAMP
);
CREATE TABLE FactSalesQuota
(
    SalesQuotaKey    SERIAL PRIMARY KEY,
    EmployeeKey      INT       NOT NULL,
    DateKey          INT       NOT NULL,
    CalendarYear     SMALLINT  NOT NULL,
    CalendarQuarter  SMALLINT  NOT NULL,
    SalesAmountQuota MONEY     NOT NULL,
    Date             TIMESTAMP NULL
);
CREATE TABLE FactSurveyResponse
(
    SurveyResponseKey             SERIAL PRIMARY KEY,
    DateKey                       INT         NOT NULL,
    CustomerKey                   INT         NOT NULL,
    ProductCategoryKey            INT         NOT NULL,
    EnglishProductCategoryName    VARCHAR(50) NOT NULL,
    ProductSubcategoryKey         INT         NOT NULL,
    EnglishProductSubcategoryName VARCHAR(50) NOT NULL,
    Date                          TIMESTAMP   NULL
);

CREATE TABLE NewFactCurrencyRate
(
    AverageRate  REAL       NULL,
    CurrencyID   VARCHAR(3) NULL,
    CurrencyDate DATE       NULL,
    EndOfDayRate REAL       NULL,
    CurrencyKey  INT        NULL,
    DateKey      INT        NULL
);
CREATE TABLE ProspectiveBuyer
(
    ProspectiveBuyerKey  SERIAL PRIMARY KEY,
    ProspectAlternateKey VARCHAR(15)  NULL,
    FirstName            VARCHAR(50)  NULL,
    MiddleName           VARCHAR(50)  NULL,
    LastName             VARCHAR(50)  NULL,
    BirthDate            TIMESTAMP    NULL, -- datetime in SQL Server is equivalent to TIMESTAMP in PostgreSQL
    MaritalStatus        CHAR(1)      NULL,
    Gender               VARCHAR(1)   NULL,
    EmailAddress         VARCHAR(50)  NULL,
    YearlyIncome         MONEY        NULL, -- Consider using NUMERIC or DECIMAL for more precision
    TotalChildren        SMALLINT     NULL, -- tinyint in SQL Server is equivalent to SMALLINT in PostgreSQL
    NumberChildrenAtHome SMALLINT     NULL,
    Education            VARCHAR(40)  NULL,
    Occupation           VARCHAR(100) NULL,
    HouseOwnerFlag       CHAR(1)      NULL,
    NumberCarsOwned      SMALLINT     NULL,
    AddressLine1         VARCHAR(120) NULL,
    AddressLine2         VARCHAR(120) NULL,
    City                 VARCHAR(30)  NULL,
    StateProvinceCode    VARCHAR(3)   NULL,
    PostalCode           VARCHAR(15)  NULL,
    Phone                VARCHAR(20)  NULL,
    Salutation           VARCHAR(8)   NULL,
    Unknown              INT          NULL
);

SELECT 'Copying data into Public.FactAdditionalInternationalProductDescription';
\copy Public.FactAdditionalInternationalProductDescription FROM './FactAdditionalInternationalProductDescription.csv' DELIMITER E'|' CSV;

SELECT 'Copying data into Public.FactCallCenter';
\copy Public.FactCallCenter FROM './FactCallCenter.csv' DELIMITER E'|' CSV;

SELECT 'Copying data into Public.FactCurrencyRate';
\copy Public.FactCurrencyRate FROM './FactCurrencyRate.csv' DELIMITER E'|' CSV;

SELECT 'Copying data into Public.FactFinance';
\copy Public.FactFinance FROM './FactFinance.csv' DELIMITER E'|' CSV;

SELECT 'Copying data into Public.FactInternetSales';
\copy Public.FactInternetSales FROM './FactInternetSales.csv' DELIMITER E'|' CSV;

SELECT 'Copying data into Public.FactInternetSalesReason';
\copy Public.FactInternetSalesReason FROM './FactInternetSalesReason.csv' DELIMITER E'|' CSV;

SELECT 'Copying data into Public.FactProductInventory';
\copy Public.FactProductInventory FROM './FactProductInventory.csv' DELIMITER E'|' CSV;

SELECT 'Copying data into Public.FactResellerSales';
\copy Public.FactResellerSales FROM './FactResellerSales.csv' DELIMITER E'|' CSV;

SELECT 'Copying data into Public.FactSalesQuota';
\copy Public.FactSalesQuota FROM './FactSalesQuota.csv' DELIMITER E'|' CSV;

SELECT 'Copying data into Public.FactSurveyResponse';
\copy Public.FactSurveyResponse FROM './FactSurveyResponse.csv' DELIMITER E'|' CSV;

SELECT 'Copying data into Public.NewFactCurrencyRate';
\copy Public.NewFactCurrencyRate FROM './NewFactCurrencyRate.csv' DELIMITER E'|' CSV;

SELECT 'Copying data into Public.ProspectiveBuyer';
\copy Public.ProspectiveBuyer FROM './ProspectiveBuyer.csv' DELIMITER E'|' CSV;


-- --  Adding primary keys
-- ALTER TABLE DimAccount
--     ADD PRIMARY KEY (AccountKey);
-- ALTER TABLE DimCurrency
--     ADD PRIMARY KEY (CurrencyKey);
-- ALTER TABLE DimCustomer
--     ADD PRIMARY KEY (CustomerKey);
ALTER TABLE DimDate
    ADD PRIMARY KEY (DateKey);
-- ALTER TABLE DimDepartmentGroup
--     ADD PRIMARY KEY (DepartmentGroupKey);
-- ALTER TABLE DimEmployee
--     ADD PRIMARY KEY (EmployeeKey);
-- ALTER TABLE DimGeography
--     ADD PRIMARY KEY (GeographyKey);
-- ALTER TABLE DimOrganization
--     ADD PRIMARY KEY (OrganizationKey);
-- ALTER TABLE DimProduct
--     ADD PRIMARY KEY (ProductKey);
-- ALTER TABLE DimProductCategory
--     ADD PRIMARY KEY (ProductCategoryKey);
-- ALTER TABLE DimProductSubcategory
--     ADD PRIMARY KEY (ProductSubcategoryKey);
-- ALTER TABLE DimPromotion
--     ADD PRIMARY KEY (PromotionKey);
-- ALTER TABLE DimReseller
--     ADD PRIMARY KEY (ResellerKey);
-- ALTER TABLE DimSalesReason
--     ADD PRIMARY KEY (SalesReasonKey);
-- ALTER TABLE DimSalesTerritory
--     ADD PRIMARY KEY (SalesTerritoryKey);

ALTER TABLE FactAdditionalInternationalProductDescription
    ADD PRIMARY KEY (ProductKey, CultureName);
-- ALTER TABLE FactCallCenter
--     ADD PRIMARY KEY (FactCallCenterID);
-- ALTER TABLE FactCurrencyRate
--     ADD PRIMARY KEY (CurrencyKey, DateKey);
ALTER TABLE FactInternetSales
    ADD PRIMARY KEY (SalesOrderNumber, SalesOrderLineNumber);
ALTER TABLE FactInternetSalesReason
    ADD PRIMARY KEY (SalesOrderNumber, SalesOrderLineNumber, SalesReasonKey);
ALTER TABLE FactProductInventory
    ADD PRIMARY KEY (ProductKey, DateKey);
ALTER TABLE FactResellerSales
    ADD PRIMARY KEY (SalesOrderNumber, SalesOrderLineNumber);
-- ALTER TABLE FactSalesQuota
--     ADD PRIMARY KEY (SalesQuotaKey);
-- ALTER TABLE FactSurveyResponse
--     ADD PRIMARY KEY (SurveyResponseKey);
-- ALTER TABLE ProspectiveBuyer
--     ADD PRIMARY KEY (ProspectiveBuyerKey);


-- create indexes for AdventureWorksDW

CREATE UNIQUE INDEX AK_DimCurrency_CurrencyAlternateKey ON DimCurrency (CurrencyAlternateKey);
CREATE UNIQUE INDEX IX_DimCustomer_CustomerAlternateKey ON DimCustomer (CustomerAlternateKey);
CREATE UNIQUE INDEX AK_DimDate_FullDateAlternateKey ON DimDate (FullDateAlternateKey);
ALTER TABLE DimProduct
    ADD CONSTRAINT AK_DimProduct_ProductAlternateKey_StartDate UNIQUE (ProductAlternateKey, StartDate);
ALTER TABLE DimProductCategory
    ADD CONSTRAINT AK_DimProductCategory_ProductCategoryAlternateKey UNIQUE (ProductCategoryAlternateKey);
ALTER TABLE DimProductSubcategory
    ADD CONSTRAINT AK_DimProductSubcategory_ProductSubcategoryAlternateKey UNIQUE (ProductSubcategoryAlternateKey);
ALTER TABLE DimPromotion
    ADD CONSTRAINT AK_DimPromotion_PromotionAlternateKey UNIQUE (PromotionAlternateKey);
ALTER TABLE DimReseller
    ADD CONSTRAINT AK_DimReseller_ResellerAlternateKey UNIQUE (ResellerAlternateKey);
ALTER TABLE DimSalesTerritory
    ADD CONSTRAINT AK_DimSalesTerritory_SalesTerritoryAlternateKey UNIQUE (SalesTerritoryAlternateKey);
ALTER TABLE FactCallCenter
    ADD CONSTRAINT AK_FactCallCenter_DateKey_Shift UNIQUE (DateKey, Shift);


-- create foreign keys for AdventureWorksDW

ALTER TABLE DimAccount
    ADD CONSTRAINT FK_DimAccount_DimAccount FOREIGN KEY (ParentAccountKey) REFERENCES DimAccount (AccountKey);

ALTER TABLE DimCustomer
    ADD CONSTRAINT FK_DimCustomer_DimGeography FOREIGN KEY (GeographyKey) REFERENCES DimGeography (GeographyKey);

ALTER TABLE DimDepartmentGroup
    ADD CONSTRAINT FK_DimDepartmentGroup_DimDepartmentGroup FOREIGN KEY (ParentDepartmentGroupKey) REFERENCES DimDepartmentGroup (DepartmentGroupKey);

ALTER TABLE DimEmployee
    ADD CONSTRAINT FK_DimEmployee_DimSalesTerritory FOREIGN KEY (SalesTerritoryKey) REFERENCES DimSalesTerritory (SalesTerritoryKey),
    ADD CONSTRAINT FK_DimEmployee_DimEmployee FOREIGN KEY (ParentEmployeeKey) REFERENCES DimEmployee (EmployeeKey);

ALTER TABLE DimGeography
    ADD CONSTRAINT FK_DimGeography_DimSalesTerritory FOREIGN KEY (SalesTerritoryKey) REFERENCES DimSalesTerritory (SalesTerritoryKey);

ALTER TABLE DimOrganization
    ADD CONSTRAINT FK_DimOrganization_DimCurrency FOREIGN KEY (CurrencyKey) REFERENCES DimCurrency (CurrencyKey),
    ADD CONSTRAINT FK_DimOrganization_DimOrganization FOREIGN KEY (ParentOrganizationKey) REFERENCES DimOrganization (OrganizationKey);

ALTER TABLE DimProduct
    ADD CONSTRAINT FK_DimProduct_DimProductSubcategory FOREIGN KEY (ProductSubcategoryKey) REFERENCES DimProductSubcategory (ProductSubcategoryKey);

ALTER TABLE DimProductSubcategory
    ADD CONSTRAINT FK_DimProductSubcategory_DimProductCategory FOREIGN KEY (ProductCategoryKey) REFERENCES DimProductCategory (ProductCategoryKey);

ALTER TABLE DimReseller
    ADD CONSTRAINT FK_DimReseller_DimGeography FOREIGN KEY (GeographyKey) REFERENCES DimGeography (GeographyKey);

ALTER TABLE FactCallCenter
    ADD CONSTRAINT FK_FactCallCenter_DimDate FOREIGN KEY (DateKey) REFERENCES DimDate (DateKey);

ALTER TABLE FactCurrencyRate
    ADD CONSTRAINT FK_FactCurrencyRate_DimDate FOREIGN KEY (DateKey) REFERENCES DimDate (DateKey),
    ADD CONSTRAINT FK_FactCurrencyRate_DimCurrency FOREIGN KEY (CurrencyKey) REFERENCES DimCurrency (CurrencyKey);

ALTER TABLE FactFinance
    ADD CONSTRAINT FK_FactFinance_DimScenario FOREIGN KEY (ScenarioKey) REFERENCES DimScenario (ScenarioKey),
    ADD CONSTRAINT FK_FactFinance_DimOrganization FOREIGN KEY (OrganizationKey) REFERENCES DimOrganization (OrganizationKey),
    ADD CONSTRAINT FK_FactFinance_DimDepartmentGroup FOREIGN KEY (DepartmentGroupKey) REFERENCES DimDepartmentGroup (DepartmentGroupKey),
    ADD CONSTRAINT FK_FactFinance_DimDate FOREIGN KEY (DateKey) REFERENCES DimDate (DateKey),
    ADD CONSTRAINT FK_FactFinance_DimAccount FOREIGN KEY (AccountKey) REFERENCES DimAccount (AccountKey);

ALTER TABLE FactInternetSales
    ADD CONSTRAINT FK_FactInternetSales_DimCurrency FOREIGN KEY (CurrencyKey) REFERENCES DimCurrency (CurrencyKey),
    ADD CONSTRAINT FK_FactInternetSales_DimCustomer FOREIGN KEY (CustomerKey) REFERENCES DimCustomer (CustomerKey),
    ADD CONSTRAINT FK_FactInternetSales_DimDate FOREIGN KEY (OrderDateKey) REFERENCES DimDate (DateKey),
    ADD CONSTRAINT FK_FactInternetSales_DimDate1 FOREIGN KEY (DueDateKey) REFERENCES DimDate (DateKey),
    ADD CONSTRAINT FK_FactInternetSales_DimDate2 FOREIGN KEY (ShipDateKey) REFERENCES DimDate (DateKey),
    ADD CONSTRAINT FK_FactInternetSales_DimProduct FOREIGN KEY (ProductKey) REFERENCES DimProduct (ProductKey),
    ADD CONSTRAINT FK_FactInternetSales_DimPromotion FOREIGN KEY (PromotionKey) REFERENCES DimPromotion (PromotionKey),
    ADD CONSTRAINT FK_FactInternetSales_DimSalesTerritory FOREIGN KEY (SalesTerritoryKey) REFERENCES DimSalesTerritory (SalesTerritoryKey);

ALTER TABLE FactInternetSalesReason
    ADD CONSTRAINT FK_FactInternetSalesReason_FactInternetSales FOREIGN KEY (SalesOrderNumber, SalesOrderLineNumber) REFERENCES FactInternetSales (SalesOrderNumber, SalesOrderLineNumber),
    ADD CONSTRAINT FK_FactInternetSalesReason_DimSalesReason FOREIGN KEY (SalesReasonKey) REFERENCES DimSalesReason (SalesReasonKey);

ALTER TABLE FactProductInventory
    ADD CONSTRAINT FK_FactProductInventory_DimDate FOREIGN KEY (DateKey) REFERENCES DimDate (DateKey),
    ADD CONSTRAINT FK_FactProductInventory_DimProduct FOREIGN KEY (ProductKey) REFERENCES DimProduct (ProductKey);

ALTER TABLE FactResellerSales
    ADD CONSTRAINT FK_FactResellerSales_DimCurrency
        FOREIGN KEY (CurrencyKey) REFERENCES DimCurrency (CurrencyKey),
    ADD CONSTRAINT FK_FactResellerSales_DimDate
        FOREIGN KEY (OrderDateKey) REFERENCES DimDate (DateKey),
    ADD CONSTRAINT FK_FactResellerSales_DimDate1
        FOREIGN KEY (DueDateKey) REFERENCES DimDate (DateKey),
    ADD CONSTRAINT FK_FactResellerSales_DimDate2
        FOREIGN KEY (ShipDateKey) REFERENCES DimDate (DateKey),
    ADD CONSTRAINT FK_FactResellerSales_DimEmployee
        FOREIGN KEY (EmployeeKey) REFERENCES DimEmployee (EmployeeKey),
    ADD CONSTRAINT FK_FactResellerSales_DimProduct
        FOREIGN KEY (ProductKey) REFERENCES DimProduct (ProductKey),
    ADD CONSTRAINT FK_FactResellerSales_DimPromotion
        FOREIGN KEY (PromotionKey) REFERENCES DimPromotion (PromotionKey),
    ADD CONSTRAINT FK_FactResellerSales_DimReseller
        FOREIGN KEY (ResellerKey) REFERENCES DimReseller (ResellerKey),
    ADD CONSTRAINT FK_FactResellerSales_DimSalesTerritory
        FOREIGN KEY (SalesTerritoryKey) REFERENCES DimSalesTerritory (SalesTerritoryKey);

-- create views for AdventureWorksDW
-- vDMPrep View
CREATE VIEW vDMPrep AS
SELECT pc.EnglishProductCategoryName
     , COALESCE(p.ModelName, p.EnglishProductName) AS Model
     , c.CustomerKey
     , s.SalesTerritoryGroup                       AS Region
     , CASE
           WHEN EXTRACT(MONTH FROM CURRENT_DATE) < EXTRACT(MONTH FROM c.BirthDate)
               THEN EXTRACT(YEAR FROM AGE(c.BirthDate, CURRENT_DATE)) - 1
           WHEN EXTRACT(MONTH FROM CURRENT_DATE) = EXTRACT(MONTH FROM c.BirthDate)
               AND EXTRACT(DAY FROM CURRENT_DATE) < EXTRACT(DAY FROM c.BirthDate)
               THEN EXTRACT(YEAR FROM AGE(c.BirthDate, CURRENT_DATE)) - 1
           ELSE EXTRACT(YEAR FROM AGE(c.BirthDate, CURRENT_DATE))
    END                                            AS Age
     , CASE
           WHEN c.YearlyIncome::numeric < 40000 THEN 'Low'
           WHEN c.YearlyIncome::numeric > 60000 THEN 'High'
           ELSE 'Moderate'
    END                                            AS IncomeGroup
     , d.CalendarYear
     , d.FiscalYear
     , d.MonthNumberOfYear                         AS Month
     , f.SalesOrderNumber                          AS OrderNumber
     , f.SalesOrderLineNumber                      AS LineNumber
     , f.OrderQuantity                             AS Quantity
     , f.ExtendedAmount                            AS Amount
FROM FactInternetSales f
         INNER JOIN DimDate d ON f.OrderDateKey = d.DateKey
         INNER JOIN DimProduct p ON f.ProductKey = p.ProductKey
         INNER JOIN DimProductSubcategory psc ON p.ProductSubcategoryKey = psc.ProductSubcategoryKey
         INNER JOIN DimProductCategory pc ON psc.ProductCategoryKey = pc.ProductCategoryKey
         INNER JOIN DimCustomer c ON f.CustomerKey = c.CustomerKey
         INNER JOIN DimGeography g ON c.GeographyKey = g.GeographyKey
         INNER JOIN DimSalesTerritory s ON g.SalesTerritoryKey = s.SalesTerritoryKey;

-- vTimeSeries View
CREATE VIEW vTimeSeries AS
SELECT CASE Model
           WHEN 'Mountain-100' THEN 'M200'
           WHEN 'Road-150' THEN 'R250'
           WHEN 'Road-650' THEN 'R750'
           WHEN 'Touring-1000' THEN 'T1000'
           ELSE LEFT(Model, 1) || RIGHT(Model, 3)
           END || ' ' || Region                                                   AS ModelRegion
     , (EXTRACT(YEAR FROM CURRENT_DATE) * 100) + EXTRACT(MONTH FROM CURRENT_DATE) AS TimeIndex
     , SUM(Quantity)                                                              AS Quantity
     , SUM(Amount)                                                                AS Amount
     , CalendarYear
     , Month
FROM vDMPrep
WHERE Model IN ('Mountain-100', 'Mountain-200', 'Road-150', 'Road-250', 'Road-650', 'Road-750', 'Touring-1000')
GROUP BY ModelRegion, TimeIndex, CalendarYear, Month;

-- vTargetMail View
CREATE VIEW vTargetMail AS
SELECT c.CustomerKey,
       c.GeographyKey,
       c.CustomerAlternateKey,
       c.Title,
       c.FirstName,
       c.MiddleName,
       c.LastName,
       c.NameStyle,
       c.BirthDate,
       c.MaritalStatus,
       c.Suffix,
       c.Gender,
       c.EmailAddress,
       c.YearlyIncome,
       c.TotalChildren,
       c.NumberChildrenAtHome,
       c.EnglishEducation,
       c.SpanishEducation,
       c.FrenchEducation,
       c.EnglishOccupation,
       c.SpanishOccupation,
       c.FrenchOccupation,
       c.HouseOwnerFlag,
       c.NumberCarsOwned,
       c.AddressLine1,
       c.AddressLine2,
       c.Phone,
       c.DateFirstPurchase,
       c.CommuteDistance,
       x.Region,
       x.Age,
       CASE WHEN x.Bikes = 0 THEN 0 ELSE 1 END AS BikeBuyer
FROM DimCustomer c
         INNER JOIN (SELECT CustomerKey,
                            Region,
                            Age,
                            SUM(CASE WHEN EnglishProductCategoryName = 'Bikes' THEN 1 ELSE 0 END) AS Bikes
                     FROM vDMPrep
                     GROUP BY CustomerKey, Region, Age) AS x ON c.CustomerKey = x.CustomerKey;

-- vAssocSeqOrders View
CREATE VIEW vAssocSeqOrders AS
SELECT DISTINCT OrderNumber, CustomerKey, Region, IncomeGroup
FROM vDMPrep
WHERE FiscalYear = '2013';

-- vAssocSeqLineItems View
CREATE VIEW
    vAssocSeqLineItems AS
SELECT OrderNumber, LineNumber, Model
FROM vDMPrep
WHERE FiscalYear = '2013';