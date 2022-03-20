-- auto-generated definition
create table IndividualReservation
(
    indResID int not null
        constraint PK_IndividualReservation
            primary key
        constraint FK_IndividualReservation_Reservation
            references Reservation,
    clientID int not null
        constraint FK_IndividualReservation_IndividualCustomer
            references IndividualCustomer,
    orderID  int not null
        constraint FK_IndividualReservation_Orders
            references Orders
)
go

