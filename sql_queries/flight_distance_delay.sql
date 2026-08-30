1. How does the number of dissatisfied passengers vary across flight-distance groups?

SELECT
   CASE
     WHEN flight_distance BETWEEN 0  AND 500 THEN 'Short-haul(0-500)'
	 WHEN flight_distance BETWEEN 501  AND 1000 THEN 'Medium-haul(501-1000)'
	 WHEN flight_distance BETWEEN 1001  AND 1500 THEN 'Long-haul(1001-1500)'
	 WHEN flight_distance BETWEEN 1501  AND 2500 THEN 'Very-haul(1501-2500)'
	 ELSE 'Very Long-haul(2500+)'
   END AS flight_distance_group,
   SUM(
      CASE
	    WHEN satisfaction = 'Neutral or Dissatisfied' THEN 1
	    ELSE 0
	  END  
  ) AS total_dissatisfied 
FROM airline_satisfaction
GROUP BY flight_distance_group
ORDER BY total_dissatisfied DESC

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

2. How does average time-convenience rating vary across departure-delay groups?

SELECT
   CASE
     WHEN departure_delay = 0 THEN 'No Delay(0)'
	 WHEN departure_delay BETWEEN 1 AND 15 THEN 'Minor(1-15)'
	 WHEN departure_delay BETWEEN 16 AND 60 THEN 'Moderate(16-60)'
	 WHEN departure_delay BETWEEN 61 AND 180 THEN 'Major(61-180)'
	 ELSE 'Severe(180+)'
   END AS departure_delay_group,
   ROUND(AVG(time_convenience),2) AS avg_convenience
FROM airline_satisfaction
GROUP BY departure_delay_group
ORDER BY avg_convenience DESC

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

3. How do average service ratings (onboard, inflight, Wi-Fi, entertainment) vary across flight-distance buckets?

SELECT
   CASE
     WHEN flight_distance BETWEEN 0  AND 500 THEN 'Short-haul(0-500)'
	 WHEN flight_distance BETWEEN 501  AND 1000 THEN 'Medium-haul(501-1000)'
	 WHEN flight_distance BETWEEN 1001  AND 1500 THEN 'Long-haul(1001-1500)'
	 WHEN flight_distance BETWEEN 1501  AND 2500 THEN 'Very-haul(1501-2500)'
	 ELSE 'Very Long-haul(2500)'
   END AS flight_distance_group,
  ROUND(AVG(onboard_service),2) AS avg_onboard_service_rating,
  ROUND(AVG(inflight_service),2) AS avg_inflight_service_rating,
  ROUND(AVG(inflight_wifi_service),2) AS avg_inflight_wifi_service_rating,
  ROUND(AVG(inflight_entertainment),2) AS avg_inflight_entertainment_rating
FROM airline_satisfaction
GROUP BY flight_distance_group









