SELECT
	[p].[ProductID]
	,[p].[Name]
	,[p].[Size]
	,[p].[SizeUnitMeasureCode]
	,[p].[WeightUnitMeasureCode]
	,[p].[Weight]
	,COALESCE(
			[p].[Size]
	,		[p].[SizeUnitMeasureCode]
	,		[p].[WeightUnitMeasureCode]
	,		CAST([p].[Weight] AS VARCHAR(10))
	,		'EMPTY'
			) AS [Size]
FROM
	[Production].[Product] AS [p]