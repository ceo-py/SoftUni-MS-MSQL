SELECT FirstName
FROM Employees
AS e
WHERE e.DepartmentID in (3, 10) AND DATEPART(Year, HireDate) BETWEEN 1995 AND 2005;