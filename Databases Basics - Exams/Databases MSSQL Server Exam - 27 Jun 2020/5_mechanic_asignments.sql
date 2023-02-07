SELECT m.FirstName + ' ' + m.LastName AS 'Mechanic', Status, 'I''ssueDate'
FROM Mechanics AS m
JOIN Jobs AS j ON m.MechanicId = j.MechanicId
ORDER BY m.MechanicId, j.IssueDate, j.JobId
