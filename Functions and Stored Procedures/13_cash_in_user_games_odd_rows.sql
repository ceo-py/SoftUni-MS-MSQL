CREATE FUNCTION ufn_CashInUsersGames(@gameName VARCHAR(50))
RETURNS TABLE
AS
RETURN
(
SELECT SUM(Cash) AS SumCash
FROM
(
SELECT Cash, ROW_NUMBER() OVER (ORDER BY Cash DESC) AS RowNumber
FROM UsersGames as ug
JOIN Games AS g
ON ug.GameId = g.Id
WHERE g.Name = @gameName
) AS t
WHERE RowNumber % 2 = 1
)
