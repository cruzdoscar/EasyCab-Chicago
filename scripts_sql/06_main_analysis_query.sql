-- Esta solicitud obtiene los viajes que comenzaron en Loop y terminaron en O'Hare un sábado, junto con las condiciones climáticas y la duración del viaje.


SELECT
    t.start_ts,
    CASE 
        WHEN w.description LIKE '%rain%' OR w.description LIKE '%storm%' THEN 'Bad' -- Clasificamos como 'Bad' si la descripción contiene 'rain' o 'storm'
        ELSE 'Good' -- Clasificamos como 'Good' para las demás condiciones
        END AS weather_conditions,
    t.duration_seconds
FROM
    trips AS t
INNER JOIN
    weather_records AS w ON w.ts = t.start_ts
WHERE
    (t.pickup_location_id = 50 AND t.dropoff_location_id = 63) AND EXTRACT(DOW FROM t.start_ts) = 6 -- Filtramos por viajes que comenzaron en Loop (ID 50) y terminaron en O'Hare (ID 63) un sábado (DOW 6)
ORDER BY
    t.trip_id;