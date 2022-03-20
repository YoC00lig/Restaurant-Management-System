-- auto-generated definition
create table Employee
(
    employeeID int identity
        constraint PK_Employee
            primary key,
    tableID    int,
    firstName  nchar(10)    not null,
    lastName   nvarchar(50) not null,
    resID      int,
    constraint FK_Employee_ReservedTables
        foreign key (tableID, resID) references ReservedTables
)
go

