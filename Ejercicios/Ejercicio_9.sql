/*
9) Mostrar para cada hospital, cuántos médicos y enfermeros fueron testeados por
COVID-19 por cada semana, y mostrar también el resultado obtenido del test.
*/

SELECT *
FROM muestra_emp_covid
	NATURAL JOIN muestra_empleados;



