SELECT TOP(5) EmployeeID, JobTitle, a.AddressID, AddressText AS AddressText
FROM Employees AS e
JOIN Addresses AS a
ON e.AddressID = a.AddressId
ORDER BY AddressId
