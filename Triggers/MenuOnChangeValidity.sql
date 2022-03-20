
CREATE TRIGGER [dbo].[MenuOnChangeValidity] ON [dbo].[Menu]
   AFTER UPDATE
AS 
BEGIN
	SET NOCOUNT ON;

	IF (SELECT TOP 1 I.posID
		FROM inserted I
		INNER JOIN OrderDetails OD ON OD.posID = I.posID
		INNER JOIN NonCompletedOrders NCO ON OD.orderID = NCO.orderID
		) IS NOT NULL
	BEGIN
		ROLLBACK;
		RAISERROR ('The dish is included in an unfinished order.', 17, -1);
	END

END
go

