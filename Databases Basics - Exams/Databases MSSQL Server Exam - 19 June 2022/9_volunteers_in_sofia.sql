SELECT v.Name, v.PhoneNumber, SUBSTRING(v.Address, CHARINDEX(',', v.Address) + 1, LEN(v.Address)) AS 'Address'
FROM Volunteers as v
JOIN VolunteersDepartments AS vd
ON v.DepartmentId = vd.Id
WHERE vd.DepartmentName = 'Education program assistant' AND v.Address LIKE ('%Sofia%')
ORDER BY v.Name

