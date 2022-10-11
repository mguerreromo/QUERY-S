WITH CTEVaction
AS
(
SELECT 
	BusinessEntityID
	,LoginID
	,JobTitle
	,OrganizationLevel
	,VacationHours
	,DENSE_RANK() OVER(ORDER BY OrganizationLevel ASC) AS [GROUP]
	,DENSE_RANK() OVER(PARTITION BY OrganizationLevel ORDER BY VacationHours DESC) AS [POSITION]

FROM 
	HumanResources.Employee
WHERE
	Gender = 'M' AND VacationHours > 0

)

SELECT * FROM CTEVaction
--WHERE POSITION = 3