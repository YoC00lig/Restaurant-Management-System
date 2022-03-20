create procedure UpdateAvailability(
@posID int,
@Availability date = Null
)
as begin
    update Menu set validTo = @Availability where posID = @posID
end
go

