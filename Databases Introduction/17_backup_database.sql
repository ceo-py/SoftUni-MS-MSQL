BACKUP DATABASE SoftUni TO DISK = 'C:\softuni-backup.bak'

DROP DATABASE SoftUni

RESTORE DATABASE SoftUni FROM DISK = 'C:\softuni-backup.bak'



--
-- USE [master]
--
-- BACKUP DATABASE [SoftUni]
-- 	TO DISK = N'YOURURL'
--
-- GO
--
-- DROP DATABASE [SoftUni]
--
-- GO
--
-- RESTORE DATABASE [SoftUni]
-- 	FROM DISK = N'YOUR URL'