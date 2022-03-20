-- auto-generated definition
create table Discounts
(
    discountID   int identity
        constraint Discounts_pk
            primary key nonclustered
        constraint PK_ActiveDiscount
            unique,
    customerID   int          not null
        constraint FK_Discounts_IndividualCustomer
            references IndividualCustomer,
    startDate    date         not null,
    discountType nvarchar(50) not null
        constraint CK__ActiveDiscount__11158940
            check ([discountType] = 'limited' OR [discountType] = 'unlimited')
)
go

create index ix_discounts_dates
    on Discounts (startDate)
go

