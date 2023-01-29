USE Minions;

DECLARE @SQL NVARCHAR(MAX) = '';

SELECT @SQL = @SQL + 'DROP TABLE ' + QUOTENAME(s.name) + '.' + QUOTENAME(t.name) + ';'
FROM sys.tables t
JOIN sys.schemas s ON t.schema_id = s.schema_id
WHERE s.name = 'dbo';

EXEC (@SQL);
