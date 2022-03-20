create procedure GrantLimitedDiscount(
@customerID int,
@DAY DATE
)
as begin
    declare @minimumValue float = (SELECT value FROM ParametersDates WHERE startDate <= @Day
    AND endDate>= @day and [key] = 'K2')

    IF dbo.AllOrdersValue(@customerID) >= @minimumValue
    BEGIN
        DECLARE @CUSTOMERIDENDITY INT = (SELECT customerID FROM IndividualCustomer WHERE customerID = @customerID)
        IF @CUSTOMERIDENDITY IS NOT NULL
        BEGIN
           insert into Discounts(customerID, startDate, discountType) values (@customerID,@DAY,'limited')
        END
    end
end
go

