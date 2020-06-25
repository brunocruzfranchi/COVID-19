/*
5) Encontrar si hay suministros específicos que se pagaron más caro en un hospital que
en otro. Mostrar DNI, nombre y apellido del médico que los solicitó y todos los datos
del proveedor.
*/

DROP VIEW IF EXISTS t1; -- Lista aquellos pedidos del mismo suministro, con el costo unitario
DROP VIEW IF EXISTS t2; -- Junta las tablas empleados y personas
DROP VIEW IF EXISTS t3; -- cambio de nombre de las variables de la tabla proveedores para un NATURAL JOIN

CREATE VIEW t1 AS( 
	SELECT
		CodigoSuministro AS Codigo, Precio_Unidad, Empleados_Personas_DNI AS DNI, Nombre AS Suministro
	FROM
		(SELECT
			Suministros_CodigoSuministro AS CodigoSuministro, ROUND(PrecioPagado / Cant_Repuesto, 2) AS Precio_Unidad,
			PersonalMedico_Empleados_Personas_DNI AS Empleados_Personas_DNI
		FROM
			pm_suministros JOIN(
			SELECT 
				Suministros_CodigoSuministro AS Codigo, count(Suministros_CodigoSuministro) AS cont
			FROM
				pm_suministros
			GROUP BY 
				Codigo
			HAVING
				cont > 1) AS A
			ON pm_suministros.Suministros_CodigoSuministro = A.Codigo) AS B
			NATURAL JOIN suministros);

CREATE VIEW t2 AS(
	SELECT
		dni, nombre, apellido, empleado_hospital.hospital_NroHospital AS hospital
	FROM
		personas NATURAL JOIN empleado_hospital
	WHERE
		empleados_Personas_DNI = DNI);
        		
CREATE VIEW t3 AS(
	SELECT
		Proveedores_NroProveedores AS NroProveedores, Suministros_CodigoSuministro AS Codigo, Nombre AS Proveedor, Telefono, Direccion, Mail
	FROM 
		covid19.proveedores_suministros NATURAL JOIN proveedores
	WHERE
		proveedores_suministros.Proveedores_NroProveedores = NroProveedores);

SELECT 
	DNI, Nombre, Apellido, hospital.Nombre_Hospital AS hospital, suministro, Precio_Unidad, Proveedor, Telefono, direccion, mail
FROM 
	T1 NATURAL JOIN T3
		NATURAL JOIN T2
        INNER JOIN hospital ON hospital.NroHospital = t2.hospital;
        
