SELECT mc.CountryCode,
	COUNT(m.MountainRange) as MountainRanges
FROM Mountains as m
JOIN MountainsCountries AS mc
ON m.Id  = mc.MountainId
WHERE mc.CountryCode in ('BG', 'RU', 'US')
GROUP BY mc.CountryCode;