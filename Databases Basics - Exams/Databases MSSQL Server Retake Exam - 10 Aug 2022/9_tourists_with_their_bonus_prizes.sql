SELECT t.Name, t.Age, t.PhoneNumber, t.Nationality,
COALESCE(bp.Name, '(no bonus prize)') AS BonusPrize
FROM Tourists as t
LEFT JOIN TouristsBonusPrizes AS tbp
ON t.Id = tbp.TouristId
LEFT JOIN BonusPrizes AS bp
ON tbp.BonusPrizeId = bp.Id
ORDER BY t.Name
