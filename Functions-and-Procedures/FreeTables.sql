
CREATE FUNCTION [dbo].[FreeTables](
@Day date,
@startTime time,
@endTime time
)
returns int
as begin
    return (SELECT COUNT(tableID) FROM TABLES WHERE tableID NOT IN
   (SELECT RT.tableID
   FROM ReservedTables RT
   INNER JOIN Reservation R on R.resID = RT.resID
   INNER JOIN Tables T ON RT.tableID = T.tableID
   WHERE resDate=@Day AND
   ((startTime <= @startTime AND endTime >= @endTime)
   OR (startTime >= @startTime AND endTime >= @endTime AND startTime < @endTime)
   OR (startTime <= @startTime AND endTime <= @endTime AND @startTime < endTime)
   OR (startTime > @startTime AND endTime < @endTime))));
end
go

