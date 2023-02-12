SELECT p.Name AS 'PlanetName', COUNT(*) AS 'JourneysCount'
FROM Planets AS p
JOIN Spaceports AS sp
ON p.Id = sp.PlanetId
JOIN Journeys AS j
ON sp.Id = j.DestinationSpaceportId
GROUP BY p.Name
ORDER BY 'JourneysCount' DESC, p.Name
