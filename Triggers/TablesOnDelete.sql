CREATE TRIGGER [dbo].[TablesOnDelete] ON [dbo].[ReservedTables]
AFTER DELETE, UPDATE AS
BEGIN
    SET NOCOUNT ON;
	IF (SELECT COUNT(*) 
		FROM deleted D
		INNER JOIN Reservation R ON D.resID = R.resID
		WHERE R.resDate >= CONVERT(DATE, GETDATE())) > 0
	BEGIN
		ROLLBACK;
        RAISERROR ('The table cannot be removed as it is reserved', 17, -1);
	END
END;
go

