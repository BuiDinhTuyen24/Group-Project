-- =========================================
-- STORED PROCEDURES
-- =========================================
-- Deposit
CREATE PROCEDURE sp_Deposit
    @AccountID INT,
    @Amount DECIMAL(15,2)
AS
BEGIN
    UPDATE Accounts
    SET Balance = Balance + @Amount
    WHERE AccountID = @AccountID;

    INSERT INTO [Transactions](TransactionID, AccountID, TransactionDate, Amount, TransactionType)
    VALUES (
        (SELECT ISNULL(MAX(TransactionID),0)+1 FROM [Transactions]),
        @AccountID,
        GETDATE(),
        @Amount,
        'Deposit'
    );
END;
GO


-- Withdrawal
CREATE PROCEDURE sp_Withdraw
    @AccountID INT,
    @Amount DECIMAL(15,2)
AS
BEGIN
    IF (SELECT Balance FROM Accounts WHERE AccountID = @AccountID) >= @Amount
    BEGIN
        UPDATE Accounts
        SET Balance = Balance - @Amount
        WHERE AccountID = @AccountID;

        INSERT INTO [Transactions](TransactionID, AccountID, TransactionDate, Amount, TransactionType)
        VALUES (
            (SELECT ISNULL(MAX(TransactionID),0)+1 FROM [Transactions]),
            @AccountID,
            GETDATE(),
            @Amount,
            'Withdrawal'
        );
    END
END;
GO