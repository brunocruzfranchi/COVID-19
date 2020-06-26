/*
17)	Determinar un promedio de día, desde el día de llegada hasta de salida, 
de los pacientes internados agrupados según su estado evolutivo y si ha fallecido, recuperado.
*/

DROP VIEW HOLA;

CREATE VIEW HOLA AS(
SELECT * FROM(
SELECT Internado_Personas_DNI AS Personas_DNI, CheckOut, FH_Salida FROM (SELECT * FROM pacienteinternado WHERE CheckOut IS NOT NULL) as t1
INNER JOIN salida_paciente as t2
ON t1.Internado_Personas_DNI = t2.pacienteinternado_Internado_Personas_DNI) as t3
NATURAL JOIN pacientes);

WITH TEST AS(
SELECT dayofyear(FH_salida)-dayofyear(Dia_de_Ingreso) as Tiempo_Transcurrido, CheckOut, count(*) as Cantidad
FROM HOLA GROUP BY Tiempo_Transcurrido
HAVING Tiempo_Transcurrido>0
ORDER BY CheckOut, Tiempo_Transcurrido ASC)

SELECT AVG(Tiempo_Transcurrido) as 'Promedio del Tiempo Transcurrido dentro del Hospital', CheckOut 
FROM TEST
GROUP BY CheckOut;

SELECT dayofyear(FH_salida)-dayofyear(Dia_de_Ingreso) as Tiempo_Transcurrido, CheckOut, count(*) as Cantidad
FROM HOLA GROUP BY Tiempo_Transcurrido
HAVING Tiempo_Transcurrido>0
ORDER BY CheckOut, Tiempo_Transcurrido ASC;
