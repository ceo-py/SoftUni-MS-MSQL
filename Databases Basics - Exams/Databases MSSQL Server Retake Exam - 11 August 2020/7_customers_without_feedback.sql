SELECT CONCAT(c.FirstName, ' ', c.LastName) AS 'CustomerName', c.PhoneNumber, c.Gender
FROM Customers AS c
WHERE c.Id NOT IN (SELECT CustomerId FROM Feedbacks)
ORDER BY c.Id

