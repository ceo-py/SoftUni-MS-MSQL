SELECT at.TripId AS 'Id', CONCAT(a.FirstName, ' ', a.MiddleName, ' ', a.LastName) AS 'Full Name', ci.Name AS 'From', c.Name AS 'T',
	CASE
		WHEN t.CancelDate IS NULL THEN CONCAT(DATEDIFF(day, t.ArrivalDate, t.ReturnDate), ' days')
        ELSE 'Canceled'
    END AS 'Duration'
FROM AccountsTrips AS at
JOIN Accounts AS a
on at.AccountId = a.Id
JOIN Trips AS t
ON at.TripId = t.Id
JOIN Rooms AS r
ON t.RoomId = r.Id
JOIN Hotels AS h
ON r.HotelId = h.Id
JOIN Cities AS c
ON h.CityId = c.Id
JOIN Cities AS ci
ON a.CityId = ci.Id
ORDER BY 'Full Name', 'Id'
