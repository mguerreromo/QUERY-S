USE AdventureWorks2019
GO
;WITH CTEVaction
AS
(
SELECT 
	BusinessEntityID
	,LoginID
	,JobTitle
	,OrganizationLevel
	,VacationHours
	,ROW_NUMBER() OVER(ORDER BY OrganizationLevel) AS [RowNumber]
	,DENSE_RANK() OVER(ORDER BY OrganizationLevel ASC) AS [GROUP]
	,DENSE_RANK() OVER(PARTITION BY OrganizationLevel ORDER BY VacationHours DESC) AS [POSITION]
	,NTILE(5)	  OVER(ORDER BY VacationHours ASC) AS [NTILE]

FROM 
	HumanResources.Employee
WHERE
	Gender = 'M' AND VacationHours > 0

)

SELECT JobTitle, OrganizationLevel, VacationHours, [NTILE] FROM CTEVaction
WHERE POSITION = 3
ORDER BY VacationHours DESC
