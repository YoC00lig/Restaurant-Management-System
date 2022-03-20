

CREATE PROCEDURE AddCompany(
	@Phone nvarchar(12),
	@Name nvarchar(50),
	@NIP int, 
	@Email nvarchar(50),
	@City nvarchar(50),
	@Country nvarchar(50),
	@Street nvarchar(50),
	@LocalNr nchar(10),
	@ZipCode nchar(10)
)
AS BEGIN
	INSERT INTO Customers(Phone)
	VALUES (@Phone)
	
	DECLARE @CustomerId INT = SCOPE_IDENTITY()

	DECLARE @CityID INT;

	EXEC GetCityId @CityName=@City, @CountryName=@Country, @CityID=@CityID


	INSERT INTO Address(cityID, street, localNr, zipCode)
	VALUES(@CityID, @Street, @LocalNr, @ZipCode);
	
	DECLARE @AddressId INT = SCOPE_IDENTITY()

	INSERT INTO Company(customerID, companyName, NIP, email, addressID)
	VALUES(@CustomerId, @Name, @NIP, @Email, @AddressId);
END
go

