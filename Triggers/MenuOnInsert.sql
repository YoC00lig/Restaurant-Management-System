CREATE TRIGGER [dbo].[MenuOnInsert] ON [dbo].[Menu]
AFTER INSERT, UPDATE AS
BEGIN
	SET NOCOUNT ON;
	IF (SELECT I.posID
		FROM inserted I
		INNER JOIN Menu M ON I.dishID = M.dishID AND I.posID <> M.posID
		WHERE ((M.validTo IS NULL AND I.validTo IS NULL)
			OR (M.validFrom < ISNULL(I.validTo, M.validTo) AND M.validTo >= I.validFrom)
			OR (I.validFrom < ISNULL(M.validTo, I.validTo) AND I.validTo >= M.validFrom))) IS NOT NULL
	BEGIN
		ROLLBACK;
		RAISERROR ('The dish cannot appear twice on the menu', 17, -1);
	END
END
go

