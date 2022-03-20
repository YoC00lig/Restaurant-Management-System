create view CurrentMenu as
    SELECT dishName, price
    FROM MENU M
    INNER JOIN Dish D on D.dishID = M.dishID
    WHERE  validFrom <= GETDATE() AND validTo>=GETDATE()
go

