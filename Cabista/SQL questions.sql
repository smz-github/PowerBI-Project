# 1. Retrieve all successful bookings:
Create View cabista.successful_bookings AS
SELECT * FROM cabista.booking_july
WHERE Booking_Status='Success';

# 2. Find the average ride distance for each vehicle type:
Create View cabista.avg_ride_distance as
SELECT Vehicle_Type, Format(AVG(Ride_Distance),2) as Avg_Distance FROM cabista.booking_july
group by Vehicle_Type;

# 3. Get the total number of cancelled rides by customers:
Create View cabista.total_rides_cancelled_by_cust AS
SELECT COUNT(*) FROM cabista.booking_july
WHERE Booking_Status='Canceled by Customer';

# 4. List the top 5 customers who booked the highest number of rides:
CREATE VIEW cabista.top_5_customers AS
SELECT Customer_ID, count(Booking_ID) as total_rides FROM cabista.booking_july
GROUP BY Customer_ID
ORDER BY total_rides DESC LIMIT 5;

# 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
CREATE VIEW cabista.can_by_driver_personal_issue AS
SELECT COUNT(*) FROM cabista.booking_july
WHERE Canceled_Rides_by_Driver='Personal & Car Related Issue';

# 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
CREATE VIEW cabista.prime_sedan_min_max_driver_rating AS
SELECT min(Driver_Ratings), max(Driver_ratings) FROM cabista.booking_july
WHERE Vehicle_Type='Prime Sedan';

# 7. Retrieve all rides where payment was made using UPI:
CREATE VIEW cabista.rides_with_upi AS
SELECT * FROM cabista.booking_july
WHERE Payment_Method='UPI';

# 8. Find the average customer rating per vehicle type:
SELECT Vehicle_Type, FORMAT(AVG(Customer_Rating),2) as avg_customer_rating FROM cabista.booking_july
GROUP BY Vehicle_Type;

# 9. Calculate the total booking value of rides completed successfully:
CREATE VIEW cabista.total_successfull_booking_value AS
SELECT sum(Booking_Value) FROM cabista.booking_july
WHERE Booking_Status='Success';

# 10. List all incomplete rides along with the reason:
CREATE VIEW cabista.incomplete_rides AS
SELECT Booking_ID, Incomplete_Rides_Reason FROM cabista.booking_july
WHERE Incomplete_Rides='Yes';