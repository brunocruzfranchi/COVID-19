/*
13)	Determinar la cantidad de pacientes fallecidos por Covid que se encontraban en terapia intensiva con y sin respirador, 
y compararlo con la cantidad de fallecidos que no estaban en TI.
*/

SELECT CASE Respirador
			WHEN 0 THEN 'TI Sin Respirador'
            ELSE 'TI Con Respirador'
		END AS Criterio,
		SUM(CASE WHEN CheckOut = 'Fallecido' 
			THEN 1 ELSE 0
		END) AS 'Fallecidos'
FROM (
SELECT  Respirador, CheckOut FROM (
SELECT * FROM terapia_intensiva
NATURAL JOIN paciente_cama) as t1
NATURAL JOIN pacienteinternado) as t2
GROUP BY Respirador

UNION

SELECT 'No Terapia Intensiva' as Criterio,
		SUM(CASE WHEN CheckOut = 'Fallecido' 
			THEN 1 ELSE 0
		END) AS 'Fallecidos'
FROM (
SELECT  CheckOut FROM (
SELECT * FROM normales
NATURAL JOIN paciente_cama) as t1
NATURAL JOIN pacienteinternado) as t2;



