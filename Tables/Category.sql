-- auto-generated definition
create table Category
(
    catID   int identity
        constraint PK_Category
            primary key,
    catName nvarchar(50) not null
)
go

create unique index Category_catName_uindex
    on Category (catName)
go

