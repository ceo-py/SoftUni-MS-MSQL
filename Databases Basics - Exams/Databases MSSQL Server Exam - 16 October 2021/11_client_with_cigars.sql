CREATE FUNCTION udf_ClientWithCigars (@name VARCHAR(50))
RETURNS INT
AS
BEGIN
    DECLARE @cigars INT
    SELECT @cigars = COUNT(*)
    FROM ClientsCigars AS cc
    JOIN Clients AS c
    ON c.Id = cc.ClientId
    WHERE c.FirstName = @name
    RETURN @cigars
END

