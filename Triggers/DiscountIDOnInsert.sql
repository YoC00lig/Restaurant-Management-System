
CREATE TRIGGER [dbo].[DiscountIDOnInsert] ON [dbo].[Orders]
AFTER INSERT, UPDATE AS
BEGIN
	   SET NOCOUNT ON;
	IF (SELECT I.orderID
		FROM inserted I
		INNER JOIN Discounts D ON I.discountID = D.discountID
		WHERE I.customerID <> D.customerID) IS NOT NULL
	BEGIN
		ROLLBACK;
		RAISERROR ('Incorrect discount number', 17, -1);
	END
END
go

