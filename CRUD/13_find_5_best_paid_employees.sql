SELECT FirstName, LastName
FROM (
    SELECT FirstName, LastName,
    ROW_NUMBER() OVER (ORDER BY Salary DESC) AS RowNum
    FROM Employees
    )
AS Emp
WHERE RowNum <= 5;