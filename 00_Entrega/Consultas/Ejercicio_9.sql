/*
9) Mostrar para cada hospital, cuántos médicos y enfermeros fueron testeados por
COVID-19 por cada semana, y mostrar también el resultado obtenido del test.
*/

WITH T1 AS(
SELECT empleados_personas_DNI, Fecha_muestra, resultado
FROM muestra_emp_covid 
	INNER JOIN muestra_empleados ON muestra_emp_covid.NroTesteo = muestra_empleados.muestra_emp_covid_NroTesteo
)

SELECT hospital.Nombre_Hospital AS Hospital, week(Fecha_muestra) AS Semana, sum(resultado = 1) AS Positivos, sum(resultado = 0) AS Negativos, count(week(Fecha_muestra)) AS Cantidad_Total_Infectados
FROM t1
	NATURAL JOIN empleado_hospital	
	INNER JOIN hospital ON hospital.NroHospital = empleado_hospital.hospital_NroHospital
GROUP BY Semana, Hospital
ORDER BY Hospital ASC, Semana ASC;