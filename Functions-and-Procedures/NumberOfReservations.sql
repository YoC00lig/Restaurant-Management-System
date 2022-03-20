CREATE FUNCTION NumberOfReservations(
@Year int
)
returns table as return (
    SELECT MONTH(resDate) as Month, COUNT(*) AS NumberOfReservations
from Reservation
where year(resDate) = @Year
group by MONTH(resDate)
    )
go

