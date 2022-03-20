CREATE function [dbo].[FreeTableList](
@startTime time,
@endTime time,
@Day date
)
returns table as return
SELECT tableID,chairsNum FROM TABLES WHERE tableID NOT IN
   (SELECT RT.tableID
   FROM ReservedTables RT
   INNER JOIN Reservation R on R.resID = RT.resID
   INNER JOIN Tables T ON RT.tableID = T.tableID
   WHERE resDate=@Day AND
   ((startTime <= @startTime AND endTime >= @endTime)
   OR (startTime >= @startTime AND endTime >= @endTime AND startTime < @endTime)
   OR (startTime <= @startTime AND endTime <= @endTime AND @startTime < endTime)
   OR (startTime > @startTime AND endTime < @endTime)))
go

grant select on FreeTableList to CompanyCustomer
go

grant select on FreeTableList to IndividualCustomer
go

