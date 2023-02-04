CREATE TRIGGER tr_CreateNewEmailOnNewLogEntry
ON Logs
FOR INSERT
AS
INSERT INTO NotificationEmails (Recipient, Subject, Body)
SELECT AccountId,
'Balance change for account: ' + CAST(AccountId AS VARCHAR(255)),
'On ' + FORMAT(GETDATE(), 'MMM dd yyyy h:mmtt') +
' your balance was changed from ' + CAST(OldSum AS VARCHAR(255)) +
' to ' + CAST(NewSum AS VARCHAR(255)) + '.'
FROM inserted