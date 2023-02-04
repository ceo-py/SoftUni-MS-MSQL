SELECT *
FROM Towns
WHERE Name LIKE 'M%' OR
	  Name LIKE 'K%' OR
	  Name LIKE 'B%' OR
	  Name LIKE 'E%'
ORDER BY Name





--
-- SELECT * FROM Towns
-- WHERE LEFT(Name, 1) IN ('M', 'K', 'B', 'E')
-- ORDER BY Name