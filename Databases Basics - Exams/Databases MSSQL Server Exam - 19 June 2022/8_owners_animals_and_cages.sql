SELECT CONCAT(o.Name, '-', a.Name) as 'OwnersAnimals', o.PhoneNumber, c.Id AS 'CageId'
FROM Owners AS o
JOIN Animals AS a
ON o.Id = a.OwnerId
JOIN AnimalTypes AS at
ON a.AnimalTypeId = at.Id
JOIN AnimalsCages AS ac
ON ac.AnimalId = a.Id
JOIN Cages AS c
ON ac.CageId = c.Id
WHERE at.AnimalType = 'Mammals'
ORDER BY o.Name, a.Name DESC
