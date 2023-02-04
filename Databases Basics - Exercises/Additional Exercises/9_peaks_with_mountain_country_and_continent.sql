SELECT p.PeakName, m.MountainRange AS [Mountain], c.CountryName, ct.ContinentName
FROM Peaks AS p
JOIN Mountains AS m
ON m.Id = p.MountainId
JOIN MountainsCountries AS mc
ON mc.MountainId = m.Id
JOIN Countries AS c
ON c.CountryCode = mc.CountryCode
JOIN Continents AS ct
ON ct.ContinentCode = c.ContinentCode
ORDER BY p.PeakName, c.CountryName
