/*
3) Mostrar cuál fue el medicamento que se le administró a la mayor cantidad de los
pacientes recuperados
*/

SELECT 
	Nombre, Cantidad
FROM(
	SELECT 
		medicamento_idMedicamento AS idMedicamento, count(medicamento_idMedicamento) AS Cantidad
	FROM 
		paciente_medicamento
	GROUP BY
		medicamento_idMedicamento
	ORDER BY
		Cantidad DESC LIMIT 1) AS tabla 
        
	NATURAL JOIN medicamento;

