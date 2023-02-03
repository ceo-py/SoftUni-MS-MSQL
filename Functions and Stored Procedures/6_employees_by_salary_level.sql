CREATE PROCEDURE usp_EmployeesBySalaryLevel (@Level VARCHAR(7))
AS
BEGIN
    SELECT FirstName, LastName
    FROM Employees
    WHERE dbo.ufn_GetSalaryLevel(Salary) = @Level
END