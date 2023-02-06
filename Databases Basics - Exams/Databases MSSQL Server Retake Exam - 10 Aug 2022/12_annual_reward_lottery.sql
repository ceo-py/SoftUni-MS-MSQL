CREATE PROC usp_AnnualRewardLottery(@TouristName VARCHAR(50))
AS
BEGIN
    DECLARE @visitCount INT = (SELECT COUNT(s.Id)
    FROM Sites AS s
    JOIN SitesTourists AS st ON s.Id = st.SiteId
    JOIN Tourists AS t ON st.TouristId = t.Id
    WHERE t.Name = @TouristName)
    IF @visitCount >= 100
    UPDATE Tourists
    SET Reward = 'Gold badge'
    WHERE Name = @TouristName
    ELSE IF @visitCount >= 50
    UPDATE Tourists
    SET Reward = 'Silver badge'
    WHERE Name = @TouristName
    ELSE IF @visitCount >= 25
    UPDATE Tourists
    SET Reward = 'Bronze badge'
    WHERE Name = @TouristName
    SELECT Name, Reward
    FROM Tourists
    WHERE Name = @TouristName
END
