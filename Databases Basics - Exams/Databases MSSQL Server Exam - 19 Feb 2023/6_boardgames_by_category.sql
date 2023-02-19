SELECT b.Id, b.Name, b.YearPublished, c.Name
FROM Boardgames AS b
JOIN Categories AS c
ON b.CategoryId = c.Id
WHERE b.CategoryId in  (8, 6)
ORDER BY YearPublished DESC
