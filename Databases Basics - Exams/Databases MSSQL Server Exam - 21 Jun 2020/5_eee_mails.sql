SELECT a.FirstName, a.LastName, FORMAT(a.BirthDate, 'MM-dd-yyyy') AS 'BirthDate', c.Name, a.Email
FROM Accounts AS a
JOIN Cities as c
on a.CityId = c.Id
WHERE a.Email LIKE 'e%'
ORDER BY c.Name
