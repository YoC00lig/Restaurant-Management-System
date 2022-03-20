create procedure AddCountry(
@CountryName nvarchar(50)
)
as begin
    insert into Countries(countryName) values (@CountryName);
end
go

