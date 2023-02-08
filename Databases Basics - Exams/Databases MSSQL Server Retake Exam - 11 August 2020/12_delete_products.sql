CREATE TRIGGER tr_DeleteProductRelations
ON Products
AFTER DELETE
AS
BEGIN
SET NOCOUNT ON;
DELETE FROM ProductsIngredients
WHERE ProductId IN (SELECT Id FROM deleted)
DELETE FROM Feedbacks
WHERE ProductId IN (SELECT Id FROM deleted)
END

