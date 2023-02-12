CREATE FUNCTION udf_GetColonistsCount (@PlanetName VARCHAR(50))
RETURNS INT
AS
BEGIN
    DECLARE @colonists INT
    SELECT @colonists = COUNT(*)
    FROM Colonists AS c
    JOIN TravelCards AS tc
    ON c.Id = tc.ColonistId
	JOIN Journeys AS j
    ON tc.JourneyId = j.Id
	JOIN Spaceports AS sp
    ON j.DestinationSpaceportId = sp.Id
	JOIN Planets AS p
    ON sp.PlanetId = p.Id
    WHERE p.Name = @PlanetName
    RETURN @colonists
END
