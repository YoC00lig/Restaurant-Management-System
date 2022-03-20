-- auto-generated definition
create table OrderDetails
(
    orderID  int not null
        constraint FK_OrderDetails_Orders
            references Orders,
    posID    int not null
        constraint FK_OrderDetails_Menu1
            references Menu,
    quantity int not null
        check ([quantity] > 0),
    constraint PK_OrderDetails
        primary key (orderID, posID)
)
go

create index ix_orderDetails_orders
    on OrderDetails (orderID)
go

