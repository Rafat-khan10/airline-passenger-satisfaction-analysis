1. Which age group has the highest dissatisfaction?

WITH cte AS (
SELECT
  CASE
     WHEN age < 18 THEN 'Teen(<18)'
	 WHEN age BETWEEN 18 AND 30 THEN 'Young-Adult(18-30)'
	 WHEN age BETWEEN 31 AND 45 THEN 'Adult(31-45)'
	 WHEN age BETWEEN 46 AND 60 THEN 'Middle-aged(46-60)'
	 ELSE 'Senior(60+)'
  END AS age_group,
  SUM(
      CASE
	    WHEN satisfaction='Satisfied' THEN 1
	    ELSE 0
	  END  
  ) AS total_satisfied,
  SUM(
      CASE
	    WHEN satisfaction='Neutral or Dissatisfied' THEN 1
	    ELSE 0
	  END  
  ) AS total_dissatisfied  
FROM airline_satisfaction
GROUP BY age_group
)
SELECT
  *,
  ROUND(total_dissatisfied*100.0/(total_satisfied + total_dissatisfied),2) AS dissatisfied_perc
FROM cte
ORDER BY dissatisfied_perc DESC

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

2. How does passenger satisfaction vary by customer type?

SELECT
  customer_type,
  satisfaction,
  COUNT(*) AS total_count
FROM airline_satisfaction  
GROUP BY customer_type,satisfaction

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

3. How many returning customers are there by gender?

SELECT
  gender,
  SUM(
      CASE
	    WHEN customer_type='Returning'THEN 1
	    ELSE 0
	  END  
  ) AS returning_count
FROM airline_satisfaction
GROUP BY gender

SELECT
  gender,
  SUM(
      CASE
	    WHEN customer_type='Returning'THEN 1
	    ELSE 0
	  END  
  ) AS returning_count
FROM airline_satisfaction
GROUP BY gender











