-- 1. Number of Resturants by Country
-- 2. Count of Restaurants by Rating
-- 3. Number of Restaurants by Opening Year, Month, and Quarter
-- 4. Restaurant Bucket Analysis Based on Average Price
-- 5. Percentage of Restaurants with Table Booking
-- 6. Percentage of Restaurants with Online Delivery
-- 7. Number of Restaurants by City
-- 8. Restaurant Performance Based on Cost and Number of Restaurants
-- 9. Restaurant Performance Based on "Votes" and "Aggregate Rating“

use bank_data;

SELECT COUNT(*)
FROM `zomato analytics dataset csv`;

-- 1. Number of Resturants by country
SELECT CountryCode, COUNT(*) AS Total_Restaurants
FROM `zomato analytics dataset csv`
GROUP BY CountryCode
ORDER BY Total_Restaurants DESC;

-- 2. Count of Restaurants by Rating
SELECT Rating, COUNT(*) AS Restaurant_Count
FROM `zomato analytics dataset csv`
GROUP BY Rating
ORDER BY Rating DESC;

-- 3. Number of Restaurants by Opening Year, Month, and Quarter
-- BY Year
SELECT YEAR(Datekey_Opening) AS Year, COUNT(*) AS Total_Restaurants
FROM `zomato analytics dataset csv`
GROUP BY YEAR(Datekey_Opening)
ORDER BY Year;

-- BY Month
SELECT MONTH(Datekey_Opening) AS Month, COUNT(*) AS Total_Restaurants
FROM `zomato analytics dataset csv`
GROUP BY MONTH(Datekey_Opening)
ORDER BY Month;

-- BY QUARTER
SELECT QUARTER(Datekey_Opening) AS Quarter, COUNT(*) AS Total_Restaurants
FROM `zomato analytics dataset csv`
GROUP BY QUARTER(Datekey_Opening);

-- 4. Restaurant Bucket Analysis Based on Average Price
SELECT 
  CASE 
    WHEN Average_Cost_for_two < 300 THEN 'Low Cost'
    WHEN Average_Cost_for_two BETWEEN 300 AND 700 THEN 'Medium Cost'
    ELSE 'High Cost'
  END AS Price_Bucket,
  COUNT(*) AS Restaurant_Count
FROM `zomato analytics dataset csv`
GROUP BY Price_Bucket;

-- 5. Percentage of Restaurants with Table Booking
SELECT 
  ROUND(
    COUNT(CASE WHEN Has_Table_booking = 'Yes' THEN 1 END) * 100.0 / COUNT(*),
    2
  ) AS Table_Booking_Percentage
FROM `zomato analytics dataset csv`;

-- 6. Percentage of Restaurants with Online Delivery
SELECT 
  ROUND(
    COUNT(CASE WHEN Has_Online_delivery = 'Yes' THEN 1 END) * 100.0 / COUNT(*),
    2
  ) AS Online_Delivery_Percentage
FROM `zomato analytics dataset csv`;

-- 7. Number of Restaurants by City
SELECT City, COUNT(*) AS Total_Restaurants
FROM `zomato analytics dataset csv`
GROUP BY City
ORDER BY Total_Restaurants DESC;

-- 8. Restaurant Performance Based on Cost and Number of Restaurants
SELECT 
  Average_Cost_for_two,
  COUNT(*) AS Restaurant_Count
FROM `zomato analytics dataset csv`
GROUP BY Average_Cost_for_two
ORDER BY Average_Cost_for_two;

-- 9. Restaurant Performance Based on "Votes" and "Aggregate Rating“
SELECT 
  RestaurantName,
  Votes,
  Rating
FROM `zomato analytics dataset csv`
ORDER BY Votes DESC, Rating DESC;













