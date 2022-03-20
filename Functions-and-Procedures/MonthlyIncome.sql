create function MonthlyIncome(
@Year int,
@month int
)
returns float
as begin
    return (select sum(TotalValue)
from OrderTotalValues
inner join Orders O on OrderTotalValues.customerID = O.customerID
where month(orderDate)= @month and year(orderDate)= @Year)
end
go

