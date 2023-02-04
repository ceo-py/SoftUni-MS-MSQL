CREATE TRIGGER tr_AddEntityToDeletedEmployeesTable
ON Employees FOR DELETE
AS
INSERT INTO Deleted_Employees
SELECT	FirstName, LastName, MiddleName, JobTitle, DepartmentID, Salary
FROM deleted