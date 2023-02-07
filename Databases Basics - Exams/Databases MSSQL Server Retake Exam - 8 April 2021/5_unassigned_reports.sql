SELECT r.Description, FORMAT(r.OpenDate, 'dd-MM-yyyy')
FROM Reports as r
WHERE r.EmployeeId is NULL
ORDER BY r.OpenDate, r.Description
