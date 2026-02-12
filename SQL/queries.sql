-- 1. Retrieve all successful bookings
SELECT * FROM bookings 
WHERE booking_status = 'Success';

CREATE VIEW Successful_Bookings AS 
SELECT * FROM bookings 
WHERE booking_status = 'Success';

SELECT * FROM Successful_Bookings;


-- 2. Average ride distance per vehicle type
SELECT vehicle_type, AVG(ride_distance) AS avg_distance 
FROM bookings 
GROUP BY vehicle_type;

CREATE VIEW ride_distance_for_each_vehicle AS 
SELECT vehicle_type, AVG(ride_distance) AS avg_distance 
FROM bookings 
GROUP BY vehicle_type;

SELECT * FROM ride_distance_for_each_vehicle;


-- 3. Cancelled rides by customers
SELECT COUNT(*) 
FROM bookings 
WHERE booking_status = 'Canceled by Customer';

CREATE VIEW canceled_rides_by_customers AS 
SELECT COUNT(*) AS total_canceled_by_customer
FROM bookings 
WHERE booking_status = 'Canceled by Customer';

SELECT * FROM canceled_rides_by_customers;


-- 4. Top 5 customers by number of rides
SELECT customer_id, COUNT(booking_id) AS total_rides 
FROM bookings 
GROUP BY customer_id 
ORDER BY total_rides DESC 
LIMIT 5;

CREATE VIEW Top_5_Customers AS 
SELECT customer_id, COUNT(booking_id) AS total_rides 
FROM bookings 
GROUP BY customer_id 
ORDER BY total_rides DESC 
LIMIT 5;

SELECT * FROM Top_5_Customers;


-- 5. Rides cancelled by drivers (Personal & car issues)
SELECT COUNT(*) 
FROM bookings 
WHERE canceled_rides_by_driver = 'Personal & Car related issue';

CREATE VIEW Rides_Canceled_by_Drivers_P_C_Issues AS 
SELECT COUNT(*) AS driver_personal_car_issue_count
FROM bookings 
WHERE canceled_rides_by_driver = 'Personal & Car related issue';

SELECT * FROM Rides_Canceled_by_Drivers_P_C_Issues;


-- 6. Max & Min driver ratings for Prime Sedan
SELECT MAX(driver_ratings) AS max_rating, MIN(driver_ratings) AS min_rating 
FROM bookings 
WHERE vehicle_type = 'Prime Sedan';

CREATE VIEW Max_Min_Driver_Rating AS 
SELECT MAX(driver_ratings) AS max_rating, MIN(driver_ratings) AS min_rating
FROM bookings 
WHERE vehicle_type = 'Prime Sedan';

SELECT * FROM Max_Min_Driver_Rating;


-- 7. All UPI payment rides
SELECT * FROM bookings 
WHERE payment_method = 'UPI';

CREATE VIEW UPI_Payment AS 
SELECT * FROM bookings 
WHERE payment_method = 'UPI';


-- 8. Avg customer rating per vehicle type (clean version)
CREATE VIEW AVG_Cust_Rating AS 
SELECT vehicle_type,
AVG(NULLIF(NULLIF(LOWER(customer_rating), 'null'), '')::numeric) AS avg_customer_rating
FROM bookings 
GROUP BY vehicle_type;

SELECT * FROM AVG_Cust_Rating;


-- 9. Total booking value of successful rides
SELECT SUM(booking_value) AS total_successful_ride_value 
FROM bookings 
WHERE booking_status = 'Success';

CREATE VIEW total_successful_ride_value AS 
SELECT SUM(booking_value) AS total_successful_ride_value 
FROM bookings 
WHERE booking_status = 'Success';

SELECT * FROM total_successful_ride_value;


-- 10. Incomplete rides + reason
SELECT booking_id, incomplete_rides_reason 
FROM bookings 
WHERE incomplete_rides = 'Yes';

CREATE VIEW incomplete_rides_reason AS 
SELECT booking_id, incomplete_rides_reason 
FROM bookings 
WHERE incomplete_rides = 'Yes';

SELECT * FROM incomplete_rides_reason;
