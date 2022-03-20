create view UncomfirmedReservations AS
    SELECT resID, resDate FROM Reservation R
    WHERE IsConfirmed = 0
go

grant select on UncomfirmedReservations to RestaurantService
go

