SELECT c.Id, c.CigarName, c.PriceForSingleCigar, t.TasteType, t.TasteStrength
FROM Cigars AS c
JOIN Tastes AS t
ON c.TastId =  t.Id
WHERE t.TasteType in ('Earthy', 'Woody')
ORDER BY c.PriceForSingleCigar DESC
