
CREATE PROCEDURE [dbo].[AddIndividualReservation](
@OrderID INT,
@Date DATE, 
@NumOfPeople INT,
@StartTime TIME, 
@EndTime TIME = NULL 
) AS
BEGIN
	IF @EndTime IS NULL SET @EndTime = DATEADD(HOUR, 4, @StartTime); 
	DECLARE @Today DATE = CONVERT(DATE, GETDATE());
	DECLARE @CustomerID INT;
	SET @CustomerID =
		(SELECT IndividualCustomer.customerID
		FROM IndividualCustomer
		INNER JOIN Orders ON Orders.customerID = IndividualCustomer.customerID
		WHERE Orders.orderID = @OrderID);
	IF @CustomerID IS NOT NULL
	AND
		(SELECT TotalValue
		FROM OrderTotalValues
		WHERE orderID = @OrderID)
		>
		(SELECT [value]
		FROM ParametersDates
		WHERE [key] = 'WZ' AND startDate <= @Today AND endDate >= @Today)
	AND
		(SELECT NUMBER_OF_ORDERS
		FROM NumberOfOrders
		WHERE @CustomerID = customerID) 
		>= 
		(SELECT [value]
		FROM ParametersDates
		WHERE [key] = 'WK' AND startDate <= @Today AND endDate >= @Today)
	AND
		(SELECT COUNT(*)
		FROM FreeTableList(@StartTime, @EndTime, @Date) 
		WHERE chairsNum >= @NumOfPeople) > 0
	BEGIN
		DECLARE @TableID INT = 
			(SELECT tableID
			FROM FreeTableList(@StartTime, @EndTime, @Date) 
			WHERE chairsNum = 
				(SELECT MIN(chairsNum)
				FROM FreeTableList(@StartTime, @EndTime, @Date) 
				WHERE chairsNum >= @NumOfPeople))

		INSERT INTO Reservation(resDate, startTime, endTime, IsConfirmed)
		VALUES (@Date, @StartTime, @EndTime, 0)

		INSERT INTO IndividualReservation(indResID, clientID, orderID)
		VALUES(@@IDENTITY, @CustomerID, @OrderID)

		INSERT INTO ReservedTables(resID, tableID)
		VALUES(@@IDENTITY, @TableID)
	END
END
go

grant execute on AddIndividualReservation to IndividualCustomer
go

