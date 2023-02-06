CREATE FUNCTION udf_GetVolunteersCountFromADepartment (@VolunteersDepartment VARCHAR(50))
RETURNS INT
AS
BEGIN
    DECLARE @volunteers INT
    SELECT @volunteers = COUNT(*)
    FROM Volunteers AS v
    JOIN VolunteersDepartments AS vd
    ON v.DepartmentId = vd.Id
    WHERE vd.DepartmentName = @VolunteersDepartment
    RETURN @volunteers
END
