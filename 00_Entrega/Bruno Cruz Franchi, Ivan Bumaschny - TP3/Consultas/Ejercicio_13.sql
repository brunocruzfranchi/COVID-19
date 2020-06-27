/*
13)	Determinar la cantidad de pacientes fallecidos por Covid que se encontraban en terapia intensiva con y sin respirador, 
y compararlo con la cantidad de fallecidos que no estaban en TI.
*/

/*
El objetivo del primer select es obtener la cantidad de fallecido que se encontraban en TI con o sin 
respirador. Para ello se utilizo CASE que me permite realizar la suma de todos aquellas personas que
hayan fallecido y luego con un GROUP BY dividir dicha suma segun si estaba con respirador o no. 

Por ultimo, en el ultimo select determina la cantidad de personas que fallecieron en camas asignadas
como comunes, es decir, pacientes que no estuvieron en terapia intensiva
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



