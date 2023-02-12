CREATE PROCEDURE usp_ChangeJourneyPurpose (@JourneyId INT, @NewPurpose NVARCHAR(11))
AS
BEGIN
  DECLARE @CurrentPurpose NVARCHAR(11)

  SELECT @CurrentPurpose = Purpose
  FROM Journeys
  WHERE Id = @JourneyId

  IF (@CurrentPurpose IS NULL)
  BEGIN
    RAISERROR ('The journey does not exist!', 16, 1)
    RETURN
  END

  IF (@CurrentPurpose = @NewPurpose)
  BEGIN
    RAISERROR ('You cannot change the purpose!', 16, 1)
    RETURN
  END

  UPDATE Journeys
  SET Purpose = @NewPurpose
  WHERE Id = @JourneyId
END
