SELECT CONCAT(FirstName, ' ', MiddleName, ' ', LastName) AS "Full Name"
FROM Employees
WHERE Salary in (25000, 14000, 12500, 23600);
