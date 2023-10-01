GO
CREATE DATABASE [BakiMealPrep]

GO
USE [BakiMealPrep]

GO
CREATE TABLE MealPrep(
    MealID CHAR(5) CHECK (MealID LIKE 'PM[0-9][0-9][0-9]') NOT NULL,
    MealName VARCHAR(255) NOT NULL,
	MealStock INT NOT NULL  CHECK (MealStock > 0 ),
	PurchasePrice INT NOT NULL,
    MealExpiryDate DATE CHECK (YEAR(MealExpiryDate) >= '2021'),  
    SalesPrice INT NOT NULL CHECK (SalesPrice > 50000),


    PRIMARY KEY(MealID)

)
GO
CREATE TABLE MsStaff(
	StaffID CHAR(5) CHECK(StaffID LIKE 'ST[0-9][0-9][0-9]') NOT NULL,
	StaffName VARCHAR(255) CHECK(LEN(StaffName) > 3 ) NOT NULL,
	StaffAdress VARCHAR(255) NOT NULL,
	StaffGender VARCHAR(255) CHECK (StaffGender LIKE 'Male' OR StaffGender LIKE 'Female') NOT NULL,
	StaffEmail VARCHAR(255) CHECK (StaffEmail LIKE '%@%')  NOT NULL,
	StaffPhoneNumber CHAR(13),
	StaffSalary INT NOT NULL

PRIMARY KEY (StaffID)
)
GO
CREATE TABLE MsCustomer(
CustomerID CHAR(5) CHECK (CustomerID LIKE 'CS[0-9][0-9][0-9]') NOT NULL,
CustomerName VARCHAR(255) CHECK (LEN(CustomerName) > 5) NOT NULL,
CustomerGender VARCHAR(255) CHECK (CustomerGender LIKE 'Male' OR CustomerGender LIKE 'Female') NOT NULL,
CustomerAddress VARCHAR(255) NOT NULL,
CustomerPhoneNumber CHAR(13) NOT NULL,
CustomerEmail VARCHAR(255) CHECK (CustomerEmail LIKE '%@%') NOT NULL,

PRIMARY KEY (CustomerID)
)
GO
CREATE TABLE RegionalBranch (
    RegionalBranchID CHAR(5) PRIMARY KEY CHECK (RegionalBranchID LIKE 'RB[0-9][0-9][0-9]'),
    RegionalBranchName VARCHAR (225) CHECK (LEN (RegionalBranchName) > 5) NOT NULL,
    RegionalBranchPhone CHAR (13) NOT NULL,
    RegionalBranchEmail VARCHAR (225) CHECK (RegionalBranchEmail LIKE '%@%') NOT NULL,
    RegionalBranchAddress VARCHAR (225) NOT NULL,
)
GO
CREATE TABLE SalesTransaction(
SalesID CHAR(5) CHECK (SalesID LIKE 'SS[0-9][0-9][0-9]') NOT NULL,
CustomerID CHAR(5) NOT NULL,
StaffID CHAR(5) NOT NULL,
SalesDate DATE NOT NULL,

PRIMARY KEY (SalesID),
FOREIGN KEY(StaffID) REFERENCES MsStaff(StaffID) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(CustomerID) REFERENCES MsCustomer(CustomerID) ON DELETE CASCADE ON UPDATE CASCADE,
)
GO

CREATE TABLE PurchaseTransaction (
    PurchaseID CHAR(5) PRIMARY KEY CHECK (PurchaseID LIKE 'PC[0-9][0-9][0-9]'),
	RegionalBranchID CHAR(5) FOREIGN KEY REFERENCES RegionalBranch(RegionalBranchID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
    StaffID CHAR(5) FOREIGN KEY REFERENCES MsStaff(StaffID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
	PurchaseDate DATE NOT NULL
)
GO
CREATE TABLE SalesDetail (
    SalesId CHAR(5) CHECK (SalesID LIKE 'SS[0-9][0-9][0-9]') NOT NULL , 
    MealId CHAR(5) CHECK (MealId LIKE 'PM[0-9][0-9][0-9]') NOT NULL,
    SalesQty INT NOT NULL,


    PRIMARY KEY(SalesId),
    FOREIGN KEY (MealID) REFERENCES MealPrep(MealID) ON UPDATE CASCADE ON DELETE CASCADE 
)
GO
CREATE TABLE PurchaseDetail (
    PurchaseID CHAR(5) FOREIGN KEY REFERENCES PurchaseTransaction(PurchaseID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
    MealID CHAR(5) FOREIGN KEY REFERENCES MealPrep(MealID) ON UPDATE CASCADE ON DELETE CASCADE NOT NULL,
    PurchaseQty INTEGER NOT NULL,
)
GO

--DROP DATABASE BakiMealPrep