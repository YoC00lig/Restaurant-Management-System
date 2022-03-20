-- auto-generated definition
create table Countries
(
    countryID   int identity
        constraint PK_Countries
            primary key,
    countryName nvarchar(50) not null
)
go

create unique index Countries_countryName_uindex
    on Countries (countryName)
go

