INSERT INTO Passengers (FullName, Email)
SELECT CONCAT(FirstName, ' ', LastName) AS FullName,
       CONCAT(REPLACE(FirstName, ' ', ''), REPLACE(LastName, ' ', ''), '@gmail.com') AS Email
FROM Pilots
WHERE id BETWEEN 5 AND 15;
