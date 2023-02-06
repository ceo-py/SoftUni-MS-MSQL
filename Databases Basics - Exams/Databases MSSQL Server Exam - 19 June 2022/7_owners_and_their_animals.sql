SELECT TOP(5) o.Name AS 'Owner', COUNT(a.OwnerId) AS 'CountOfAnimals'
FROM Owners AS o
JOIN Animals AS a
on o.Id = a.OwnerId
GROUP BY o.Name
ORDER BY 'CountOfAnimals' DESC
