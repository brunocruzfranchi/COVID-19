/*
16) Mostrar los hospitales que tienen el 65% de las camas normales ocupadas. 
Indicar cuantas camas tienen desocupadas. Ademas, indicar cuantos pacientes fueron
internados en el ultimo mes (Para poder planear con un mes de anticipacion).
*/ 

-- Aquí, WITH funciona perfectamente

-- la primera tabla es la lista de aquellos hospitalos donde el 65% o mas de las camas 
-- esta ocupada. Muestra tanto las camas totales del hospital como las camas disponibles.
-- En la segunda tabla, se aprecia la lista completa de hospitales, junto a la cantidad
-- de pacientes que fueron aceptados en el ultimo mes 

WITH Tabla AS(
SELECT *
FROM(	-- Uno la lista de cantidad de camas por hospital junto a la tabla hospital, donde
		-- la informacion restante de los hospitales, como su nombre
 	SELECT Nombre_Hospital AS Hospital, Camas_Disponibles
	FROM( -- Proyecto las camas disponibles por cada hospital
		SELECT hospital_NroHospital AS NroHospital, count(NroCama) AS Camas_Disponibles
		FROM camas
		GROUP BY hospital_NroHospital) AS A
		INNER JOIN hospital ON hospital.NroHospital = A.NroHospital) AS B

-- Como ambas tablas son de 20 filas (todos los hospitales) puedo hacer un NATURAL JOIN
NATURAL JOIN

( -- Proyecto las camas utilizadas por cada hospital
SELECT Nombre_Hospital AS Hospital, count(NroCama) AS Camas_Utilizadas
FROM(
	SELECT NroCama, Internado_Personas_DNI AS DNI
	FROM camas
		INNER JOIN paciente_cama ON camas.NroCama = paciente_cama.Camas_NroCama) AS C
	INNER JOIN paciente_hospital ON paciente_hospital.Internado_Personas_DNI = C.DNI
    INNER JOIN hospital ON hospital.NroHospital = paciente_hospital.Hospital_NroHospital
GROUP BY Hospital_NroHospital) AS D)


SELECT Hospital, Camas_Disponibles AS Camas_Totales, Camas_Disponibles - Camas_Utilizadas AS Camas_Disponibles
FROM Tabla
WHERE Camas_Utilizadas / Camas_Disponibles >= 0.65 
	AND Camas_Utilizadas / Camas_Disponibles < 1;
    
-- Aquí creo la segunda tabla
SELECT Hospital, count(Hospital) AS Cuenta
FROM(
	SELECT Nombre_Hospital AS Hospital, Dia_de_Ingreso
	FROM PacienteInternado
		INNER JOIN pacientes ON pacientes.Personas_DNI = pacienteinternado.Internado_Personas_DNI
		INNER JOIN paciente_hospital ON paciente_hospital.Internado_Personas_DNI = pacientes.Personas_DNI
		INNER JOIN hospital ON hospital.NroHospital = paciente_hospital.hospital_NroHospital) AS A
WHERE month(Dia_de_Ingreso) = month(now())
GROUP BY hospital;


