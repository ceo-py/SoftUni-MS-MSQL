UPDATE Aircraft
SET Condition = 'A'
WHERE Condition IN ('C', 'B') AND (FlightHours is NULL OR FlightHours <= 100) AND Year >= 2013
SELECT Condition
FROM Aircraft;
