USE LittleLemonDM;
####################### Task 1#########################

CREATE PROCEDURE AddBooking(IN id INT, IN c INT, IN t INT, IN d DATE)
BEGIN
   INSERT INTO Bookings(bookingID, date, table_number, customerID)
       VALUES (id, d, t, c);
   SELECT 'New booking added' AS 'Confirmation';
END;

CALL AddBooking(9,3,4,'2022-12-30');

####################### Task 2#########################

CREATE PROCEDURE UpdateBooking(IN id INT, IN d DATE)
BEGIN
    UPDATE Bookings
        SET date = d
    WHERE bookingID = 9;
    SELECT CONCAT('Booking ', id, ' updated') AS 'Confirmation';
END;

CALL UpdateBooking(9,'2022-12-17');

####################### Task 3#########################

CREATE PROCEDURE CancelBooking(IN id INT)
BEGIN
    DELETE FROM Bookings
        WHERE bookingID = id;
    SELECT CONCAT('Booking ', id, ' cancelled') AS 'Confirmation';
END;

CALL CancelBooking(9);

