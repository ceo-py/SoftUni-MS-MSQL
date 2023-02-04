CREATE PROCEDURE usp_GetHoldersWithBalanceHigherThan (@balance DECIMAL(18,4))
AS
BEGIN
SELECT FirstName, LastName
FROM AccountHolders AS ah
WHERE (SELECT SUM(Balance)
FROM Accounts
WHERE AccountHolderId = ah.Id) > @balance
ORDER BY FirstName, LastName
END
