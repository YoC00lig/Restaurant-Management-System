
CREATE VIEW NonCompletedOrders AS
   SELECT orderID
   FROM Orders
   WHERE pickUpDate > GETDATE() OR  pickUpDate IS NULL
go

