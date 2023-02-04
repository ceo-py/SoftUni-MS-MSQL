DECLARE @userGameId INT, @itemsCost DECIMAL(18, 4), @minLevel INT, @maxLevel INT, @playerCash DECIMAL(18, 4);
SET @userGameId = (SELECT ug.Id
FROM UsersGames ug
JOIN Users u ON ug.UserId = u.Id
JOIN Games g ON ug.GameId = g.Id
WHERE u.Username = 'Stamat' AND g.Name = 'Safflower');

SET @minLevel = 11;
SET @maxLevel = 12;
SET @playerCash = (SELECT Cash
FROM UsersGames
WHERE Id = @userGameId);
SET @itemsCost = (SELECT SUM(Price)
FROM Items
WHERE MinLevel BETWEEN @minLevel AND @maxLevel);
IF (@playerCash >= @itemsCost)
BEGIN
BEGIN TRANSACTION;
UPDATE UsersGames
SET Cash -= @itemsCost
WHERE Id = @userGameId;
INSERT INTO UserGameItems (ItemId, UserGameId)
SELECT Id, @userGameId
FROM Items
WHERE MinLevel BETWEEN @minLevel AND @maxLevel;
COMMIT;
END;

SET @minLevel = 19;
SET @maxLevel = 21;
SET @playerCash = (SELECT Cash
FROM UsersGames
WHERE Id = @userGameId);
SET @itemsCost = (SELECT SUM(Price)
FROM Items
WHERE MinLevel BETWEEN @minLevel AND @maxLevel);
IF (@playerCash >= @itemsCost)
BEGIN
BEGIN TRANSACTION;
UPDATE UsersGames
SET Cash -= @itemsCost
WHERE Id = @userGameId;
INSERT INTO UserGameItems (ItemId, UserGameId)
SELECT Id, @userGameId
FROM Items
WHERE MinLevel BETWEEN @minLevel AND @maxLevel;
COMMIT;
END;

SELECT i.Name AS 'Item Name'
FROM UserGameItems ugi
JOIN Items i ON i.Id = ugi.ItemId
JOIN UsersGames ug ON ug.Id = ugi.UserGameId
JOIN Games g ON g.Id = ug.GameId
WHERE g.Name = 'Safflower'
ORDER BY 'Item Name';