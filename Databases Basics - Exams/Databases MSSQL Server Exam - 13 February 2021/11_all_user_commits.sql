CREATE FUNCTION udf_AllUserCommits (@username VARCHAR(50))
RETURNS INT
AS
BEGIN
    DECLARE @commits INT
    SELECT @commits = COUNT(*)
    FROM Commits AS c
    JOIN Users AS u
    ON c.ContributorId = u.Id
    WHERE u.Username = @username
    RETURN @commits
END
