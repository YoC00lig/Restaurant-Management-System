-- auto-generated definition
create table Address
(
    addressID int identity
        constraint PK_Adress
            primary key,
    cityID    int          not null
        constraint FK_Adress_Cities
            references Cities,
    street    nvarchar(50) not null,
    localNr   nchar(10)    not null
        constraint CK__Address__localNr__74444068
            check ([localNr] like '[0-9]%'),
    zipCode   nchar(10)    not null
        constraint CK__Adress__zipCode__68D28DBC
            check (isnumeric([zipCode]) = 1)
)
go

