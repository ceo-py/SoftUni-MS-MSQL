SELECT s.Name, s.Manufacturer
FROM Spaceships AS s
JOIN Journeys AS j
ON s.Id = j.SpaceshipId
JOIN TravelCards AS tc
ON j.Id = tc.JourneyId
JOIN Colonists AS c
ON c.Id = tc.ColonistId
WHERE DATEDIFF(YEAR, c.BirthDate, '2019.01.01') < 30 AND tc.JobDuringJourney = 'Pilot'
ORDER BY s.Name
