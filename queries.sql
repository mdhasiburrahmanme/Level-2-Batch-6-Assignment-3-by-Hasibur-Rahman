-- Query 1: Retrieve booking information along with customer name and vehicle
SELECT
    bookings.booking_id,
    users.name AS customer_name,
    vehicles.name AS vehicle_name,
    bookings.start_date,
    bookings.end_date,
    bookings.status
FROM bookings
INNER JOIN users ON bookings.user_id = users.user_id
INNER JOIN vehicles ON bookings.vehicle_id = vehicles.vehicle_id;


-- Query 2: Find all vehicles that have never been booked.
SELECT *
FROM vehicles
WHERE NOT EXISTS (
    SELECT 1
    FROM bookings
    WHERE bookings.vehicle_id = vehicles.vehicle_id
);


-- Query 3: Retrieve all available vehicles of a specific type (e.g. cars).
SELECT *
FROM vehicles
WHERE type = 'car'
AND status = 'available';


-- Query 4: Find the total number of bookings for each vehicle and display only those vehicles that have more than 2 bookings.
SELECT
    vehicles.name AS vehicle_name,
    COUNT(bookings.booking_id) AS total_bookings
FROM bookings
INNER JOIN vehicles ON bookings.vehicle_id = vehicles.vehicle_id
GROUP BY vehicles.name
HAVING COUNT(bookings.booking_id) > 2;



