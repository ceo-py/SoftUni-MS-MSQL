SELECT p.FullName, COUNT(fd.PassengerId) AS 'CountOfAircraft', SUM(fd.TicketPrice) AS 'TotalPayed'
FROM Passengers as p
JOIN FlightDestinations AS fd
ON p.Id = fd.PassengerId
WHERE p.FullName LIKE '_a%'
GROUP BY p.FullName
HAVING COUNT(DISTINCT fd.AircraftId) > 1
ORDER BY p.FullName
