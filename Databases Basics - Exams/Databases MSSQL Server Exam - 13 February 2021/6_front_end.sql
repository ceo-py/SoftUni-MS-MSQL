SELECT f.Id, f.Name, f.Size
FROM Files AS f
WHERE f.Size > 1000 and f.Name LIKE '%html%'
ORDER BY f.Size DESC, f.Id, f.Name
