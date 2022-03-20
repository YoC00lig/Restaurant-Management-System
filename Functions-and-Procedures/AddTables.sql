Create PROCEDURE AddTables(
@tableID int,
@NumberOfChairs int,
)
as begin
    begin try
        insert into Tables(tableID, chairsNum)
        values (@tableID,@NumberOfChairs)
    end try
    begin catch
        select ErrorMessage = ERROR_MESSAGE();
    end catch
end
go

