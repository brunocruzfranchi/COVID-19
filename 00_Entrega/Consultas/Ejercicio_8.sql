/*
8) Mostrar para cada hospital, cuánto es el promedio semanal de recuperados y de
muertos en personas mayores de 70 años, separando por sexo y por lugar de
residencia (Ciudad Autónoma de Buenos Aires, Gran Buenos Aires, otros)
*/

DROP VIEW Mayores;

/*
Aqui el procedimiento es encontrar los datos de aquellas personas que posean mas de 70 anios
pero ademas debo tener los datos de cuando y porque se produjo su Salida para conseguir determinar el
promedio semanal junto al CheckOut, y junto a esto tambien se debe clasificarlo por lugar
de residancia 
*/

CREATE VIEW Mayores AS (
SELECT DNI, Sexo, CheckOut, Hospital_NroHospital, FH_Salida, Localidad
	FROM ( SELECT * FROM 													-- Aqui traigo unicamente los pacientes que que hayan
		(SELECT * FROM pacienteinternado WHERE CheckOut IS NOT NULL )AS a	-- sido registrado su salida, es decir, CheckOut no NULL
NATURAL JOIN paciente_hospital) as t1										-- y a la vez hago una junta natural con paciente_hospital para determinar su hospital

INNER JOIN (SELECT * FROM personas											-- Determino aquellas personas mayores a 70 anios
WHERE (year(CURDATE())-year(personas.F_Nacimiento)>70)) as t2				-- y hago un
ON t1.Internado_Personas_DNI = t2.DNI										-- 

INNER JOIN(SELECT * FROM 													-- Encuentro la fecha de salida
salida_paciente) as t3
on t3.pacienteinternado_Internado_Personas_DNI=t1.Internado_Personas_DNI

INNER JOIN(SELECT * FROM 													-- Encuentro el lugar de residencia
domicilio) as t4
on t4.personas_DNI=t1.Internado_Personas_DNI
);

SELECT Nombre_Hospital, Sexo, CheckOut, Promedio as 'Promedio Semanal'
FROM(
SELECT Hospital_NroHospital as NroHospital, Sexo, CheckOut, Localidad, AVG(Cant) as Promedio FROM (
	SELECT Hospital_NroHospital, Sexo, yearweek(FH_Salida) as Semana, CheckOut, Localidad, count(*) as Cant
	FROM Mayores
	GROUP BY Hospital_NroHospital, Sexo, Localidad, Checkout) as t6
GROUP BY Hospital_NroHospital, Sexo, Checkout
ORDER BY Hospital_NroHospital, Sexo ASC) AS t5															
NATURAL JOIN hospital;

