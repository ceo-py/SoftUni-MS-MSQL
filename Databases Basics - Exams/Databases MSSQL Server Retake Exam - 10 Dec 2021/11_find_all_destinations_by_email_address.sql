CREATE FUNCTION udf_FlightDestinationsByEmail (@email VARCHAR(100))
RETURNS INT
AS
BEGIN
    DECLARE @flight_destinations  INT
    SELECT @flight_destinations = COUNT(*)
    FROM Passengers AS p
    JOIN FlightDestinations AS fd
    ON p.Id = fd.PassengerId
    WHERE p.Email = @email
    RETURN @flight_destinations
END
