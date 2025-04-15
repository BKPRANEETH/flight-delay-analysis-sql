# Flight Delay Analysis using SQL

This project focuses on analyzing flight delay and cancellation trends using a large dataset from 2019 to 2023. The goal is to understand patterns across airlines, airports, and seasons to identify which factors most contribute to delays.

## 🎯 Objective

- Examine delay frequencies across U.S. airlines and airports.
- Identify seasonal or time-based delay trends.
- Determine the most common causes of delays.

## 📁 Project Structure

- `/SQL`: SQL scripts used for exploration and analysis.
- `/Data`: Instructions and links to download the dataset.

## 📄 Dataset

- Source: [Flight Delay and Cancellation Dataset (2019-2023) on Kaggle](https://www.kaggle.com/datasets/patrickzel/flight-delay-and-cancellation-dataset-2019-2023)
- Size: ~100MB
- Format: CSV files with date, airline, airport, and delay info.

## ⚙️ How to Run

1. Download the dataset and load it into your SQL environment (e.g., PostgreSQL or MySQL).
2. Run queries from `/SQL/flight_delay_analysis.sql`.
3. Analyze patterns such as average delays, cancellations by airline, and delay causes.

## 🔍 Key Queries

### 1. Airlines with the highest average delays

```sql
SELECT Airline, AVG(Departure_Delay) AS Avg_Departure_Delay
FROM flight_delays
GROUP BY Airline
ORDER BY Avg_Departure_Delay DESC;
```

**Output Example:**
| Airline   | Avg_Departure_Delay |
|-----------|---------------------|
| Delta     | 20.4                |
| United    | 18.7                |
| American  | 16.2                |
| JetBlue   | 15.8                |
| Alaska    | 13.9                |

---

### 2. Most delayed routes

```sql
SELECT Origin, Destination, AVG(Arrival_Delay) AS Avg_Arrival_Delay
FROM flight_delays
GROUP BY Origin, Destination
ORDER BY Avg_Arrival_Delay DESC
LIMIT 10;
```

**Output Example:**
| Origin    | Destination | Avg_Arrival_Delay |
|-----------|-------------|-------------------|
| JFK       | LAX         | 45.6              |
| ORD       | ATL         | 38.4              |
| LAX       | MIA         | 35.1              |
| ATL       | DFW         | 33.5              |
| SFO       | SEA         | 30.2              |

---

### 3. Delay reasons

```sql
SELECT Reason, COUNT(*) AS Count
FROM flight_delays
WHERE Reason IS NOT NULL
GROUP BY Reason
ORDER BY Count DESC;
```

**Output Example:**
| Reason        | Count |
|---------------|-------|
| Weather       | 250   |
| Carrier       | 180   |
| NAS           | 150   |
| Security      | 120   |
| Late Aircraft | 100   |

---

### 4. Monthly trends

```sql
SELECT EXTRACT(MONTH FROM Flight_Date) AS Month, COUNT(*) AS Total_Flights
FROM flight_delays
GROUP BY Month
ORDER BY Month;
```

**Output Example:**
| Month | Total_Flights |
|-------|---------------|
| 1     | 12,500        |
| 2     | 13,200        |
| 3     | 14,300        |
| 4     | 15,100        |
| 5     | 16,000        |

---

## 🛠 Tools Used

- SQL (PostgreSQL or MySQL)
- Kaggle dataset

---

*This project was created to explore real-world transportation data using SQL and build insights from large-scale structured datasets.*
