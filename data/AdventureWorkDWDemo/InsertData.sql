/* Contact @Nur Al Hasan Haldar for any query
 * HOW TO RUN THIS SCRIPT:
 *
 * 1. Enable full-text search on your SQL Server instance. 
 *
 * 2. Open the script inside SQL Server Management Studio and enable SQLCMD mode. 
 *    This option is in the Query menu.
 *
 * 3. Copy this script and the install files to C:\Samples\NewSalesDW_Diagram, or
 *    set the following environment variable to your own data path.
 */
 :setvar SqlSamplesSourceDataPath "C:\Samples\NewSalesDW_Diagram\"

/*
 * 4. Append the SQL Server version number to database name if you want to
 *    differentiate it from other installs of AdventureWorksDW (previous lab sample DW)
 */

:setvar DatabaseName "NewSalesDW_Diagram"

/* Execute the script to insert data
 */

BULK INSERT [dbo].[DimCustomer] FROM '$(SqlSamplesSourceDataPath)DimCustomer.csv'
WITH (
    CHECK_CONSTRAINTS,
    --CODEPAGE='ACP',
    DATAFILETYPE='char',
    FIELDTERMINATOR=',',
    ROWTERMINATOR='\n',
    --KEEPIDENTITY,
    TABLOCK
);

BULK INSERT [dbo].[DimProduct] FROM '$(SqlSamplesSourceDataPath)DimProduct.csv'
WITH (
    CHECK_CONSTRAINTS,
    --CODEPAGE='ACP',
    DATAFILETYPE='char',
    FIELDTERMINATOR=',',
    ROWTERMINATOR='\n',
    --KEEPIDENTITY,
    TABLOCK
);

BULK INSERT [dbo].[DimSalesPerson] FROM '$(SqlSamplesSourceDataPath)DimSalesPerson.csv'
WITH (
    CHECK_CONSTRAINTS,
    --CODEPAGE='ACP',
    DATAFILETYPE='char',
    FIELDTERMINATOR=',',
    ROWTERMINATOR='\n',
    --KEEPIDENTITY,
    TABLOCK
);

BULK INSERT [dbo].[DimStores] FROM '$(SqlSamplesSourceDataPath)DimStores.csv'
WITH (
    CHECK_CONSTRAINTS,
    --CODEPAGE='ACP',
    DATAFILETYPE='char',
    FIELDTERMINATOR=',',
    ROWTERMINATOR='\n',
    --KEEPIDENTITY,
    TABLOCK
);

BULK INSERT [dbo].[FactProductSales] FROM '$(SqlSamplesSourceDataPath)FactProductSales.csv'
WITH (
    CHECK_CONSTRAINTS,
    --CODEPAGE='ACP',
    DATAFILETYPE='char',
    FIELDTERMINATOR=',',
    ROWTERMINATOR='\n',
    --KEEPIDENTITY,
    TABLOCK
);

