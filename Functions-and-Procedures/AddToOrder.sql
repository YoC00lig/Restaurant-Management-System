CREATE PROCEDURE AddToOrder (
	@OrderID INT, 
	@PosID INT,
	@Quantity INT = 1
) AS
BEGIN
	IF @OrderID IN (SELECT OrderId FROM Orders)  
	BEGIN
		DECLARE @PrevQuantity INT = 
			(SELECT OrderId 
			FROM OrderDetails 
			WHERE OrderId = @OrderID AND posID = @PosID);
		IF @PrevQuantity IS NOT NULL
		BEGIN
			UPDATE OrderDetails
			SET quantity = (@PrevQuantity + @Quantity)
			WHERE OrderId = @OrderID;
		END
		ELSE INSERT INTO OrderDetails(orderId, posId, quantity)
			  VALUES(@OrderID, @PosID, @Quantity)
	END
END
go

grant execute on AddToOrder to CompanyCustomer
go

grant execute on AddToOrder to IndividualCustomer
go

