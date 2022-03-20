create procedure GrantUnlimitedDiscount(
@customerID int,
@DAY DATE
)
as begin
    declare @minimumValue float = (SELECT value FROM ParametersDates WHERE startDate <= @DAY AND endDate>= @DAY
                                                                       and [key] = 'K1')
    DECLARE @ORDNUMBER INT =(SELECT value FROM ParametersDates WHERE startDate <= @DAY AND endDate>= @DAY AND [key]='Z1')
    IF dbo.MinValueOrdersNumber(@customerID,@minimumValue) >= @ORDNUMBER
    BEGIN
        DECLARE @CUSTOMERIDENDITY INT = (SELECT customerID FROM IndividualCustomer WHERE customerID = @customerID)
        IF @CUSTOMERIDENDITY IS NOT NULL
        BEGIN
           insert into Discounts(customerID, startDate, discountType) values (@customerID,@DAY,'unlimited')
        END
    end
end
go

