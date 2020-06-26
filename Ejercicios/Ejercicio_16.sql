/*
16) Mostrar los hospitales que tienen el 65% de las camas normales ocupadas. 
Indicar cuantas camas tienen desocupadas. Ademas, indicar cuantos pacientes fueron
internados en el ultimo mes (Para poder planear con un mes de anticipacion) ademas 
la cantidad de camas totales
*/ 

WITH Tabla AS(

SELECT *
FROM(
	SELECT Nombre_Hospital AS Hospital, Camas_Disponibles
	FROM(
		SELECT Hospital_NroHospital AS NroCama, count(Camas_NroCama) AS Camas_Disponibles
		FROM camas_hospital
		GROUP BY Hospital_NroHospital) AS A
		INNER JOIN hospital ON hospital.NroHospital = A.NroCama) AS B

NATURAL JOIN

(
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
WHERE Camas_Utilizadas / Camas_Disponibles >= 0.9 
	AND Camas_Utilizadas / Camas_Disponibles < 1;
    
SELECT Hospital, count(Hospital) AS Cuenta
FROM(
	SELECT Nombre_Hospital AS Hospital, Dia_de_Ingreso
	FROM PacienteInternado
		INNER JOIN pacientes ON pacientes.Personas_DNI = pacienteinternado.Internado_Personas_DNI
		INNER JOIN paciente_hospital ON paciente_hospital.Internado_Personas_DNI = pacientes.Personas_DNI
		INNER JOIN hospital ON hospital.NroHospital = paciente_hospital.hospital_NroHospital) AS A
WHERE month(Dia_de_Ingreso) = month(now())
GROUP BY hospital;


