SELECT u.Username, c.Name AS 'CategoryName'
FROM Users AS u
JOIN Reports AS r
ON u.Id = r.UserId
JOIN Categories AS c
ON r.CategoryId = c.Id
WHERE MONTH(u.Birthdate) = MONTH(r.OpenDate) AND DAY(u.Birthdate) = DAY(r.OpenDate)
ORDER BY u.Username, 'CategoryName'
