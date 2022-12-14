USE [AdventureWorks2019]
GO
/****** Object:  StoredProcedure [Sales].[upsGetCreditCaredExpiredApril]    Script Date: 10/11/2022 12:38:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Marlyn Guerrero>
-- Create date: <11/OCT/2022>
-- Description:	<Run Data from [Sales].[CreditCard] when the month is 4 and actual year.>
-- =============================================
ALTER PROCEDURE [Sales].[upsGetCreditCaredExpiredApril] 
AS
BEGIN
	DELETE [DBPractica].[dbo].[CreditCardNotification] 
	WHERE [CardNumber] = [CardNumber]
	INSERT INTO [DBPractica].[dbo].[CreditCardNotification] 
	SELECT 
		[CardNumber]
		,1
	FROM 
		[AdventureWorks2019].[Sales].[CreditCardCopy] AS [cc]
	WHERE 
		[CC].[ExpYear] = YEAR(GETDATE())
		AND [ExpMonth] = 4
		AND [CardType] = 'SuperiorCard'
END
