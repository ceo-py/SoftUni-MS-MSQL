SELECT Sites.Name as 'Site', Locations.Name as 'Location', Municipality, Province, Establishment
FROM Sites
JOIN Locations ON Sites.LocationId = Locations.Id
WHERE (Locations.Name NOT LIKE 'B%') AND (Locations.Name NOT LIKE 'M%') AND (Locations.Name NOT LIKE 'D%')
AND (Establishment LIKE '%BC')
ORDER BY 'Site' ASC