CREATE PROCEDURE usp_GetTownsStartingWith (@StartWith VARCHAR(50))
AS
BEGIN
SELECT Name AS Town
FROM Towns
WHERE Name LIKE @StartWith + '%'
END