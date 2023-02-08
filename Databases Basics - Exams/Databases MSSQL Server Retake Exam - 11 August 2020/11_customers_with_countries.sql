CREATE VIEW v_UserWithCountries AS
SELECT CONCAT(cu.FirstName, ' ', cu.LastName) AS 'CustomerName', cu.Age, cu.Gender, c.Name AS CountryName
FROM Customers AS cu
LEFT JOIN Countries AS c
ON cu.CountryId = c.Id;
