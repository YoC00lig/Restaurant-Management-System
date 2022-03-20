  CREATE VIEW DishesRank as
SELECT dishName, COUNT(O.OrderID) as OrdersQuantity
FROM ORDERS O
INNER JOIN OrderDetails OD on O.orderID = OD.orderID
INNER JOIN Menu M on M.posID = OD.posID
INNER JOIN Dish D on D.dishID = M.dishID
WHERE DATEDIFF(DAY,GETDATE(),orderDate) <= 14
GROUP BY M.dishID,dishName
  go

