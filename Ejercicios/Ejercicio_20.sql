/*
20) Listar todos los pacientes positivos que sean menores de edad. Listar los valores de la 
muestra y cuando fue tomada esta, ademas del estado evolutivo. En una tabla adicional mostrar,
mes por mes, cuantos menores de edad dieron positivo.
*/


-- No parece muy relevante, pero si la base de datos fuera real, los numeros tambien lo serian.
-- Lo importante es que funciona :)
SELECT * 
FROM (	-- Completo la informacion del paciente, dandole el nombre, apellido y edad. Solo tomo aquellos menores a 18 años
	SELECT Apellido, Nombre, year(CURDATE())-year(personas.F_Nacimiento) AS Edad, SatO2, Temperatura, EstadoEvolutivo
	FROM(	-- Uno las tablas muestra_paciente y muestra. En la primera tengo el DNI y el id de la muestra. En la segunda, 
			-- la Sat02, temperatura y resultado.
		SELECT pacientes_Personas_DNI, Resultado, SatO2, Temperatura
		FROM muestra_paciente
			INNER JOIN muestra ON muestra.NroTesteo = muestra_paciente.muestra_NroTesteo
		WHERE Resultado = 1) AS A	-- Filtro solo los que dieron positivo (Resultado = 1)
		INNER JOIN personas ON personas.DNI = A.pacientes_Personas_DNI
        -- El segundo join lo hago para obtener el estado
		INNER JOIN pacienteinternado ON pacienteinternado.Internado_Personas_DNI = A.pacientes_Personas_DNI) AS B
WHERE Edad <= 18;


-- En esta tabla hago la segunda parte del ejercicio
SELECT Nombre_Hospital AS Hospital, monthname(Dia_de_Ingreso) AS Mes, count(monthname(Dia_de_Ingreso)) AS Cantidad
FROM(	-- Una vez filtrado los menores de edad, me fijo en que hospitales estan postrados. Asi, puedo contar la cantidad
		-- de contagiados por hospital
	SELECT Hospital_NroHospital AS Hospital, Dia_de_Ingreso
	FROM(	-- Lo uno a personas. Así, como antes, obtengo la edad para filtrar a los menores de 18
		SELECT B.DNI, year(CURDATE())-year(personas.F_Nacimiento) AS Edad, Dia_de_Ingreso
		FROM(	-- Junto cada test positivo con la persona que fue testeada. Así, puedo obtener el dia
				-- en el que fue testeado. Una vez hecho eso, puedo filtrar los que fueron testeados el
                -- por cada mes
			SELECT pacientes_Personas_DNI AS DNI, Dia_de_Ingreso
			FROM(	-- Aquellos tests que dieron positivo
				SELECT NroTesteo
				FROM muestra
				WHERE Resultado = 1) AS A
				INNER JOIN muestra_paciente ON muestra_paciente.muestra_NroTesteo = A.NroTesteo
				INNER JOIN pacientes ON pacientes.Personas_DNI = muestra_paciente.pacientes_Personas_DNI) AS B
			INNER JOIN personas ON personas.DNI = B.DNI) AS C
		INNER JOIN paciente_hospital ON paciente_hospital.Internado_Personas_DNI = C.DNI
	WHERE Edad <= 18) AS D
	INNER JOIN hospital ON hospital.NroHospital = D.Hospital
GROUP BY Mes, Hospital	-- Como me interesa la informacion separada por hospital, los agrupo por hospital. 
						-- Como me interesa la informacion separada por mes, los agrupo por mes
ORDER BY Hospital, Mes;
