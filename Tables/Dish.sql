-- auto-generated definition
create table Dish
(
    dishID   int identity
        constraint PK_Dish
            primary key,
    dishName nvarchar(50) not null,
    catID    int          not null
        constraint FK_Dish_Category
            references Category
)
go

create unique index Dish_dishName_uindex
    on Dish (dishName)
go

