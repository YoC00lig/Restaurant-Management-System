CREATE VIEW TODAYSORDERS AS
    SELECT orderID FROM Orders WHERE pickUpDate = GETDATE()
go
