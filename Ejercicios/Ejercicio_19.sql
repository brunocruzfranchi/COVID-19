/*
19) Mostrar, para cada hospital, aquellos suministros que están agotados/próximos a agotarse. 
Las características deben ser que, el el almacen del hospital, hay menos suministros que el 
total de pacientes
*/

WITH Tabla AS(

SELECT *
FROM(
	SELECT Nombre_Hospital AS HospitalB, CodigoSuministro, Cant_TotalSum AS Cant_Suministro
	FROM almacen_hospital
		INNER JOIN hospital ON hospital.NroHospital = almacen_hospital.NroHospital) AS B

INNER JOIN

(
	SELECT Nombre_Hospital AS HospitalC, Cant_Pacientes
	FROM(
		SELECT Hospital_NroHospital AS NroHospital, count(Internado_Personas_DNI) AS Cant_Pacientes
		FROM paciente_hospital
		GROUP BY NroHospital) AS A
		INNER JOIN hospital ON hospital.NroHospital = A.NroHospital) AS C
    
ON B.HospitalB = C.HospitalC)

SELECT *
FROM(
	SELECT HospitalB AS Hospital, Nombre, Cant_Pacientes, Cant_Suministro
	FROM Tabla
		INNER JOIN suministros ON suministros.CodigoSuministro = Tabla.CodigoSuministro) AS A
WHERE Cant_Suministro < Cant_Pacientes;

