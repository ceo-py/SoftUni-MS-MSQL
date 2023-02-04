CREATE PROC usp_TransferMoney (@senderId INT, @receiverId INT, @amount DECIMAL(18, 4))
AS
BEGIN TRY
BEGIN TRANSACTION
EXEC usp_DepositMoney @receiverId, @amount
EXEC usp_WithdrawMoney @senderId, @amount
COMMIT TRANSACTION
END TRY
BEGIN CATCH
ROLLBACK TRANSACTION
END CATCH
