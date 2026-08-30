1. How do average service ratings compare across travel classes (Business, Economy, Economy Plus)?

SELECT
  'Business' AS table,
   ROUND(AVG(online_booking),2) AS online_booking_avg_rating,
   ROUND(AVG(checkin_service),2) AS checkin_service_avg_rating,
   ROUND(AVG(online_boarding),2) AS online_boarding_avg_rating,
   ROUND(AVG(onboard_service),2) AS onboard_service_avg_rating,
   ROUND(AVG(inflight_service),2) AS inflight_service_avg_rating,
   ROUND(AVG(inflight_wifi_service),2) AS inflight_wifi_service_avg_rating
FROM airline_satisfaction
WHERE travel_class='Business'

UNION

SELECT
  'Economy' AS table,
   ROUND(AVG(online_booking),2) AS online_booking_avg_rating,
   ROUND(AVG(checkin_service),2) AS checkin_service_avg_rating,
   ROUND(AVG(online_boarding),2) AS online_boarding_avg_rating,
   ROUND(AVG(onboard_service),2) AS onboard_service_avg_rating,
   ROUND(AVG(inflight_service),2) AS inflight_service_avg_rating,
   ROUND(AVG(inflight_wifi_service),2) AS inflight_wifi_service_avg_rating   
FROM airline_satisfaction 
WHERE travel_class='Economy'

UNION

SELECT
  'Economy plus',
   ROUND(AVG(online_booking),2) AS online_booking_avg_rating,
   ROUND(AVG(checkin_service),2) AS checkin_service_avg_rating,
   ROUND(AVG(online_boarding),2) AS online_boarding_avg_rating,
   ROUND(AVG(onboard_service),2) AS onboard_service_avg_rating,
   ROUND(AVG(inflight_service),2) AS inflight_service_avg_rating,
   ROUND(AVG(inflight_wifi_service),2) AS inflight_wifi_service_avg_rating   
FROM airline_satisfaction 
WHERE travel_class='Economy Plus'

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

2. How do average service ratings differ between first-time and returning customers within Business class?

SELECT
  customer_type,
  ROUND(AVG(online_booking),2) AS avg_online_booking_rating,
  ROUND(AVG(online_boarding),2) AS avg_online_boarding_rating,
  ROUND(AVG(onboard_service),2) AS avg_onboard_service_rating,
  ROUND(AVG(inflight_service),2) AS avg_inflight_service_rating,
  ROUND(AVG(inflight_wifi_service),2) AS avg_inflight_wifi_service_rating
FROM airline_satisfaction
WHERE travel_class ='Business'
GROUP BY customer_type























