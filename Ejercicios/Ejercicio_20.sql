/*
20) Listar todos los pacientes positivos que sean menores de edad. Listar los valores de la 
muestra y cuando fue tomada esta, ademas del estado evolutivo. En una tabla adicional mostrar,
mes por mes, cuantos menores de edad dieron positivo.
*/

SELECT * 
FROM (
	SELECT Apellido, Nombre, year(CURDATE())-year(personas.F_Nacimiento) AS Edad, SatO2, Temperatura, EstadoEvolutivo
	FROM(	
		SELECT Personas_DNI, Resultado, SatO2, Temperatura
		FROM pacientes
			INNER JOIN muestra_paciente ON muestra_paciente.pacientes_Personas_DNI = pacientes.Personas_DNI
			INNER JOIN muestra ON muestra.NroTesteo = muestra_paciente.muestra_NroTesteo
		WHERE Resultado = 1) AS A
		INNER JOIN personas ON personas.DNI = A.Personas_DNI
		INNER JOIN pacienteinternado ON pacienteinternado.Internado_Personas_DNI = A.Personas_DNI
		) AS B
WHERE Edad <= 18;

SELECT Nombre_Hospital AS Hospital, monthname(Dia_de_Ingreso) AS Mes, count(monthname(Dia_de_Ingreso)) AS Cantidad
FROM(
	SELECT Hospital_NroHospital AS Hospital, Dia_de_Ingreso
	FROM(
		SELECT B.DNI, year(CURDATE())-year(personas.F_Nacimiento) AS Edad, Dia_de_Ingreso
		FROM(
			SELECT pacientes_Personas_DNI AS DNI, Dia_de_Ingreso
			FROM(
				SELECT NroTesteo
				FROM muestra
				WHERE Resultado = 1) AS A
				INNER JOIN muestra_paciente ON muestra_paciente.muestra_NroTesteo = A.NroTesteo
				INNER JOIN pacientes ON pacientes.Personas_DNI = muestra_paciente.pacientes_Personas_DNI) AS B
			INNER JOIN personas ON personas.DNI = B.DNI) AS C
		INNER JOIN paciente_hospital ON paciente_hospital.Internado_Personas_DNI = C.DNI
	WHERE Edad <= 18) AS D
	INNER JOIN hospital ON hospital.NroHospital = D.Hospital
GROUP BY Mes, Hospital
ORDER BY Hospital, Mes;
