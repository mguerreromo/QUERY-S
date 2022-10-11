-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Marlyn Guerrero>
-- Create date: <11/OCT/2022>
-- Description:	<Run Data from [Sales].[CreditCard] when the month is 4 and actual year.>
-- =============================================
CREATE PROCEDURE [Sales].[upsGetCreditCaredExpiredApril] 
AS
BEGIN
	SELECT 
		[CardType]
		,[CardNumber]
		,[ExpMonth]
		,[ExpYear]
	FROM 
		[AdventureWorks2019].[Sales].[CreditCardCopy] AS [cc]
	WHERE 
		[CC].[ExpYear] = YEAR(GETDATE())
		AND [ExpMonth] = 4
		AND [CardType] = 'SuperiorCard'
END
GO
