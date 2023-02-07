DELETE FROM Clients
WHERE AddressId in (SELECT Id FROM Addresses WHERE Country LIKE 'C%')

DELETE FROM Addresses
WHERE Country LIKE 'C%'
