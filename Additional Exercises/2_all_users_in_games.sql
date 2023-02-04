SELECT g.Name AS Game, gt.Name AS Game_Type, u.Username, ug.Level, ug.Cash, c.Name AS Character
FROM Games g
JOIN GameTypes gt ON gt.Id = g.GameTypeId
JOIN UsersGames ug ON ug.GameId = g.Id
JOIN Users u ON u.Id = ug.UserId
JOIN Characters c ON c.Id = ug.CharacterId
ORDER BY Level DESC, Username, Game