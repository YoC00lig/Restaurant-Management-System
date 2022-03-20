create procedure DeleteCity(
@CityID int
)
as begin
    delete from Cities where cityID = @CityID
end
go

