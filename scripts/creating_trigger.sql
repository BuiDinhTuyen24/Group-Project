-- =========================================
-- TRIGGERS
-- =========================================

CREATE TABLE TransactionLogs (
    LogID INT IDENTITY(1,1) PRIMARY KEY,
    TransactionID INT,
    Amount DECIMAL(15,2),
    LogDate DATETIME DEFAULT GETDATE()
);
GO
-- Log large transactions
CREATE TRIGGER trg_LargeTransaction
ON [Transactions]
AFTER INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1 FROM inserted WHERE Amount > 10000
    )
    BEGIN
        PRINT 'Warning: Large transaction detected';
    END
END;
GO

-- Prevent negative balance
CREATE TRIGGER trg_PreventNegativeBalance
ON Accounts
AFTER UPDATE
AS

BEGIN
    IF EXISTS (
        SELECT 1 FROM inserted WHERE Balance < 0
    )
    BEGIN
        ROLLBACK;
    END
END;


