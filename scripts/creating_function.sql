-- =========================================
-- FUNCTIONS
-- =========================================
-- Compute Interest
CREATE FUNCTION fn_ComputeInterest (@Balance DECIMAL(15,2))
RETURNS DECIMAL(15,2)
AS
BEGIN
    RETURN @Balance * 0.05;
END;
GO


-- Minimum Balance Check
CREATE FUNCTION fn_MinBalance (@Balance DECIMAL(15,2))
RETURNS BIT
AS
BEGIN
    RETURN CASE WHEN @Balance >= 100 THEN 1 ELSE 0 END;
END;
GO