CREATE PROCEDURE usp_GetEmployeesSalaryAboveNumber (@SalaryThreshold DECIMAL(18,4))
AS
BEGIN
SELECT FirstName, LastName
FROM Employees
WHERE Salary >= @SalaryThreshold
END