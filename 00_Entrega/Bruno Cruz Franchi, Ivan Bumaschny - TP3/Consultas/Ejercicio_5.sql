/*
5) Encontrar si hay suministros específicos que se pagaron más caro en un hospital que
en otro. Mostrar DNI, nombre y apellido del médico que los solicitó y todos los datos
del proveedor.
*/

-- Cabe destacar que hubiera preferido usar WITH pero, por algun motivo que nunca logre comprender,
-- a veces me dejaba y a veces no. De todos modos, con vistas funciona.

DROP VIEW IF EXISTS t1; -- Lista aquellos pedidos del mismo suministro, con el costo unitario
DROP VIEW IF EXISTS t2; -- Junta las tablas empleados y personas
DROP VIEW IF EXISTS t3; -- cambio de nombre de las variables de la tabla proveedores para un NATURAL JOIN

CREATE VIEW t1 AS(	-- Uno la tabla junto a la tabla "suministros, donde tengo el resto de la informacion de
					-- importancia para el ejercicio
	SELECT
		CodigoSuministro AS Codigo, Precio_Unidad, Empleados_Personas_DNI AS DNI, Nombre AS Suministro
	FROM
		(SELECT -- De aquellos suministros que fueron pedidos mas de una vez, me fijo quienes los pidieron, y
				-- cuanto pagaron la unidad (Precio_unitario del suministro) en el pedido
			Suministros_CodigoSuministro AS CodigoSuministro, ROUND(PrecioPagado / Cant_Repuesto, 2) AS Precio_Unidad,
			PersonalMedico_Empleados_Personas_DNI AS Empleados_Personas_DNI
		FROM
			pm_suministros JOIN(
			SELECT -- Selecciono cuantos suministros fueron pedidos mas de una vez, y cuento cuantas veces.
				Suministros_CodigoSuministro AS Codigo, count(Suministros_CodigoSuministro) AS cont
			FROM
				pm_suministros
			GROUP BY 
				Codigo
			HAVING
				cont > 1) AS A
			ON pm_suministros.Suministros_CodigoSuministro = A.Codigo) AS B
			NATURAL JOIN suministros);

CREATE VIEW t2 AS(	-- Aque junto la informacion de los empleados con la guardada en la tabla personas.
					-- Luego, la junto con la tabla t1 (la anterior) para tener los datos de aquellos medicos
					-- que solicitaron suministros por mayor precio
	SELECT
		dni, nombre, apellido, empleado_hospital.hospital_NroHospital AS hospital
	FROM
		personas NATURAL JOIN empleado_hospital
	WHERE
		empleados_Personas_DNI = DNI);
        		
CREATE VIEW t3 AS(	-- Junto la informacion completa de los proveedores con el suministro que proveen
	SELECT
		Proveedores_NroProveedores AS NroProveedores, Suministros_CodigoSuministro AS Codigo, Nombre AS Proveedor, Telefono, Direccion, Mail
	FROM 
		covid19.proveedores_suministros NATURAL JOIN proveedores
	WHERE
		proveedores_suministros.Proveedores_NroProveedores = NroProveedores);

-- Junto toda la informacion de las 3 tablas y proyecto de la manera optima para realizar el ejercicio
SELECT 
	DNI, Nombre, Apellido, hospital.Nombre_Hospital AS hospital, suministro, Precio_Unidad, Proveedor, Telefono, direccion, mail
FROM 
	T1 NATURAL JOIN T3
		NATURAL JOIN T2
        INNER JOIN hospital ON hospital.NroHospital = t2.hospital;
        
