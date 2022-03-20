-- auto-generated definition
create table Tables
(
    tableID   int not null
        constraint PK_Tables
            primary key,
    chairsNum int not null
        check ([chairsNum] > 0)
)
go

