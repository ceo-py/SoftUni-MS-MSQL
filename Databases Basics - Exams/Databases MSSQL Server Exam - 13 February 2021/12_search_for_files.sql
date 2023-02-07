CREATE PROCEDURE usp_SearchForFiles (@fileExtension VARCHAR(10))
AS
BEGIN
SET NOCOUNT ON;
SELECT f.Id, f.Name, CONCAT(f.Size, 'KB')
FROM Files AS f
WHERE f.name LIKE '%' + @fileExtension
ORDER BY f.Id, f.Name, f.Size DESC
END
