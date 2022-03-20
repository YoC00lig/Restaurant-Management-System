-- auto-generated definition
create table ReservedTables
(
    tableID int not null
        constraint FK_ReservedTables_Reservation
            references Reservation
        constraint FK_ReservedTables_Tables
            references Tables
            on delete cascade,
    resID   int not null,
    constraint PK_ReservedTables
        primary key (tableID, resID)
)
go

