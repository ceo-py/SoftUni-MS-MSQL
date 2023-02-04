SELECT u.Username AS [Username],
g.Name AS [Game],
MAX(c.Name) AS [Character],
SUM(ist.Strength) + MAX(gst.Strength) + MAX(cs.Strength) AS [Strength],
SUM(ist.Defence) + MAX(gst.Defence) + MAX(cs.Defence) AS [Defence],
SUM(ist.Speed) + MAX(gst.Speed) + MAX(cs.Speed) AS [Speed],
SUM(ist.Mind) + MAX(gst.Mind) + MAX(cs.Mind) AS [Mind],
SUM(ist.Luck) + MAX(gst.Luck) + MAX(cs.Luck) AS [Luck]
FROM Users AS u
JOIN UsersGames AS ug
ON ug.UserId = u.Id
JOIN Games AS g
ON g.Id = ug.GameId
JOIN Characters AS c
ON c.Id = ug.CharacterId
JOIN GameTypes AS gt
ON gt.Id = g.GameTypeId
JOIN [Statistics] AS gst
ON gst.Id = gt.BonusStatsId
JOIN [Statistics] AS cs
ON cs.Id = c.StatisticId
JOIN UserGameItems AS ugi
ON ugi.UserGameId = ug.Id
JOIN Items AS i
ON i.Id = ugi.ItemId
JOIN [Statistics] AS ist
ON ist.Id = i.StatisticId
 GROUP BY u.Username, g.Name
ORDER BY [Strength] DESC, [Defence] DESC, [Speed] DESC, [Mind] DESC, [Luck] DESC