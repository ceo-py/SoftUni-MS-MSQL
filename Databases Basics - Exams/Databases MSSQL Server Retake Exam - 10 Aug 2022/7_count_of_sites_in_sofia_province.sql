SELECT l.Province, l.Municipality, l.Name AS 'Location', COUNT(l.Name) AS 'CountOfSites'
FROM Locations AS l
JOIN Sites AS s
on s.LocationId = l.Id
WHERE l.Province = 'Sofia'
GROUP BY l.Province, l.Municipality, l.Name
ORDER BY 'CountOfSites' DESC, l.Name