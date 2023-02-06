SELECT a.Name, YEAR(a.BirthDate) AS 'BirthYear', at.AnimalType
FROM Animals AS a
LEFT JOIN AnimalTypes AS at
ON a.AnimalTypeId = at.Id
WHERE a.OwnerId IS NULL AND BirthDate >= DATEADD(year, -4, '2022-01-01') AND AnimalType != 'Birds'
ORDER BY Name
