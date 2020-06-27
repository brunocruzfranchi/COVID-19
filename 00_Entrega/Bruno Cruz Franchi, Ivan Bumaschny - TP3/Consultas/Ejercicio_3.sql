/*
3) Mostrar cuál fue el medicamento que se le administró a la mayor cantidad de los
pacientes recuperados
*/

SELECT 
	Nombre, Cantidad
FROM(
	SELECT 
		medicamento_idMedicamento AS idMedicamento, count(medicamento_idMedicamento) AS Cantidad  -- Contar la columna medicamento
	FROM 
		paciente_medicamento -- Tabla donde tenemos la relacion paciente_medicamento														
	GROUP BY
		medicamento_idMedicamento  -- Como agrupamos por medicamento, contara la cantidad de veces que aparece cada medicamento
	ORDER BY
		Cantidad DESC LIMIT 1) AS tabla -- Solo imprimir la primera upla
	NATURAL JOIN medicamento; -- Como la tabla es identica a medicamento, puedo hacer un NATURAL JOIN

