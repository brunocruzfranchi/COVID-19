/*
19) Mostrar, para cada hospital, aquellos suministros que están agotados/próximos a agotarse. 
Las características deben ser que, el el almacen del hospital, hay menos suministros que el 
total de pacientes
*/


-- La tabla muestra tanto la cantidad de pacientes, como la cantidad de cada suministro disponible,
-- siempre y cuanto dicha cantidad sea menor a la primero.
WITH Tabla AS(

SELECT *
FROM(	-- Uno las tablas correspondientes a los suministros totales de cada hospital (Almacen_Hospital)
		-- junto a la tabla hospital, donde tengo guardado el nombre de cada uno de ellos
	SELECT Nombre_Hospital AS HospitalB, CodigoSuministro, Cant_TotalSum AS Cant_Suministro
	FROM almacen_hospital
		INNER JOIN hospital ON hospital.NroHospital = almacen_hospital.NroHospital) AS B

	-- Uno la primera parte, donde tengo la cantidad total de suministros por hospital,
    -- junto a la segunda parte donde tengo la cantidad total de pacientes.
    -- podria usar un NATURAL JOIN
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
FROM(	-- Uno la Tabla a la tabla suministros, para asi tener el nombre de ellos (en contraparte del id)
	SELECT HospitalB AS Hospital, Nombre, Cant_Pacientes, Cant_Suministro
	FROM Tabla
		INNER JOIN suministros ON suministros.CodigoSuministro = Tabla.CodigoSuministro) AS A
WHERE Cant_Suministro < Cant_Pacientes; -- Me fijo que hospitales caen en la categoria requerida en la consulta

