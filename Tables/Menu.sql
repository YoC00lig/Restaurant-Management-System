-- auto-generated definition
create table Menu
(
    posID     int identity
        constraint PK_Menu
            primary key,
    dishID    int   not null
        constraint FK_Menu_Dish1
            references Dish,
    price     money not null
        constraint CK__Menu__price__16CE6296
            check ([PRICE] > 0),
    validFrom date  not null,
    validTo   date,
    constraint CK__Menu__29AC2CE0
        check ([validfrom] < [validTO] OR [validTo] IS NULL)
)
go

create unique index Menu_dishName_uindex
    on Menu (dishID)
go

create index ix_menu_dates
    on Menu (validFrom, validTo)
go

create index ix_menu_prices
    on Menu (price)
go

grant delete on Menu to Manager
go

