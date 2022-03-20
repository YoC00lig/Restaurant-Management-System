CREATE TRIGGER [dbo].[ReservedTablesOnInsert] ON [dbo].[ReservedTables]
AFTER INSERT, UPDATE AS
BEGIN
    SET NOCOUNT ON;
	IF (SELECT RT.resID
		FROM ReservedTables RT
		WHERE RT.resID IN 
			(SELECT resID 
			FROM inserted I
			INNER JOIN IndividualReservation IR ON I.resID = IR.indResID)
		GROUP BY RT.resID
		HAVING COUNT(*) > 1) IS NOT NULL 
	BEGIN
		ROLLBACK;
        RAISERROR ('The individual reservation already has an assigned table', 17, -1);
	END
END;
go

