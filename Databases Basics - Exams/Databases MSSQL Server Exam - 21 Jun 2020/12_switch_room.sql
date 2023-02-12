CREATE PROCEDURE usp_SwitchRoom (@TripId INT, @TargetRoomId INT)
AS
BEGIN
  SET NOCOUNT ON;

  DECLARE @CurrentRoomId INT, @TargetHotelId INT, @CurrentHotelId INT, @Beds INT;

  SELECT @CurrentRoomId = RoomId
  FROM Trips
  WHERE Id = @TripId;

  SELECT @TargetHotelId = HotelId
  FROM Rooms
  WHERE Id = @TargetRoomId;

  SELECT @CurrentHotelId = HotelId
  FROM Rooms
  WHERE Id = @CurrentRoomId;

  SELECT @Beds = Beds
  FROM Rooms
  WHERE Id = @TargetRoomId;

  IF (@TargetHotelId != @CurrentHotelId)
  BEGIN
    RAISERROR('Target room is in another hotel!', 16, 1);
    RETURN;
  END;

  DECLARE @People INT = (SELECT COUNT(*)
                        FROM AccountsTrips
                        WHERE TripId = @TripId);
  IF (@Beds < @People)
  BEGIN
    RAISERROR('Not enough beds in target room!', 16, 1);
    RETURN;
  END;

  UPDATE Trips
  SET RoomId = @TargetRoomId
  WHERE Id = @TripId;
END;
