CREATE FUNCTION udf_GetAvailableRoom (@HotelId INT, @Date DATE, @People INT)
RETURNS NVARCHAR(100)
AS
BEGIN
DECLARE @Result NVARCHAR(100) = NULL;

WITH Room AS (
SELECT r.Id, r.Price, r.Type, r.Beds, (h.BaseRate + r.Price) * @People AS TotalPrice
FROM Rooms AS r
JOIN Hotels AS h
ON r.HotelId = h.Id
WHERE r.HotelId = @HotelId AND r.Beds >= @People
AND NOT EXISTS (
SELECT 1
FROM Trips t
WHERE t.RoomId = r.Id
AND @Date BETWEEN t.ArrivalDate AND t.ReturnDate
AND t.CancelDate IS NULL
)
),
ResultRoom AS (
SELECT TOP 1 Id, Type, Beds, TotalPrice
FROM Room
ORDER BY TotalPrice DESC
)
SELECT @Result = 'Room ' + CAST(Id AS NVARCHAR(10)) + ': ' + Type + ' (' + CAST(Beds AS NVARCHAR(10)) + ' beds) - $' + CAST(TotalPrice AS NVARCHAR(10))
FROM ResultRoom;
RETURN ISNULL(@Result, 'No rooms available');
END;
