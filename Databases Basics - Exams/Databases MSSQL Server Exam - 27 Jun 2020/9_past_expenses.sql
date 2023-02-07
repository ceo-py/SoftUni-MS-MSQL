SELECT j.JobId, ISNULL(SUM(p.Price * op.Quantity), 0) as 'Total'
FROM Jobs AS j
LEFT JOIN Orders AS o
on j.JobId = o.JobId
LEFT join OrderParts AS op
on o.OrderId = op.OrderId
LEFT join Parts AS p
on op.PartId = p.PartId
WHERE J.Status = 'Finished'
GROUP BY j.JobId
ORDER BY Total DESC, j.JobId
