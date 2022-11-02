USE Northwind
GO

CREATE TRIGGER DIS_OrderDetail_Insert
ON [dbo].[Order Details]
FOR INSERT
AS
	DECLARE @stock INT
--Le damos los datos a la variable
	SELECT @stock = [UnitsInStock] FROM [dbo].[Products]
	JOIN [inserted]
	ON [inserted].ProductID = [Products].ProductID
	WHERE [Products].ProductID =  [inserted].ProductID
--Creamos una condicion que va a evaluar si la cantidad es menor para poder despachar
	IF(@stock >= (SELECT [inserted].[Quantity]FROM [inserted]))
	UPDATE [Products] SET [UnitsInStock] = [UnitsInStock] - [inserted].[Quantity]
	FROM [Products]
	JOIN [inserted]
	ON [inserted].ProductID = [Products].[ProductID]
	WHERE [Products].[ProductID] = [inserted].[ProductID]
	ELSE 
		BEGIN
			RAISERROR('En existencia hay menor cantidad que la requeridad para despachar.',16,1)
			ROLLBACK TRAN
		END

