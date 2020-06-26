/*
17)	Determinar un promedio de día, desde el día de llegada hasta de salida, 
de los pacientes internados agrupados según su estado evolutivo y si ha fallecido, recuperado.
*/

DROP VIEW HOLA;

/*
El objetivo de este ejercicio es determinal el plazo de tiempo que pasa una personas
desde el dia de llegada hasta que se dio sucedio su checkout, y con dichos datos
se obtienen un promedio 
*/


-- Creo una vista que contenga todos los datos de fecha de cada uno de los pacientes internados
CREATE VIEW HOLA AS(                                                                                                                        
SELECT * FROM(
SELECT Internado_Personas_DNI AS Personas_DNI, CheckOut, FH_Salida FROM (SELECT * FROM pacienteinternado WHERE CheckOut IS NOT NULL) as t1
INNER JOIN salida_paciente as t2
ON t1.Internado_Personas_DNI = t2.pacienteinternado_Internado_Personas_DNI) as t3
NATURAL JOIN pacientes);


-- Aqui determino el rango de tiempo transcurrio desde el dia de llegada hasta el de salida
WITH TEST AS(
SELECT dayofyear(FH_salida)-dayofyear(Dia_de_Ingreso) as Tiempo_Transcurrido, CheckOut, count(*) as Cantidad
FROM HOLA GROUP BY Tiempo_Transcurrido
HAVING Tiempo_Transcurrido>0
ORDER BY CheckOut, Tiempo_Transcurrido ASC)

-- Determino el promedio del tiempo transcurrido del paciente en el hospital
SELECT AVG(Tiempo_Transcurrido) as 'Promedio del Tiempo Transcurrido dentro del Hospital', CheckOut 
FROM TEST
GROUP BY CheckOut;

-- Hago un display de los datos obtenidos anteriormente

WITH TEST AS(
SELECT dayofyear(FH_salida)-dayofyear(Dia_de_Ingreso) as Tiempo_Transcurrido, CheckOut, count(*) as Cantidad
FROM HOLA GROUP BY Tiempo_Transcurrido
HAVING Tiempo_Transcurrido>0
ORDER BY CheckOut, Tiempo_Transcurrido ASC)


SELECT * FROM TEST;

