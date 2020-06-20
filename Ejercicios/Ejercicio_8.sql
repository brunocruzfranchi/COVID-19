/*
8) Mostrar para cada hospital, cuánto es el promedio semanal de recuperados y de
muertos en personas mayores de 70 años, separando por sexo y por lugar de
residencia (Ciudad Autónoma de Buenos Aires, Gran Buenos Aires, otros)
*/

DROP VIEW Mayores;

CREATE VIEW Mayores AS (
SELECT DNI, Sexo, CheckOut, Hospital_NroHospital, FH_Salida, Localidad
FROM ( SELECT * FROM 
(SELECT * FROM pacienteinternado 
WHERE CheckOut IS NOT NULL )AS a
NATURAL JOIN paciente_hospital ) as t1

INNER JOIN (SELECT * FROM personas
WHERE (year(CURDATE())-year(personas.F_Nacimiento)>70)) as t2
ON t1.Internado_Personas_DNI = t2.DNI

INNER JOIN(SELECT * FROM 
salida_paciente) as t3
on t3.pacienteinternado_Internado_Personas_DNI=t1.Internado_Personas_DNI

INNER JOIN(SELECT * FROM 
domicilio) as t4
on t4.personas_DNI=t1.Internado_Personas_DNI
);

SELECT Nombre_Hospital, Sexo, CheckOut, Promedio
FROM(
SELECT Hospital_NroHospital as NroHospital, Sexo, CheckOut, Localidad, AVG(Cant) as Promedio FROM (
SELECT Hospital_NroHospital, Sexo, yearweek(FH_Salida) as Semana, CheckOut, Localidad, count(*) as Cant
FROM Mayores
GROUP BY Hospital_NroHospital, Sexo, Localidad, Checkout) as t6
GROUP BY Hospital_NroHospital, Sexo, Checkout
ORDER BY Hospital_NroHospital, Sexo ASC) AS t5
NATURAL JOIN hospital;

