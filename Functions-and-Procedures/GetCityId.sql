CREATE PROCEDURE GetCityId(
	@CityName nvarchar(50),
	@CountryName nvarchar(50),
	@CityID INT OUTPUT
) AS
BEGIN
	DECLARE @CountryID INT = 
		(SELECT countryID
		FROM Countries
		WHERE countryName = @CountryName);

	IF @@ROWCOUNT = 0 

	BEGIN
		INSERT INTO Countries(countryName)
		VALUES (@CountryName)
		SET @CountryID = SCOPE_IDENTITY()
	END


	SELECT @CityID = 
		(SELECT cityId 
		FROM Cities
		WHERE cityName = @CityName AND countryID = @CountryID)

	IF @@ROWCOUNT = 0
	BEGIN
		INSERT INTO Cities(cityName, countryID)
		VALUES (@CityName, @CountryID)
		SET @CityID = SCOPE_IDENTITY()
	END
END
go

