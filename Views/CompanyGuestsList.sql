create view CompanyGuestsList as
    SELECT R.resID, C.companyName, E.firstName + ' ' + E.lastName AS NAME, T.tableID
    FROM Employee E
    INNER JOIN CompanyReservation CR on CR.cmpResID = E.resID
    INNER JOIN Company C on C.customerID = CR.companyID
    INNER JOIN Reservation R on R.resID = CR.cmpResID
    INNER JOIN Tables T on R.resID = T.resID
go

