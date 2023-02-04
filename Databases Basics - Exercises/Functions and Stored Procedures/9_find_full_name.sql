CREATE PROCEDURE usp_GetHoldersFullName
AS
BEGIN
SELECT FirstName + ' ' + LastName AS FullName
FROM AccountHolders
END
