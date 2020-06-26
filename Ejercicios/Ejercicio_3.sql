/*
3) Mostrar cuál fue el medicamento que se le administró a la mayor cantidad de los
pacientes recuperados
*/

SELECT 
	Nombre, cuenta
FROM(
	SELECT 
		medicamento_idMedicamento AS idMedicamento, count(medicamento_idMedicamento) AS cuenta
	FROM 
		paciente_medicamento
	GROUP BY
		medicamento_idMedicamento
	ORDER BY
		cuenta DESC 
        LIMIT 1) AS tabla 
        
	NATURAL JOIN medicamento;

