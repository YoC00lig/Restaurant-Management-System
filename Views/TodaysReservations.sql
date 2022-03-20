CREATE VIEW TodaysReservations AS
   SELECT R.resID, R.startTime,
IIF(cmpResID IS NULL,'INDIVIDUAL','COMPANY') AS RESERVATIONTYPE
   FROM Reservation R
   LEFT JOIN CompanyReservation CR on R.resID = CR.cmpResID
   WHERE resDate = CONVERT(Date, GETDATE())
go

grant select on TodaysReservations to RestaurantService
go

