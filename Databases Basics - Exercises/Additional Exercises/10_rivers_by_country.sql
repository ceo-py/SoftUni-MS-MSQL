SELECT c.CountryName, ct.ContinentName, COUNT(r.Id) AS [RiversCount], ISNULL(SUM(r.Length), 0)  AS [TotalLength]
FROM Countries AS c
JOIN Continents AS ct
ON ct.ContinentCode = c.ContinentCode
LEFT JOIN CountriesRivers AS cr
ON cr.CountryCode = c.CountryCode
LEFT JOIN Rivers AS r
ON r.Id = cr.RiverId
GROUP BY c.CountryName, ct.ContinentName
ORDER BY [RiversCount] DESC, [TotalLength] DESC, c.CountryName
