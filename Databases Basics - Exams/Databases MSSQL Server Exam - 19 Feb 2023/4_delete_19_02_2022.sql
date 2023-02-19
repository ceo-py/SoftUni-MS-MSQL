BEGIN TRANSACTION

DECLARE @AddressIds TABLE (Id INT);

INSERT INTO @AddressIds (Id)
SELECT Id
FROM Addresses
WHERE Town LIKE 'L%';

DELETE FROM CreatorsBoardgames
WHERE BoardgameId IN (
  SELECT Id
  FROM Boardgames
  WHERE PublisherId IN (SELECT Id FROM Publishers WHERE AddressId IN (SELECT Id FROM @AddressIds))
 )

DELETE FROM Boardgames
WHERE PublisherId IN ( SELECT Id FROM Publishers WHERE AddressId IN (SELECT Id FROM @AddressIds))

DELETE FROM Publishers WHERE AddressId IN (SELECT Id FROM @AddressIds)

DELETE FROM Addresses WHERE Id IN (SELECT Id FROM @AddressIds)

COMMIT TRANSACTION
