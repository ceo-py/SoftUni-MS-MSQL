SELECT f.Id, f.Name, CONCAT(f.Size, 'KB') AS 'Size'
FROM Files AS f
WHERE NOT EXISTS (SELECT * FROM Files AS f2 WHERE f2.ParentId = f.Id)
ORDER BY f.Id, f.Name, f.Size DESC
