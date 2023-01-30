SELECT TOP(10) * FROM [Projects]
ORDER BY
	[StartDate] ASC,
	[Name] ASC



-- SELECT *
-- FROM (
--     SELECT *,
--     ROW_NUMBER() OVER (ORDER BY StartDate, Name) AS RowNum
--     FROM Projects
--     )
-- AS Emp
-- WHERE RowNum <= 10;