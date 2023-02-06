SELECT TOP(20) fd.Id AS 'DestinationId', fd.Start, p.FullName, a.AirportName, fd.TicketPrice
FROM Passengers AS p
JOIN FlightDestinations AS fd
ON fd.PassengerId = p.Id
JOIN Airports AS a
ON fd.AirportId = a.Id
WHERE DAY(fd.Start) % 2 = 0
ORDER BY fd.TicketPrice DESC, a.AirportName