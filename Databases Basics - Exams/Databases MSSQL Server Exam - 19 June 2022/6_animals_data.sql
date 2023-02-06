SELECT a.Name, at.AnimalType, CONVERT(VARCHAR(10), a.BirthDate, 104) AS BirthDate
FROM Animals AS a
JOIN AnimalTypes AS at
ON a.AnimalTypeId =  at.Id
ORDER BY a.Name
