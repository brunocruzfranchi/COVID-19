/*
14) Mostrar, por cada hospital, cuantos suministros fueron utilizados un 40% más de 
lo que se repusieron en el ultimo mes.
*/

WITH Tabla AS(

SELECT *
FROM(
	SELECT Nombre_Hospital AS Hospital1, Suministro1, Cant_utilizada
	FROM(SELECT personalmedico_Empleados_Personas_DNI AS DNI, suministros_CodigoSuministro AS Suministro1, Cant_utilizada
		FROM utilizacion_suministro
		WHERE month(date(utilizacion_suministro.Fecha_Hora)) = @MesActual) AS A
		INNER JOIN empleado_hospital ON empleado_hospital.empleados_Personas_DNI = A.DNI
		INNER JOIN hospital ON hospital.NroHospital = empleado_hospital.hospital_NroHospital) AS C

LEFT OUTER JOIN

(
SELECT Nombre_Hospital AS Hospital2, Suministro2, sum(Cant_Repuesto) AS Cant_Repuesta
FROM(
	SELECT PersonalMedico_Empleados_Personas_DNI AS DNI, Suministros_CodigoSuministro AS Suministro2, Cant_Repuesto
	FROM pm_suministros
	WHERE month(date(pm_suministros.FH_Entrega)) = @MesActual) AS B
	INNER JOIN empleado_hospital ON empleado_hospital.empleados_Personas_DNI = b.DNI
	INNER JOIN hospital ON hospital.NroHospital = empleado_hospital.hospital_NroHospital
GROUP BY Hospital2, Suministro2
) AS D

ON C.Hospital1 = D.Hospital2 AND C.Suministro1 = D.Suministro2)

SELECT Hospital1 AS Hospital, Suministro1 AS Suministros, Cant_utilizada, Cant_Repuesta
FROM(
	SELECT *
	FROM tabla
	WHERE
		Hospital1 IS NOT NULL AND
		suministro1 IS NOT NULL AND
		Hospital2 IS NOT NULL AND
		suministro2 IS NOT NULL) AS E
WHERE Cant_utilizada/Cant_Repuesta >= 1.4
GROUP BY Hospital, Suministros;


















