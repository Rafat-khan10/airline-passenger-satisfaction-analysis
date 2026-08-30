1. What are the key passenger and satisfaction metrics in the dataset?

SELECT
  'Total Passengers' AS Column_Name,
  COUNT(*)
FROM airline_satisfaction  
UNION ALL
SELECT
  'Satisfaction Rate',
  ROUND(SUM(CASE
    WHEN satisfaction ='Satisfied' THEN 1
	ELSE 0
  END)*100.0 / (SELECT COUNT(*) FROM airline_satisfaction),2)
FROM airline_satisfaction
UNION ALL
SELECT
  'Avg flight Distance(mi)',
  ROUND(AVG(flight_distance),2)
FROM airline_satisfaction
UNION ALL
SELECT
 'First-time Satisfaction %',
    ROUND(SUM(CASE
     WHEN customer_type='First-time' AND satisfaction ='Satisfied' THEN 1
	 ELSE 0
    END)*100.0/(SELECT SUM(CASE WHEN customer_type='First-time' THEN 1 ELSE 0 END) FROM airline_satisfaction),2)
FROM airline_satisfaction
