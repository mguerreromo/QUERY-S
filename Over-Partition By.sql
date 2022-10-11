--SELECT 
--		[POH].ShipMethodID	
--	,	MIN(POH.TotalDue)		AS MinTotal
--	,	MAX(POH.TotalDue)		AS MaxTotal
--	,	COUNT(poh. TotalDue)	AS CountTotal
--	,	AVG(poh.TotalDue)		AS AVGTotal
--FROM 
--	[Purchasing].[PurchaseOrderHeader] AS [poh]
--INNER JOIN [Purchasing].[Vendor] AS [V]
-- ON [V].BusinessEntityID = poh.VendorID
--GROUP BY 
--	poh.ShipMethodID

SELECT 
		[POH].ShipMethodID	
	,	MIN(POH.TotalDue) OVER(PARTITION BY [POH].ShipMethodID)		AS MinTotal
	,	MAX(POH.TotalDue) OVER(PARTITION BY [POH].ShipMethodID)		AS MaxTotal
	,	COUNT(poh. TotalDue) OVER(PARTITION BY [POH].ShipMethodID)	AS CountTotal
	,	AVG(poh.TotalDue) OVER(PARTITION BY [POH].ShipMethodID)		AS AVGTotal
FROM 
	[Purchasing].[PurchaseOrderHeader] AS [poh]
INNER JOIN [Purchasing].[Vendor] AS [V]
 ON [V].BusinessEntityID = poh.VendorID