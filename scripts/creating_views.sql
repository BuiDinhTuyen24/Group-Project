-- =========================================
-- VIEWS
-- =========================================

-- Customer Balances
CREATE VIEW vw_CustomerBalances AS
SELECT 
    c.CustomerID,
    c.CustomerName,
    a.AccountID,
    a.Balance
FROM Customers c
JOIN Accounts a ON c.CustomerID = a.CustomerID;
GO


-- Transaction Summary
CREATE VIEW vw_TransactionSummary AS
SELECT 
    AccountID,
    COUNT(*) AS TotalTransactions,
    SUM(Amount) AS TotalAmount
FROM [Transactions]
GROUP BY AccountID;