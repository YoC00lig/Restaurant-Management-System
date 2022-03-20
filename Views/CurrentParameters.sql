CREATE VIEW CurrentParameters AS
SELECT P.[key], P.value
FROM Parameters P
INNER JOIN Parameters P2 ON P.[key] = P2.[key] 
GROUP BY P.[key], P.startDate, P.value
HAVING P.startDate = MAX(P2.startDate)
go

