CREATE FUNCTION udf_CreatorWithBoardgames (@name VARCHAR(50))
RETURNS INT
AS
BEGIN
    DECLARE @names INT
    SELECT @names = COUNT(*)
    FROM Creators AS c
    JOIN CreatorsBoardgames AS cb
    ON c.Id = cb.CreatorId
    WHERE c.FirstName = @name
    RETURN @names
END
