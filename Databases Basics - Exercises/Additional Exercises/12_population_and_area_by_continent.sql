SELECT ct.ContinentName, SUM(c.AreaInSqKm) AS [CountriesArea], SUM(CAST(c.Population AS BIGINT)) AS [CountriesPopulation]
FROM Continents AS ct
INNER JOIN Countries AS c
ON c.ContinentCode = ct.ContinentCode
GROUP BY ct.ContinentName
ORDER BY [CountriesPopulation] DESC
