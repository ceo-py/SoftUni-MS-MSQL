SELECT CONCAT(c.FirstName, ' ', c.LastName) AS 'FullName', a.Country, a.ZIP, FORMAT(MAX(ci.PriceForSingleCigar), '$0.00') AS 'CigarPrice'
FROM Clients AS c
JOIN Addresses AS a
ON c.AddressId = a.Id
JOIN ClientsCigars AS cc
ON c.Id = cc.ClientId
JOIN Cigars AS ci
ON cc.CigarId = ci.Id
WHERE a.ZIP NOT LIKE '%[A-Z]%'
GROUP BY c.FirstName, c.LastName, a.Country, a.ZIP
ORDER BY 'FullName'




-- WHERE a.ZIP LIKE '[0-9][0-9][0-9][0-9][0-9]'


