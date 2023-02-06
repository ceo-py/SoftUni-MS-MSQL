CREATE FUNCTION udf_GetTouristsCountOnATouristSite (@Site VARCHAR(100))
RETURNS INT
AS
BEGIN
    DECLARE @TouristsCount INT
    SELECT @TouristsCount = COUNT(*)
    FROM SitesTourists AS st
    JOIN Sites AS s
    ON st.SiteId = s.Id
    WHERE s.Name = @Site
    RETURN @TouristsCount
END