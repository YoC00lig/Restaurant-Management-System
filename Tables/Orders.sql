-- auto-generated definition
create table Orders
(
    orderID    int identity
        constraint PK_Orders
            primary key,
    customerID int not null
        constraint FK_Orders_Clients1
            references Customers,
    discountID int
        constraint FK_Orders_Discounts
            references Discounts,
    isToGo     bit not null,
    orderDate  datetime
        constraint DF__Orders__orderDat__0D0FEE32 default getdate(),
    pickUpDate datetime,
    constraint CK__Orders__19AACF41
        check ([orderDate] < [pickUpDate])
)
go

create index ix_orders_dates
    on Orders (orderDate, pickUpDate)
go

