CREATE PROCEDURE usp_SearchByAirportName (@airportName VARCHAR(70))
AS
BEGIN
  SELECT a.AirportName, p.FullName,
    CASE
      WHEN FD.TicketPrice <= 400 THEN 'Low'
      WHEN FD.TicketPrice BETWEEN 401 AND 1500 THEN 'Medium'
      ELSE 'High'
    END AS LevelOfTicketPrice,
    ac.Manufacturer,
    ac.Condition,
    at.TypeName
  FROM
    Airports AS a
    JOIN FlightDestinations AS fd
	ON a.Id = fd.AirportId
    JOIN Passengers AS p
	ON fd.PassengerId = P.Id
    JOIN Aircraft AS ac
	ON fd.AircraftId = ac.Id
    JOIN AircraftTypes AS at
	ON ac.TypeId = at.Id
  WHERE
    a.AirportName = @airportName
  ORDER BY
    ac.Manufacturer,
    p.FullName
END
