SELECT * INTO HighEarningEmployees
FROM Employees
WHERE Salary > 30000

DELETE FROM HighEarningEmployees
WHERE ManagerID = 42;

UPDATE HighEarningEmployees
SET Salary = Salary + 5000
WHERE DepartmentID = 1;

SELECT DepartmentID, AVG(Salary) AS AverageSalary
FROM HighEarningEmployees
GROUP BY DepartmentID;