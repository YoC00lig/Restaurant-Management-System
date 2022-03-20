create PROCEDURE DeleteCountry(
@countryNumber int
)
as begin
    delete from Countries where countryID = @countryNumber
end
go

