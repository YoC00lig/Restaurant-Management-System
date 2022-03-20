create function OrderContent(
@OrderNumber int
)
returns TABLE as
  return SELECT D1.dishName, OD.quantity, O.pickUpDate
  FROM Customers C
  INNER JOIN Orders O ON C.customerID = O.customerID
  INNER JOIN OrderDetails OD ON O.orderID = OD.orderID
  INNER JOIN Menu M ON OD.posID = M.posID
  INNER JOIN Dish D1 on D1.dishID = M.dishID
  LEFT JOIN Discounts D ON O.discountID = D.discountID
  WHERE O.orderID = @OrderNumber
  GROUP BY C.customerID, O.orderID, D.startDate, D.discountType,quantity,price,M.posID,dishName, O.pickUpDate
go

