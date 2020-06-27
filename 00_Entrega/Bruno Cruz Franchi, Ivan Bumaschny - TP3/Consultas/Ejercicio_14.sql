/*
14) Mostrar, por cada hospital, cuantos suministros fueron utilizados un 40% más de 
lo que se repusieron en el ultimo mes.
*/

WITH Tabla AS(	

SELECT *
FROM(
	SELECT Nombre_Hospital AS Hospital1, Suministro1, Cant_utilizada
	FROM(	-- Primero, para poder comparar la cantidad de suministros utilizada en el ultimo mes con
			-- la cantidad pedida, tomo la cantidad utilizada (luego la pedida)
		SELECT personalmedico_Empleados_Personas_DNI AS DNI, suministros_CodigoSuministro AS Suministro1, Cant_utilizada
		FROM utilizacion_suministro	-- Aqui, en esta tabla, tengo guardada la informacion de cada vez que un medico
									-- utilizo suministros.
		WHERE month(date(utilizacion_suministro.Fecha_Hora)) = month(now())) AS A -- Solo tomo aquellos de este ultimo mes
		-- INNER JOIN con la tabla donde tenemos la informacion de que empleados trabajan en cada hospital.
        -- INNER JOIN con la tabla hospital, para tener el nombre de estos.
        INNER JOIN empleado_hospital ON empleado_hospital.empleados_Personas_DNI = A.DNI
		INNER JOIN hospital ON hospital.NroHospital = empleado_hospital.hospital_NroHospital) AS C

LEFT OUTER JOIN

(	-- Tabla donde tengo cada suministro repuesto este mes, junto al hospital donde fueron enviados
SELECT Nombre_Hospital AS Hospital2, Suministro2, sum(Cant_Repuesto) AS Cant_Repuesta
FROM(	-- Segundo, me fijo los suministros repuestos este mes.
	SELECT PersonalMedico_Empleados_Personas_DNI AS DNI, Suministros_CodigoSuministro AS Suministro2, Cant_Repuesto
	FROM pm_suministros
	WHERE month(date(pm_suministros.FH_Entrega)) = month(now())) AS B
	-- INNER JOIN con la tabla donde tenemos la informacion de que empleados trabajan en cada hospital.
	-- INNER JOIN con la tabla hospital, para tener el nombre de estos.
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
		Hospital1 IS NOT NULL AND -- hago esto, ya que al usar un LEFT OUTER JOIN, las casillas que no correspondan tendran un NULL
		suministro1 IS NOT NULL AND	-- Lo mismo con las 4 condiciones
		Hospital2 IS NOT NULL AND
		suministro2 IS NOT NULL) AS E
WHERE Cant_utilizada/Cant_Repuesta >= 1.4 -- Aqui, elijo cual es el umbral. Como la consigna dice 40%, debe superar 1.4.
GROUP BY Hospital, Suministros;


















