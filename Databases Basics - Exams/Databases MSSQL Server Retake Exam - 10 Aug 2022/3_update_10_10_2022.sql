UPDATE Sites
SET Establishment = '(not defined)'
WHERE Establishment IS NULL;

SELECT Establishment
FROM Sites;