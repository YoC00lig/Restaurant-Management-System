CREATE FUNCTION HowManyDishOrders(
@DishName nvarchar(50)
)
returns int
as begin
    declare @quantity int = (SELECT COUNT(O.OrderID) as OrdersQuantity
    FROM ORDERS O
    INNER JOIN OrderDetails OD on O.orderID = OD.orderID
    INNER JOIN Menu M on M.posID = OD.posID
    INNER JOIN Dish D on D.dishID = M.dishID
    WHERE DATEDIFF(DAY,GETDATE(),orderDate) <= 14 and dishName = @DishName
    GROUP BY M.dishID,dishName)
    return isnull(@quantity,0)
end
go

