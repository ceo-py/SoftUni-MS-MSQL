SELECT Count(*) AS Count
FROM Countries c
WHERE NOT EXISTS (
SELECT 1
FROM MountainsCountries mc
WHERE c.CountryCode = mc.CountryCode
);