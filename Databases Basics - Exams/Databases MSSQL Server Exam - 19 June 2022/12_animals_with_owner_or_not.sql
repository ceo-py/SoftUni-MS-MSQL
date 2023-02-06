CREATE PROC usp_AnimalsWithOwnersOrNot (@AnimalName VARCHAR(30))
AS
BEGIN
DECLARE @OwnerId INT = (SELECT OwnerId FROM Animals WHERE Name = @AnimalName)
IF @OwnerId IS NULL
SELECT Name, 'For adoption' AS OwnerName FROM Animals WHERE Name = @AnimalName
ELSE
SELECT a.Name, o.Name AS OwnerName
FROM Animals AS a
JOIN Owners AS o
ON o.Id = a.OwnerId
WHERE a.Name = @AnimalName
END
