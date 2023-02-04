SELECT MountainRange, PeakName, Elevation
FROM Peaks
AS p
LEFT JOIN Mountains
AS m
ON MountainId = m.Id
WHERE MountainRange = 'Rila'
ORDER BY Elevation DESC;