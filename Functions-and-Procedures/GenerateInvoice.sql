create function GenerateInvoice(
@OrderNumber int
)
returns TABLE as
    return SELECT D1.dishName, OD.quantity, M.price AS PriceForOne, (OD.quantity * M.price) AS ValueWithoutDiscount,ISNULL(
     (SELECT TOP 1 CAST(P.value AS FLOAT)/100
     FROM Parameters P
     WHERE p.[key] =
        (CASE
           WHEN D.discountType = 'limited' THEN 'R1'
           ELSE 'R2'
        END)
     AND P.startDate <= D.startDate
     ORDER BY P.startDate DESC),0) AS DISCOUNT,(OD.quantity * M.price) * (1-ISNULL(
     (SELECT TOP 1 CAST(P.value AS FLOAT)/100
     FROM Parameters P
     WHERE p.[key] =
        (CASE
           WHEN D.discountType = 'limited' THEN 'R1'
           ELSE 'R2'
        END)
     AND P.startDate <= D.startDate
     ORDER BY P.startDate DESC),0)) AS ValueWithDiscount
  FROM Customers C
  INNER JOIN Orders O ON C.customerID = O.customerID
  INNER JOIN OrderDetails OD ON O.orderID = OD.orderID
  INNER JOIN Menu M ON OD.posID = M.posID
  INNER JOIN Dish D1 on D1.dishID = M.dishID
  LEFT JOIN Discounts D ON O.discountID = D.discountID
  WHERE O.orderID = @OrderNumber
  GROUP BY C.customerID, O.orderID, D.startDate, D.discountType,quantity,price,M.posID,dishName
go

grant select on GenerateInvoice to RestaurantService
go

