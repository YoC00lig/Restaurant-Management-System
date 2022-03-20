create procedure AddCity(
@CityName nvarchar(50),
@COUNTRYNAME NVARCHAR(50)
)
as begin
    DECLARE @CountryID INT = (SELECT countryID FROM Countries WHERE countryName = @COUNTRYNAME);
    insert into Cities(cityName, countryID) VALUES (@CityName,@CountryID)
end
go

