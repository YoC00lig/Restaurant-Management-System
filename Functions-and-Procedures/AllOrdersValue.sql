create function AllOrdersValue(
@CustomerIdentityNumber int
)
returns float
as begin
    return (select sum(dbo.OrderValue(orderID))
from Customers C
inner join Orders O on C.customerID = O.customerID
where C.customerID=@CustomerIdentityNumber)
end
go

