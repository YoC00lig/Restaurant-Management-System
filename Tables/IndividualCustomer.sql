-- auto-generated definition
create table IndividualCustomer
(
    customerID int identity
        constraint PK_IndividualCustomer
            primary key
        constraint FK_IndividualCustomer_Clients
            references Customers,
    addressID  int          not null
        constraint FK_IndividualCustomer_Adress
            references Address,
    firstName  nvarchar(50) not null,
    lastName   nvarchar(50) not null
)
go

