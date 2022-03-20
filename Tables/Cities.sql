-- auto-generated definition
create table Cities
(
    cityID    int identity
        constraint PK_Cities
            primary key,
    cityName  nchar(50) not null,
    countryID int
        constraint FK_Cities_Countries1
            references Countries
)
go

create unique index Cities_cityName_uindex
    on Cities (cityName)
go

