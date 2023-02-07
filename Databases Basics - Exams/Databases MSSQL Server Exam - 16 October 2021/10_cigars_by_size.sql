SELECT c.LastName, AVG(s.Length) AS 'CiagrLength', CEILING(AVG(s.RingRange)) AS 'CiagrRingRange'
FROM Clients AS c
JOIN ClientsCigars AS cc
ON c.Id = cc.ClientId
JOIN Cigars AS ci
ON cc.CigarId = ci.Id
JOIN Sizes AS s
ON ci.SizeId = s.Id
GROUP BY C.LastName
ORDER BY 'CiagrLength' DESC
