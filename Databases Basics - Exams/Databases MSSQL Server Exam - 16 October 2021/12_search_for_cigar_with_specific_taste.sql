CREATE PROC usp_SearchByTaste (@taste VARCHAR(30))
AS
BEGIN
SELECT ci.CigarName, FORMAT(ci.PriceForSingleCigar, '$0.00') AS 'Price',
       t.TasteType,  b.BrandName, FORMAT(s.Length, '0 cm') AS 'CigarLength',
       FORMAT(s.RingRange, '0.00 cm') AS 'CigarRingRange'
FROM Cigars AS ci
JOIN Tastes AS t
ON ci.TastId = t.Id
JOIN Brands AS b
ON ci.BrandId = b.Id
JOIN Sizes AS s
ON ci.SizeId = s.Id
WHERE t.TasteType = @taste
ORDER BY 'CigarLength', 'CigarRingRange' DESC
END
