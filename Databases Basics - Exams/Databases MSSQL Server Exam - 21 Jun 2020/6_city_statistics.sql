SELECT c.Name AS 'City', COUNT(h.CityId) AS 'Hotels'
FROM Cities AS c
JOIN Hotels as h
on c.Id = h.CityId
GROUP BY c.Name
ORDER BY 'Hotels' DESC, 'City'
