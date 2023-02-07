SELECT IIF(e.FirstName IS NULL AND e.LastName IS NULL, 'None', e.FirstName + ' ' + e.LastName) AS 'Employee',
	   ISNULL(d.Name, 'None') AS 'Department',
	    c.Name AS 'Category',
		r.Description,
		FORMAT(r.OpenDate, 'dd.MM.yyyy') AS 'OpenDate',
		s.Label AS 'Status',
		u.Name AS 'User'
FROM Reports AS r
LEFT JOIN Employees AS e
ON r.EmployeeId = e.Id
LEFT JOIN Categories AS c
ON r.CategoryId = c.Id
LEFT JOIN Status AS s
ON r.StatusId = s.Id
LEFT JOIN Users AS u
ON r.UserId = u.Id
LEFT JOIN Departments AS d
ON d.Id = e.DepartmentId
ORDER BY e.FirstName DESC, e.LastName DESC, 'Department', 'Category', r.Description, 'OpenDate', 'Status', 'User'
