create procedure AddMenu(
@CategoryName nvarchar(50),
@Dishname nvarchar(50),
@Price money,
@Validfrom date,
@ValidTo date = NULL
)
as begin
    DECLARE @CategoryID INT  = (SELECT catID FROM Category WHERE catName = @CategoryName)
    IF @CategoryID IS NULL
    BEGIN
        INSERT INTO Category(catName) VALUES (@CategoryName)
        set @CategoryID = SCOPE_IDENTITY()
    end
    DECLARE @DISHid INT  = (SELECT dishID FROM dish WHERE dishName= @Dishname)
    IF @DISHid IS NULL
    BEGIN
        INSERT INTO Dish(dishName, catID) VALUES (@Dishname,@CategoryID)
        SET @DISHid = SCOPE_IDENTITY()
    end

    DECLARE @posID INT  = (SELECT posID from Menu where dishID = @DISHid)
    IF @posID IS NULL
    BEGIN
        INSERT INTO Menu(dishID, price, validFrom, validTo) values (@DISHid,@Price,@Validfrom,@ValidTo)
        SET @posID = SCOPE_IDENTITY()
    end
end
go

