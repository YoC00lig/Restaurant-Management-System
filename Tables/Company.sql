-- auto-generated definition
create table Company
(
    customerID  int          not null
        constraint PK_Company
            primary key
        constraint FK_Company_Clients
            references Customers,
    companyName nvarchar(50) not null,
    NIP         int          not null,
    email       nvarchar(50)
        constraint CK__Company__email__10216507
            check ([email] like '%@%'),
    addressID   int          not null
        constraint FK_Company_Adress
            references Address
)
go

create unique index Company_companyName_uindex
    on Company (companyName)
go

create unique index Company_NIP_uindex
    on Company (NIP)
go

create unique index Company_email_uindex
    on Company (email)
go

