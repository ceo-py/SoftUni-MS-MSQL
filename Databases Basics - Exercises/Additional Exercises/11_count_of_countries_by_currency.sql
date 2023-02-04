SELECT cr.CurrencyCode AS [CurrencyCode], cr.Description AS [Currency], COUNT(c.CountryName) AS [NumberOfCountries]
FROM Currencies AS cr
LEFT JOIN Countries AS c
ON c.CurrencyCode = cr.CurrencyCode
GROUP BY cr.CurrencyCode, cr.Description
ORDER BY [NumberOfCountries] DESC, cr.Description
