
CREATE VIEW [dbo].[ParametersDates] AS
	SELECT P.[key], P.value, P.startDate, ISNULL(MIN(P2.startDate), CONVERT(DATE, GETDATE())) AS 'endDate'
	FROM Parameters P
	LEFT JOIN Parameters P2 ON P.[key] = P2.[key] AND P2.startDate > P.startDate
	GROUP BY P.[key], P.startDate, P.value
go

grant select on ParametersDates to CompanyCustomer
go

grant select on ParametersDates to IndividualCustomer
go

