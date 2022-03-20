CREATE VIEW [dbo].[CustomersDiscountExtended] as
	SELECT C.customerID, D.discountID, D.discountType, D.startDate, DATEADD(day, PD2.value, D.startDate) AS endDate, PD.value
	FROM Customers C
	INNER JOIN Discounts D on C.customerID = D.customerID
	INNER JOIN ParametersDates PD on PD.[key] = 'R1'AND D.startDate BETWEEN PD.startDate AND PD.endDate
	INNER JOIN ParametersDates PD2 on PD2.[key] = 'D1' AND D.startDate BETWEEN PD2.startDate AND PD2.endDate
	WHERE D.discountType = 'limited'

	UNION

	SELECT C.customerID, D.discountID, D.discountType, D.startDate, NULL AS endDate, PD.value
	FROM Customers C
	INNER JOIN Discounts D on C.customerID = D.customerID
	INNER JOIN ParametersDates PD on PD.[key] = 'R2'AND D.startDate BETWEEN PD.startDate AND PD.endDate
	WHERE D.discountType = 'unlimited'
go

