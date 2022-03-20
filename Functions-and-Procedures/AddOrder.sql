CREATE PROCEDURE AddOrder(
	@CustomerID INT = 0,
	@IsToGo BIT = 0,
	@PickUpDate DATE = NULL
) AS 
BEGIN
	DECLARE @DiscountID INT;
	DECLARE @Today DATE = CONVERT(DATE, GETDATE()); 

	SET @DiscountID = (
		SELECT discountID
		FROM CustomersDiscountExtended
		WHERE customerID = @CustomerID AND startDate <= @Today AND 
				@Today <= ISNULL(endDate, @Today)
				AND value = 
					(SELECT MAX(CD.value)
					FROM CustomersDiscountExtended CD
					WHERE CD.customerID = @CustomerID AND CD.startDate <= @Today AND 
						@Today <= ISNULL(CD.endDate, @Today)
					GROUP BY CD.customerID)
	);

	INSERT INTO Orders(customerID, discountID, isToGo, orderDate, pickUpDate)
	VALUES (
		@CustomerID, @DiscountID, @IsToGo, @Today, @PickUpDate
	)
	
END
go

grant execute on AddOrder to CompanyCustomer
go

grant execute on AddOrder to IndividualCustomer
go

