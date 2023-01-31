SELECT mc.CountryCode, m.MountainRange, p.PeakName, p.Elevation
FROM Peaks as p
JOIN Mountains AS m
ON p.MountainId = m.ID
JOIN MountainsCountries AS mc
ON p.MountainId  = mc.MountainId
WHERE p.Elevation > 2835 AND mc.CountryCode = 'BG'
ORDER BY p.Elevation DESC
