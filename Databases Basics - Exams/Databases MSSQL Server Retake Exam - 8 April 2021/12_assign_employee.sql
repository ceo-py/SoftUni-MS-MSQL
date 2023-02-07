CREATE PROCEDURE usp_AssignEmployeeToReport (@EmployeeId INT, @ReportId INT)
AS
BEGIN
DECLARE @EmployeeDepartment INT, @ReportCategoryDepartment INT
SELECT @EmployeeDepartment = DepartmentId
FROM Employees
WHERE Id = @EmployeeId
SELECT @ReportCategoryDepartment = c.DepartmentId
FROM Reports AS r
JOIN Categories AS c
ON r.CategoryId = c.Id
WHERE r.Id = @ReportId
IF @EmployeeDepartment <> @ReportCategoryDepartment
BEGIN
RAISERROR ('Employee doesn''t belong to the appropriate department!', 16, 1)
END
ELSE
BEGIN
UPDATE Reports
SET EmployeeId = @EmployeeId
WHERE Id = @ReportId
END
END