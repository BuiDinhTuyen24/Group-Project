-- INDEXES

CREATE NONCLUSTERED INDEX idx_customers_phone
ON Customers(PhoneNumber);

CREATE NONCLUSTERED INDEX idx_accounts_customer
ON Accounts(CustomerID);

CREATE NONCLUSTERED INDEX idx_accounts_opendate
ON Accounts(OpenDate);

CREATE NONCLUSTERED INDEX idx_employees_branch
ON Employees(BranchID);

CREATE NONCLUSTERED INDEX idx_transactions_account_date
ON [Transactions](AccountID, TransactionDate);