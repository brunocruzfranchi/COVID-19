/*
10) De lo obtenido en el punto anterior, listar los que dieron positivo junto con su grupo
de convivientes (a fin ser alertados y puestos en cuarentena). También listar los
profesionales que trabajan en el mismo departamento para testearlos y decidir si
ponerlos en cuarentena
*/

-- Aquí tomo la vista del ejercicio 9, donde los empleados junto a su muestra(de informacion 
-- de fecha de testeo y resultado) y la filtro para tener solo los resultados positivos
-- (resultado = 1). Luego, Me fijo los convivientes de el empleado (para ello, necesito
-- juntarlo con la informacion del empleado guardada en personas)
SELECT Fecha_Muestra, Apellido, personas.Nombre, TelParticular, convivientes.Nombre
FROM t1 
	INNER JOIN personas ON t1.empleados_personas_DNI = personas.DNI
    INNER JOIN convivientes ON t1.empleados_personas_DNI = convivientes.Personas_DNI
where resultado = 1;


-- La segunda parte del ejercicio, donde busco aquellos empleados que trabajan en
-- el mismo departamento que los testeados con resultado positivos
SELECT Departamento, Empleados_Personas_DNI AS DNI, Apellido, Nombre
FROM(	-- tomo los empleados del departamento de aquellas personas de la tabla t1, o
		-- sea, todos los empleados con el resultado de su test. Solo me interesa el
        -- departamento, asi que solo proyecto eso.
	SELECT Departamento_NroDepartamento AS Departamento
	FROM t1 
		INNER JOIN empleado_departamento ON t1.empleados_personas_DNI = empleado_departamento.empleados_personas_DNI
	WHERE Resultado = 1 -- Aquellos que dieron positivo
	GROUP BY Departamento) AS A
		-- Como me interesan los datos de los empleados de los departamentos obtenidos previamente,
        -- hago dos INNER JOIN para obtener aquellos empleados, junto a la informacion de ellos
    INNER JOIN empleado_departamento ON A.Departamento = empleado_departamento.Departamento_NroDepartamento
    INNER JOIN Personas ON empleado_departamento.Empleados_Personas_DNI = Personas.DNI;
