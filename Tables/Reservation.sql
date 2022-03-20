-- auto-generated definition
create table Reservation
(
    resID       int  not null
        constraint PK_Reservation
            primary key,
    resDate     date not null,
    startTime   time not null,
    endTime     time not null,
    IsConfirmed bit,
    check ([startTime] < [endTime])
)
go

create index ix_reservation_dates
    on Reservation (resDate, startTime, endTime)
go

