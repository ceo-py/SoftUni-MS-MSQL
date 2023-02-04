CREATE FUNCTION ufn_CalculateFutureValue (@sum DECIMAL(18, 4), @rate FLOAT, @years INT)
RETURNS DECIMAL(18, 4)
AS
BEGIN
DECLARE @futureValue DECIMAL(18, 4)
SET @futureValue = @sum * POWER(1 + @rate, @years)
RETURN ROUND(@futureValue, 4)
END