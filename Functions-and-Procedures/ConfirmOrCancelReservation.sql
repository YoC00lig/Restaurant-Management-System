create PROCEDURE ConfirmOrCancelReservation(
@reservationNumber int,
@isConfirmed bit
)
as begin
    update Reservation set IsConfirmed = @isConfirmed where resID = @reservationNumber;
end
go

grant execute on ConfirmOrCancelReservation to RestaurantService
go

