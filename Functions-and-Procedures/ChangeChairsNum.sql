CREATE PROCEDURE ChangeChairsNum(
@NewChairsNum int,
@TableNumber int
)
AS BEGIN
    UPDATE Tables SET chairsNum = @NewChairsNum WHERE tableID = @TableNumber
END
go

