USE LittleLemonDM;
####################### Task 1#########################
CREATE PROCEDURE GetMaxQuantity()
    SELECT MAX(quantity) AS 'Max Quantity in Order' FROM Orders;

CALL GetMaxQuantity;

####################### Task 2#########################
PREPARE GetOrderDetail FROM
    'SELECT orderID, quantity, cost FROM Orders WHERE orderID = ?';

SET @id = 1;
EXECUTE GetOrderDetail USING @id;

####################### Task 3#########################
DELIMITER //
CREATE PROCEDURE CancelOrder(IN id INT)
BEGIN
    DELETE FROM Orders WHERE orderID = id;
    SELECT CONCAT('Order ', id, ' is cancelled') AS 'Confirmation';
END //
DELIMITER ;

CALL CancelOrder(2)

