CREATE FUNCTION OrderValue(
@OrderIdentityNumber int
)
returns float
as begin
    return (SELECT SUM(OD.quantity * M.price) * (1-ISNULL(
     (SELECT TOP 1 CAST(P.value AS FLOAT)/100
     FROM Parameters P
     WHERE p.[key] =
        (CASE
           WHEN D.discountType = 'limited' THEN 'R1'
           ELSE 'R2'
        END)
     AND P.startDate <= D.startDate
     ORDER BY P.startDate DESC),0)) AS TotalValue
  FROM Customers C
  INNER JOIN Orders O ON C.customerID = O.customerID
  INNER JOIN OrderDetails OD ON O.orderID = OD.orderID
  INNER JOIN Menu M ON OD.posID = M.posID
  LEFT JOIN Discounts D ON O.discountID = D.discountID
  where O.orderID = @OrderIdentityNumber
  GROUP BY C.customerID, O.orderID, D.startDate, D.discountType)
end
go
