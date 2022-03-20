
CREATE TRIGGER [dbo].[EmployeeOnInsert] ON [dbo].[Employee]
AFTER INSERT, UPDATE AS
BEGIN
    SET NOCOUNT ON;
	IF (SELECT I.resID
		FROM inserted I
		INNER JOIN Employee E ON I.resID = E.resID AND I.tableID = E.tableID
		INNER JOIN Tables T ON I.tableID = T.tableID
		GROUP BY I.resID, I.tableID, T.chairsNum
		HAVING COUNT(E.employeeID) > T.chairsNum) IS NOT NULL
	BEGIN
		ROLLBACK;
		RAISERROR ('More people at the table than there are seats', 17, -1);
	END
END;
go

