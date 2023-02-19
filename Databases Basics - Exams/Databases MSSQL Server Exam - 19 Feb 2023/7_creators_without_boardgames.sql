SELECT c.Id, CONCAT(c.FirstName, ' ', c.LastName) AS CreatorName, c.Email
FROM Creators AS c
WHERE c.Id NOT IN (SELECT cb.CreatorId FROM CreatorsBoardgames AS cb WHERE cb.CreatorId = c.Id)
ORDER BY CONCAT(c.FirstName, ' ', c.LastName)

