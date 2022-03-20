CREATE VIEW [dbo].[NumberOfOrders] AS
    SELECT C.customerID, COUNT(orderID) AS NUMBER_OF_ORDERS
    FROM Customers C
    INNER JOIN Orders O on C.customerID = O.customerID
    GROUP BY C.customerID
go

