DELETE FROM FlightDestinations
WHERE PassengerId in (SELECT Id FROM Passengers WHERE LEN(FullName) <= 10)

DELETE FROM Passengers
WHERE LEN(FullName) <= 10
