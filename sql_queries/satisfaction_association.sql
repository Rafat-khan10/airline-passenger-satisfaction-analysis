1. Which services have the strongest positive association with passenger satisfaction?

WITH correlated_table AS (
SELECT 'Online Boarding' AS service,
      ROUND(CORR(online_boarding,
            CASE WHEN satisfaction = 'Satisfied' THEN 1 ELSE 0 END)::NUMERIC,2) AS correlation
FROM airline_satisfaction

UNION ALL

SELECT 'Inflight Entertainment',
      ROUND(CORR(inflight_entertainment,
            CASE WHEN satisfaction = 'Satisfied' THEN 1 ELSE 0 END)::NUMERIC,2)
FROM airline_satisfaction

UNION ALL

SELECT 'Seat Comfort',
       ROUND(CORR(seat_comfort,
            CASE WHEN satisfaction = 'Satisfied' THEN 1 ELSE 0 END)::NUMERIC,2)
FROM airline_satisfaction

UNION ALL

SELECT 'On-board Service',
       ROUND(CORR(onboard_service,
            CASE WHEN satisfaction = 'Satisfied' THEN 1 ELSE 0 END)::NUMERIC,2)
FROM airline_satisfaction

UNION ALL

SELECT 'Legroom Service',
       ROUND(CORR(legroom_service,
            CASE WHEN satisfaction = 'Satisfied' THEN 1 ELSE 0 END)::NUMERIC,2)
FROM airline_satisfaction

UNION ALL

SELECT 'Cleanliness',
      ROUND(CORR(cleanliness,
            CASE WHEN satisfaction = 'Satisfied' THEN 1 ELSE 0 END)::NUMERIC,2)
FROM airline_satisfaction

UNION ALL

SELECT 'Inflight Wi-Fi',
       ROUND(CORR(inflight_wifi_service,
            CASE WHEN satisfaction = 'Satisfied' THEN 1 ELSE 0 END)::NUMERIC,2)
FROM airline_satisfaction
)
SELECT
*
FROM correlated_table
ORDER BY correlation DESC
