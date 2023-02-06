SELECT a.AirportName, fd.Start AS 'DayTime', fd.TicketPrice, p.FullName, ac.Manufacturer, ac.model AS 'Model'
FROM Passengers AS p
JOIN FlightDestinations AS fd
ON p.Id = fd.PassengerId
JOIN Aircraft AS ac
ON fd.AircraftId = ac.Id
JOIN Airports AS a
ON fd.AirportId = a.Id
WHERE DATEPART(HOUR, fd.Start) BETWEEN 6 AND 20 AND fd.TicketPrice > 2500
ORDER BY 'Model'
