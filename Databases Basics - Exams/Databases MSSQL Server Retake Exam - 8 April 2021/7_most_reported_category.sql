SELECT TOP(5) c.Name AS 'CategoryName', COUNT(r.CategoryId) AS 'ReportsNumber'
FROM Categories AS c
JOIN Reports AS r
on c.Id = r.CategoryId
GROUP BY c.Name
ORDER BY 'ReportsNumber' DESC, 'CategoryName'
