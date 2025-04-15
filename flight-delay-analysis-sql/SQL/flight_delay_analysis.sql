-- Flight Delay SQL Analysis

-- Average delay per airline
SELECT Airline, AVG(Departure_Delay) AS Avg_Departure_Delay
FROM flight_delays
GROUP BY Airline
ORDER BY Avg_Departure_Delay DESC;

-- Most delayed routes
SELECT Origin, Destination, AVG(Arrival_Delay) AS Avg_Arrival_Delay
FROM flight_delays
GROUP BY Origin, Destination
ORDER BY Avg_Arrival_Delay DESC
LIMIT 10;

-- Delay reasons
SELECT Reason, COUNT(*) AS Count
FROM flight_delays
WHERE Reason IS NOT NULL
GROUP BY Reason
ORDER BY Count DESC;

-- Monthly trends
SELECT EXTRACT(MONTH FROM Flight_Date) AS Month, COUNT(*) AS Total_Flights
FROM flight_delays
GROUP BY Month
ORDER BY Month;
