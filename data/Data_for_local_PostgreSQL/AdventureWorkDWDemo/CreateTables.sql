Use master
Go

PRINT '';
PRINT '*** Dropping Database';
GO

IF EXISTS (SELECT [name] FROM [master].[sys].[databases] WHERE [name] = N'NewSalesDW_Diagram')
DROP DATABASE NewSalesDW_Diagram;
GO

PRINT '';
PRINT '*** Creating Database';
GO

Create database NewSalesDW_Diagram
Go

Use NewSalesDW_Diagram
Go

PRINT '';
PRINT '*** Creating Table DimCustomer';
GO

Create table DimCustomer
(
CustomerID int primary key identity,
CustomerAltID varchar(10) not null,
CustomerName varchar(50),
Gender varchar(20)
)
Go

PRINT '';
PRINT '*** Creating Table DimProduct';
GO

Create table DimProduct
(
ProductKey int primary key identity,
ProductAltKey varchar(10)not null,
ProductName varchar(100),
ProductActualCost money,
ProductSalesCost money
)
Go

PRINT '';
PRINT '*** Creating Table DimStores';
GO

Create table DimStores
(
StoreID int primary key identity,
StoreAltID varchar(10)not null,
StoreName varchar(100),
StoreLocation varchar(100),
City varchar(100),
State varchar(100),
Country varchar(100)
)
Go

PRINT '';
PRINT '*** Creating Table DimSalesPerson';
GO

Create table DimSalesPerson
(
SalesPersonID int primary key identity,
SalesPersonAltID varchar(10)not null,
SalesPersonName varchar(100),
StoreID int,
City varchar(100),
State varchar(100),
Country varchar(100)
)
Go

PRINT '';
PRINT '*** Creating Table FactProductSales';
GO

Create Table FactProductSales
(
TransactionId bigint primary key identity,
SalesInvoiceNumber int not null,
StoreID int not null,
CustomerID int not null,
ProductID int not null,
SalesPersonID int not null,
Quantity float,
SalesTotalCost money,
ProductActualCost money,
Deviation float
)
Go

PRINT '';
PRINT '*** Add relation between fact table foreign keys to Primary keys of Dimensions';
GO

AlTER TABLE FactProductSales ADD CONSTRAINT 
FK_StoreID FOREIGN KEY (StoreID)REFERENCES DimStores(StoreID);
AlTER TABLE FactProductSales ADD CONSTRAINT 
FK_CustomerID FOREIGN KEY (CustomerID)REFERENCES Dimcustomer(CustomerID);
AlTER TABLE FactProductSales ADD CONSTRAINT 
FK_ProductKey FOREIGN KEY (ProductID)REFERENCES Dimproduct(ProductKey);
AlTER TABLE FactProductSales ADD CONSTRAINT 
FK_SalesPersonID FOREIGN KEY (SalesPersonID)REFERENCES Dimsalesperson(SalesPersonID);
Go


