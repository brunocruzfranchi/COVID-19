/*
19) Mostrar, para cada hospital, aquellos suministros que están agotados/próximos a agotarse. 
Las características deben ser: menos del 20% del total de pacientes del hospital (osea, solo 2
de cada 10 pacientes podran recibir el suministro), el ultimo mes se hayan consumido mas del 50%  
del suministro) del almacén y/o no haya proveedores que brinden dicho suministro (o cualquier 
combinación de estas)
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

SELECT HospitalB AS Hospital, Nombre, Cant_Pacientes, Cant_Suministro
FROM Tabla
	INNER JOIN suministros ON suministros.CodigoSuministro = Tabla.CodigoSuministro;
    
