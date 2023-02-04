SELECT TOP(50) FirstName, LastName, Name, AddressText AS AddressText
FROM Employees AS e
JOIN Addresses AS a
ON e.AddressID = a.AddressId
JOIN Towns AS t
ON a.TownID = t.TownID
ORDER BY FirstName, LastName
