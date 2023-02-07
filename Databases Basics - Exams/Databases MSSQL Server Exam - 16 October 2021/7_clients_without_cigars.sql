SELECT c.Id, CONCAT(c.FirstName, ' ', c.LastName) as 'ClientName', c.Email
FROM Clients AS c
WHERE c.Id NOT IN (SELECT cc.ClientId FROM ClientsCigars AS cc)
ORDER BY 'ClientName'


-- SELECT c.Id,  CONCAT(c.FirstName, ' ', c.LastName) as 'ClientName', c.Email
-- FROM Clients AS c
-- LEFT JOIN ClientsCigars AS cc
-- on c.Id = cc.ClientId
-- WHERE c.Id NOT IN (SELECT cc.ClientId FROM ClientsCigars AS cc)
-- ORDER BY 'ClientName'


--
-- SELECT c.Id,  CONCAT(c.FirstName, ' ', c.LastName) as 'ClientName', c.Email
-- FROM Clients AS c
-- LEFT JOIN ClientsCigars AS cc
-- on c.Id = cc.ClientId
-- WHERE cc.ClientId IS NULL
-- ORDER BY 'ClientName'