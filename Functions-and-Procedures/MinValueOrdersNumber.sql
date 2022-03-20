create function MinValueOrdersNumber(
@CustomerIdentityNumber int,
@MinValue float
)
returns int
as begin
    return (select count(*)
from OrderTotalValues
where customerID = @CustomerIdentityNumber and TotalValue >= @MinValue)
end
go

