CREATE FUNCTION udf_HoursToComplete (@StartDate DATETIME, @EndDate DATETIME)
RETURNS FLOAT
BEGIN
  DECLARE @Result FLOAT
  IF @StartDate IS NULL OR @EndDate IS NULL
  SET @Result = 0
  ELSE
  SET @Result = DATEDIFF(HOUR, @StartDate, @EndDate)
  RETURN @Result
END
