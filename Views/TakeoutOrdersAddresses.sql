CREATE VIEW [dbo].[TakeoutOrdersAddresses] AS
    SELECT orderID, countryName, cityName + ' ' + street + ' ' + localNr AS ADDRESS,pickUpDate
    FROM ORDERS O
    INNER JOIN Customers C on C.customerID = O.customerID
    INNER JOIN IndividualCustomer IC on C.customerID = IC.customerID
    INNER JOIN Address A on A.addressID = IC.addressID
    INNER JOIN Cities C2 on C2.cityID = A.cityID
    INNER JOIN Countries C3 on C2.countryID = C3.countryID
    WHERE O.isToGo = 1
    UNION
    SELECT orderID, countryName, cityName + ' ' + street + ' ' + localNr AS ADDRESS, pickUpDate
    FROM ORDERS O1
    INNER JOIN Customers C4 on C4.customerID = O1.customerID
    INNER JOIN Company C5 on C4.customerID = C5.customerID
    INNER JOIN Address A2 on C5.addressID = A2.addressID
    INNER JOIN Cities C6 on C6.cityID = A2.cityID
    INNER JOIN Countries C7 on C6.countryID = C7.countryID
    WHERE O1.isToGo = 1
go

grant select on TakeoutOrdersAddresses to Supplier
go

