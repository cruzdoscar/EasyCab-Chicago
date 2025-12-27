-- Esta consulta encuentra los IDs de vecindarios O'Hare y Loop de la tabla neighborhoods.
SELECT 
    name,
    neighborhood_id
FROM 
    neighborhoods
WHERE 
    name in ('O''Hare', 'Loop');