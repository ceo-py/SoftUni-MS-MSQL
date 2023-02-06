SELECT s.Name AS 'Site', l.Name AS 'Location', s.Establishment, c.Name AS Category
FROM Sites AS s
JOIN Categories AS c
ON s.CategoryId = c.Id
JOIN Locations AS l
ON s.LocationId = l.Id
ORDER BY Category DESC, 'Location', 'Site'