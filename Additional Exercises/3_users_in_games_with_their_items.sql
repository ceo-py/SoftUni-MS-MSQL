SELECT u.Username, g.Name,
COUNT(i.Id) AS 'Items Count',
SUM(i.Price) AS 'Items Price'
FROM Games g
JOIN UsersGames AS ug
ON ug.GameId = g.Id
JOIN Users AS u
ON u.Id = ug.UserId
JOIN UserGameItems ugi
ON ugi.UserGameId = ug.Id
JOIN Items AS i
ON i.Id = ugi.ItemId
GROUP BY u.Username, g.Name
HAVING COUNT(i.Id) >= 10
ORDER BY 'Items Count' DESC, 'Items Price' DESC, u.Username