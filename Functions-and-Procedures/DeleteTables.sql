CREATE PROCEDURE DeleteTables(
@tableID int
)
AS BEGIN
    DELETE FROM Tables WHERE tableID = @tableID
end
go

