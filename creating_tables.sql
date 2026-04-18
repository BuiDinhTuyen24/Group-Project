DROP TABLE IF EXISTS [Transactions];
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Accounts;
DROP TABLE IF EXISTS Branches;
DROP TABLE IF EXISTS Customers;
GO

-- Customers
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName NVARCHAR(50) NOT NULL,
    PhoneNumber NVARCHAR(20),
    Address NVARCHAR(100)
);
GO

-- Branches
CREATE TABLE Branches (
    BranchID INT PRIMARY KEY,
    BranchName NVARCHAR(100) NOT NULL,
    Address NVARCHAR(255)
);
GO

-- Accounts
CREATE TABLE Accounts (
    AccountID INT PRIMARY KEY,
    CustomerID INT NOT NULL,
    Balance DECIMAL(15,2) DEFAULT 0 CHECK (Balance >= 0),
    OpenDate DATE NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
GO

-- Employees
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName NVARCHAR(100) NOT NULL,
    Position NVARCHAR(50),
    BranchID INT,
    FOREIGN KEY (BranchID) REFERENCES Branches(BranchID)
);
GO

-- Transactions
CREATE TABLE [Transactions] (
    TransactionID INT PRIMARY KEY,
    AccountID INT NOT NULL,
    TransactionDate DATETIME NOT NULL,
    Amount DECIMAL(15,2) NOT NULL CHECK (Amount > 0),
    TransactionType NVARCHAR(20) CHECK (TransactionType IN ('Deposit', 'Withdrawal')),
    FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID)
);
GO