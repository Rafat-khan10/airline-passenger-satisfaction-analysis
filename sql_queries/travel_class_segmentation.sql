1. Which travel class has the highest number of dissatisfied passengers within each customer type?
WITH cte AS (
SELECT
   customer_type,
   travel_class,
   SUM(
      CASE
	    WHEN satisfaction = 'Neutral or Dissatisfied' THEN 1
	    ELSE 0
	  END  
  ) AS total_dissatisfied  
FROM airline_satisfaction
GROUP BY customer_type,travel_class
)

SELECT
  *,
  DENSE_RANK() OVER(PARTITION BY customer_type ORDER BY total_dissatisfied DESC) AS dissatisfied_rank
FROM cte

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

2. How does average time-convenience rating vary across travel classes?

SELECT
  travel_class,
  ROUND(AVG(time_convenience),2) AS avg_time_convenience
FROM airline_satisfaction
GROUP BY travel_class
ORDER BY avg_time_convenience DESC

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

3. Which travel class has the highest neutral-or-dissatisfied rate?

SELECT
  travel_class,
   ROUND(SUM(
     CASE
	   WHEN satisfaction = 'Neutral or Dissatisfied' THEN 1
	   ELSE 0
	 END  
  )*100.0/COUNT(*),2) AS neutral_or_dissatisfaction_rate
FROM airline_satisfaction
GROUP BY travel_class
ORDER BY neutral_or_dissatisfaction_rate DESC
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
4. Which age group has the highest number of passengers within each travel class?
WITH cte AS (
SELECT
    travel_class,
    CASE
      WHEN age < 18 THEN 'Teen(<18)'
	  WHEN age BETWEEN 18 AND 30 THEN 'Young-Adult(18-30)'
	  WHEN age BETWEEN 31 AND 45 THEN 'Adult(31-45)'
      WHEN age BETWEEN 46 AND 60 THEN 'Middle-aged(46-60)'
	  ELSE 'Senior(60+)'
   END AS age_group,
  COUNT(*) AS total_count
FROM airline_satisfaction
GROUP BY travel_class,age_group
)
SELECT
  *,
  DENSE_RANK() OVER(PARTITION BY travel_class ORDER BY total_count DESC) AS rank
FROM cte

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

5. Which travel class has the highest satisfaction rate within each travel type?

WITH cte AS (
SELECT
  travel_type,
  travel_class,
  ROUND(SUM(
    CASE
      WHEN satisfaction = 'Satisfied' THEN 1
	  ELSE 0
    END)*100.0/COUNT(*),2) AS satisfaction_rate
FROM airline_satisfaction
GROUP BY travel_type ,travel_class 
)
SELECT
  *,
  RANK() OVER(PARTITION BY travel_type ORDER BY satisfaction_rate DESC) AS rank
FROM cte
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

6. Which travel class has the highest satisfaction rate for each customer type and travel type combination?
WITH cte AS (
SELECT
  customer_type,
  travel_type,
  travel_class,
  ROUND(SUM(
    CASE
      WHEN satisfaction = 'Satisfied' THEN 1
	  ELSE 0
    END)*100.0/COUNT(*),2) AS satisfaction_rate
FROM airline_satisfaction
GROUP BY customer_type,travel_type ,travel_class 
)
SELECT
  *,
  RANK() OVER(PARTITION BY customer_type,travel_type ORDER BY satisfaction_rate DESC) AS rank
FROM cte

























