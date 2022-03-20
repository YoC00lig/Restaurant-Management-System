-- auto-generated definition
create table CompanyReservation
(
    cmpResID  int identity
        constraint PK_CompanyReservation
            primary key
        constraint FK_CompanyReservation_Reservation
            references Reservation,
    companyID int not null
        constraint FK_CompanyReservation_Company
            references Company
)
go

