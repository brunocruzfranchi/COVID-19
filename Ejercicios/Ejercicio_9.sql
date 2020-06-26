/*
9) Mostrar para cada hospital, cuántos médicos y enfermeros fueron testeados por
COVID-19 por cada semana, y mostrar también el resultado obtenido del test.
*/

-- Otro ejemplo de que, a veces, el WITH funciona... y, a veces, no.

DROP VIEW IF EXISTS T1;	-- Creo una view, y no un with, porque necesito la vista para el siguiente ejercicio.

CREATE VIEW T1 AS(	-- Me fijo el resultado de los tests que se realizaron los empleados, uniendo las
			-- tablas empleado y muestra_empleado, donde esta guardada la informacion necesaria
SELECT empleados_personas_DNI, Fecha_muestra, resultado
FROM muestra_emp_covid 
	INNER JOIN muestra_empleados ON muestra_emp_covid.NroTesteo = muestra_empleados.muestra_emp_covid_NroTesteo
);

-- Como es de interes la cantidad de positivos, negativos y total de infectados, proyecto toda esta informacion
SELECT hospital.Nombre_Hospital AS Hospital, week(Fecha_muestra) AS Semana, sum(resultado = 1) AS Positivos, sum(resultado = 0) AS Negativos, count(week(Fecha_muestra)) AS Cantidad_Total_Infectados
FROM t1	-- Separo por semana y por hospital, asi tengo en cada upla un hospital con una semana diferente, junto a los datos requeridos
	NATURAL JOIN empleado_hospital	
	INNER JOIN hospital ON hospital.NroHospital = empleado_hospital.hospital_NroHospital
GROUP BY Semana, Hospital
ORDER BY Hospital ASC, Semana ASC;