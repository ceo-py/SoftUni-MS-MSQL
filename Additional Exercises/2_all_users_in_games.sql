SELECT g.Name AS Game, gt.Name AS Game_Type, u.Username, ug.Level, ug.Cash, c.Name AS Character
FROM Games AS g
JOIN GameTypes AS gt
ON gt.Id = g.GameTypeId
JOIN UsersGames AS ug
ON ug.GameId = g.Id
JOIN Users AS u
ON u.Id = ug.UserId
JOIN Characters AS c
ON c.Id = ug.CharacterId
ORDER BY Level DESC, Username, Game