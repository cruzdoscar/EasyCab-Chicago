-- Esta consulta obtiene las condiciones meteorológicas para cada hora, clasificándolas en 'Bad' o 'Good' según la descripción.

SELECT  
    ts,
    CASE 
        WHEN description LIKE '%rain%' OR description LIKE '%storm%' THEN 'Bad' -- Clasificamos como 'Bad' si la descripción contiene 'rain' o 'storm'
        ELSE 'Good' -- Clasificamos como 'Good' para las demás condiciones
        END AS weather_conditions -- Creamos un alias 'weather_conditions' para la columna resultante
FROM
    weather_records;