SELECT i.Id AS 'Id', CONCAT(u.Username, ' : ', i.Title) AS 'IssueAssignee'
FROM Issues AS i
LEFT JOIN Users AS u
on i.AssigneeId = u.Id
ORDER BY i.Id DESC, u.Username

