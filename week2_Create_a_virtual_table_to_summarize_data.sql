USE LittleLemonDM;
####################### Task 1#########################
CREATE OR REPLACE VIEW OrdersView AS
    SELECT orderID, quantity, cost
    FROM Orders
    WHERE quantity > 2;

SELECT * FROM OrdersView;

####################### Task 2#########################
SELECT C.customerID, C.name, O.orderID, O.cost,M.menu_name,M.cuisine
FROM Customer C
LEFT JOIN Orders O
    LEFT JOIN Menu M
    ON O.menuID = M.menuID
ON C.customerID = O.customerID;

####################### Task 3#########################
SELECT menu_name
FROM(
    SELECT M.menu_name, COUNT(O.menuID) AS count
    FROM Orders O LEFT JOIN Menu M on M.menuID = O.menuID
    GROUP BY M.menu_name
    ) AS sub
WHERE count > 1;