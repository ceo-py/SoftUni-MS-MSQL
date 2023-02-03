SELECT DepartmentID, MAX(Salary) AS ThirdHighestSalary
FROM
(
SELECT DepartmentID, Salary,
ROW_NUMBER() OVER (PARTITION BY DepartmentID ORDER BY Salary DESC) AS RowNum
FROM Employees) AS derived
WHERE RowNum = 3
GROUP BY DepartmentID