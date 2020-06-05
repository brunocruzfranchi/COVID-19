
SELECT 
	Medicamento, count(Medicamento) AS Cuenta
FROM 
	medicamentos
GROUP BY
	Medicamento
ORDER BY
	Cuenta DESC
LIMIT 1;
