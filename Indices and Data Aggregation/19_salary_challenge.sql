SELECT TOP (10) e.FirstName, e.LastName, e.DepartmentID
FROM Employees AS e
JOIN
(
SELECT DepartmentID, AVG(Salary) AS AverageSalary
FROM Employees
GROUP BY DepartmentID
) AS AvgTable
ON e.DepartmentID = AvgTable.DepartmentID
WHERE e.Salary > AvgTable.AverageSalary
ORDER BY e.DepartmentID