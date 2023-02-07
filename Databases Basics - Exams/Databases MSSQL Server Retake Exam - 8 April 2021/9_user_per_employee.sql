SELECT CONCAT(e.FirstName, ' ', e.LastName) as 'FullName', COUNT(DISTINCT r.UserId) as 'UsersCount'
FROM Employees AS e
LEFT JOIN Reports AS r
ON e.Id = r.EmployeeId
GROUP BY e.FirstName, e.LastName
ORDER BY 'UsersCount' DESC, 'FullName'
