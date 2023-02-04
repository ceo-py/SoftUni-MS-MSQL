CREATE PROCEDURE usp_CalculateFutureValueForAccount (@AccountId INT, @InterestRate FLOAT)
AS
BEGIN
	DECLARE @FutureValue DECIMAL(18, 4)
	DECLARE @CurrentBalance DECIMAL(18, 4)
	DECLARE @FirstName VARCHAR(50)
	DECLARE @LastName VARCHAR(50)

	SELECT
		@CurrentBalance = a.Balance,
		@FirstName = ah.FirstName,
		@LastName = ah.LastName
	FROM
		Accounts a
		JOIN AccountHolders ah ON a.AccountHolderId = ah.Id
	WHERE
		a.Id = @AccountId

	SET @FutureValue = dbo.ufn_CalculateFutureValue(@CurrentBalance, @InterestRate, 5)

	SELECT @AccountId AS AccountId, @FirstName AS FirstName, @LastName AS LastName, @CurrentBalance AS CurrentBalance, @FutureValue AS FutureValue
END