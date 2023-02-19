CREATE PROCEDURE usp_SearchByCategory
    @category NVARCHAR(50)
AS
BEGIN
    SELECT b.Name, b.YearPublished, b.Rating, c.Name AS 'CategoryName', p.Name AS 'PublisherName',
        CONCAT(pr.PlayersMin, ' people') AS 'MinPlayers', CONCAT(pr.PlayersMax, ' people') AS 'MaxPlayers'
    FROM Boardgames AS b
    JOIN Categories c ON b.CategoryId = c.Id
    JOIN Publishers p ON b.PublisherId = p.Id
    JOIN PlayersRanges pr ON b.PlayersRangeId = pr.Id
    WHERE c.Name = @category
    ORDER BY p.Name ASC, b.YearPublished DESC
END
