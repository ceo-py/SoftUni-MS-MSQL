SELECT a.Id AS 'AircraftId', a.Manufacturer, a.FlightHours, COUNT(fd.AirportId) AS 'FlightDestinationsCount', ROUND(AVG(fd.TicketPrice), 2) AS 'AvgPrice'
FROM Aircraft AS a
LEFT JOIN FlightDestinations AS fd
ON a.Id = fd.AircraftId
GROUP BY a.Id, a.Manufacturer, a.FlightHours
HAVING COUNT('FlightDestinationsCount') >= 2
ORDER BY 'FlightDestinationsCount' DESC,'AircraftId';
