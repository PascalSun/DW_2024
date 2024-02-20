\pset tuples_only on


-- Table DimCustomer
CREATE TABLE DimCustomer
(
    CustomerID    serial PRIMARY KEY,
    CustomerAltID varchar(10) NOT NULL,
    CustomerName  varchar(50),
    Gender        varchar(20)
);

-- Table DimProduct
CREATE TABLE DimProduct
(
    ProductKey        serial PRIMARY KEY,
    ProductAltKey     varchar(10) NOT NULL,
    ProductName       varchar(100),
    ProductActualCost numeric,
    ProductSalesCost  numeric
);

-- Table DimStores
CREATE TABLE DimStores
(
    StoreID       serial PRIMARY KEY,
    StoreAltID    varchar(10) NOT NULL,
    StoreName     varchar(100),
    StoreLocation varchar(100),
    City          varchar(100),
    State         varchar(100),
    Country       varchar(100)
);

-- Table DimSalesPerson
CREATE TABLE DimSalesPerson
(
    SalesPersonID    serial PRIMARY KEY,
    SalesPersonAltID varchar(10) NOT NULL,
    SalesPersonName  varchar(100),
    StoreID          int,
    City             varchar(100),
    State            varchar(100),
    Country          varchar(100)
);

-- Table FactProductSales
CREATE TABLE FactProductSales
(
    TransactionId      bigserial PRIMARY KEY,
    SalesInvoiceNumber int NOT NULL,
    StoreID            int NOT NULL,
    CustomerID         int NOT NULL,
    ProductID          int NOT NULL,
    SalesPersonID      int NOT NULL,
    Quantity           float,
    SalesTotalCost     numeric,
    ProductActualCost  numeric,
    Deviation          float
);

-- Add foreign key constraints
ALTER TABLE FactProductSales
    ADD CONSTRAINT FK_StoreID FOREIGN KEY (StoreID) REFERENCES DimStores (StoreID);

ALTER TABLE FactProductSales
    ADD CONSTRAINT FK_CustomerID FOREIGN KEY (CustomerID) REFERENCES DimCustomer (CustomerID);

ALTER TABLE FactProductSales
    ADD CONSTRAINT FK_ProductKey FOREIGN KEY (ProductID) REFERENCES DimProduct (ProductKey);

ALTER TABLE FactProductSales
    ADD CONSTRAINT FK_SalesPersonID FOREIGN KEY (SalesPersonID) REFERENCES DimSalesPerson (SalesPersonID);


\copy Public.DimCustomer(CustomerAltID, CustomerName,Gender ) FROM './DimCustomer.csv' DELIMITER ',' CSV;

\copy Public.DimProduct(ProductAltKey, ProductName,ProductActualCost,ProductSalesCost ) FROM './DimProduct.csv' DELIMITER ',' CSV;

\copy Public.DimStores(StoreAltID, StoreName,StoreLocation,City,State,Country ) FROM './DimStores.csv' DELIMITER ',' CSV;

\copy Public.DimSalesPerson(SalesPersonAltID, SalesPersonName,StoreID,City,State,Country ) FROM './DimSalesPerson.csv' DELIMITER ',' CSV;

\copy Public.FactProductSales(SalesInvoiceNumber, StoreID,CustomerID,ProductID,SalesPersonID,Quantity,ProductActualCost,SalesTotalCost,Deviation ) FROM './FactProductSales.csv' DELIMITER ',' CSV;
