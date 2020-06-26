/*
10) De lo obtenido en el punto anterior, listar los que dieron positivo junto con su grupo
de convivientes (a fin ser alertados y puestos en cuarentena). También listar los
profesionales que trabajan en el mismo departamento para testearlos y decidir si
ponerlos en cuarentena
*/

SELECT Fecha_Muestra, Apellido, personas.Nombre, TelParticular, convivientes.Nombre
FROM t1 
	INNER JOIN personas ON t1.empleados_personas_DNI = personas.DNI
    INNER JOIN convivientes ON t1.empleados_personas_DNI = convivientes.Personas_DNI
where resultado = 1;

SELECT Departamento, Empleados_Personas_DNI AS DNI, Apellido, Nombre
FROM(
	SELECT Departamento_NroDepartamento AS Departamento
	FROM t1 
		INNER JOIN empleado_departamento ON t1.empleados_personas_DNI = empleado_departamento.empleados_personas_DNI
	WHERE Resultado = 1
	GROUP BY Departamento) AS A
    INNER JOIN empleado_departamento ON A.Departamento = empleado_departamento.Departamento_NroDepartamento
    INNER JOIN Personas ON empleado_departamento.Empleados_Personas_DNI = Personas.DNI;
