SELECT t.Id, CONCAT(a.FirstName + ' ', a.MiddleName + ' ', a.LastName) AS 'Full Name', c.Name AS 'From',
    ci.Name AS 'To',
    CASE
        WHEN t.CancelDate IS NOT NULL THEN 'Canceled'
        ELSE CONCAT(DATEDIFF(DAY, t.ArrivalDate, t.ReturnDate), ' days')
    END AS Duration
FROM Trips AS t
JOIN AccountsTrips AS at
ON t.Id = at.TripId
JOIN Accounts AS a
ON at.AccountId = a.Id
JOIN Cities AS c
ON a.CityId = c.Id
JOIN Rooms AS r
ON t.RoomId = r.Id
JOIN Hotels AS h
ON r.HotelId = h.Id
JOIN Cities AS ci
ON h.CityId = ci.Id
ORDER BY 'Full Name', t.Id
