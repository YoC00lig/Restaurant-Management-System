
CREATE PROCEDURE [dbo].[AddCompanyReservation](
@CompanyID INT,
@Date DATE, 
@NumOfPeople INT,
@StartTime TIME, 
@EndTime TIME = NULL 
) AS
BEGIN
	IF @EndTime IS NULL SET @EndTime = DATEADD(HOUR, 4, @StartTime); 
	DECLARE @Today DATE = CONVERT(DATE, GETDATE());

	IF @CompanyID IN 
		(SELECT customerID
		FROM Company)
	AND
		(SELECT SUM(chairsNum)
		FROM FreeTableList(@StartTime, @EndTime, @Date)) >= @NumOfPeople
	BEGIN

		INSERT INTO Reservation(resDate, startTime, endTime, IsConfirmed)
		VALUES (@Date, @StartTime, @EndTime, 0)

		DECLARE @ReservationID INT = @@IDENTITY;
		
		INSERT INTO CompanyReservation(cmpResID, companyID)
		VALUES (@ReservationID, @CompanyID);

		DECLARE @ToPlace INT = @NumOfPeople;
		DECLARE @TableID INT;
		DECLARE @NumOfChairs INT;

		WHILE @ToPlace > 0
		BEGIN 
			SET @NumOfChairs = (SELECT MAX(chairsNum)
				FROM FreeTableList(@StartTime, @EndTime, @Date));

			SET @TableID = (SELECT tableID
			FROM FreeTableList(@StartTime, @EndTime, @Date) 
			WHERE chairsNum = @NumOfChairs);
			
			INSERT INTO ReservedTables(resID, tableID)
			VALUES(@ReservationID, @TableID)

			SET @ToPlace = @ToPlace - @NumOfChairs;
		END
	END
END
go

grant execute on AddCompanyReservation to CompanyCustomer
go

