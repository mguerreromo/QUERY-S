USE Northwind
GO

CREATE TRIGGER DIS_OrderDetails_Insert
ON [dbo].[Order Details]
FOR INSERT
AS
	DECLARE @stock INT
	SELECT @stock = [dbo].[Products].[UnitsInStock] FROM [dbo].[Products]
					JOIN inserted
					ON INSERTED.[ProductID] = [Products].[ProductID]
					WHERE [dbo].[Products].[ProductID] = INSERTED.[ProductID]

	IF(@stock >=(SELECT Quantity FROM inserted))
	UPDATE [dbo].[Products] SET [UnitsInStock] = [UnitsInStock] - inserted.[Quantity]
	FROM [dbo].[Products] 
	JOIN inserted
	ON inserted.ProductID = [Products].[ProductID]
	WHERE [Products].[ProductID] = inserted.[ProductID]
	ELSE
		BEGIN	
			RAISERROR('No se puede proceder porque la existencia es menor a la requeridad.', 16,1)
			ROLLBACK TRAN
		END