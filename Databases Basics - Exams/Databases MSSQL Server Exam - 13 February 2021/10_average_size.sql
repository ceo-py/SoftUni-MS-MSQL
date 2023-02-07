SELECT u.Username, AVG(f.Size) AS 'Size'
FROM Users as u
JOIN Commits as c
ON u.Id = c.ContributorId
JOIN Files as f
ON c.Id = f.CommitId
GROUP BY u.Username
ORDER BY 'Size' DESC, u.Username
