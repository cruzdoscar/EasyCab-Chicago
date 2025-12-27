-- Solicitud para obtener el número de viajes para cada empresa del 15 al 16 de noviembre
SELECT 
    c.company_name,
    COUNT(t.trip_id) AS trips_amount
FROM 
    cabs AS c
INNER JOIN 
    trips AS t ON t.cab_id = c.cab_id
WHERE
    t.start_ts::date IN ('2017-11-15', '2017-11-16')
GROUP BY 
    c.company_name
ORDER BY 
    trips_amount DESC;