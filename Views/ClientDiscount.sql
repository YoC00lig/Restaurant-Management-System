
CREATE VIEW [dbo].[ClientDiscount] as
    SELECT C.customerID, (CASE WHEN D.discountType = 'limited' THEN 'R1'ELSE 'R2' END) AS TYPE
    FROM Customers C
    INNER JOIN Orders O on C.customerID = O.customerID
    INNER JOIN OrderDetails OD on O.orderID = OD.orderID
    INNER JOIN Discounts D on D.discountID = O.discountID
go

