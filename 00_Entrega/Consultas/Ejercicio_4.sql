/* 
4) Encontrar la fecha en la que hubo mayor cantidad de muertos y mostrar los nombres
de enfermeros y enfermeras que trabajaron ese día.
*/ 

/*
En esta primer parte el objetivo es obtener el dia que ocurrio la mayor cantidad de muertos. Este dato luego es 
almacenado en una variable denominada "dia_muertos" en forma de un entero de 0 a 6 indicando el dia de la semana 
que hubo la mayor cantidad de muerte.
Este dato luego lo voy a utilizar para determinar que datos traer de la tabla Horario correspondiente a los 
empleados que trabajaron con este fecha correspondiente.
*/

SELECT @dia_muertos:= weekday(Fecha) FROM 
(SELECT dayname(FH_Salida) AS Dia, date(FH_Salida) AS Fecha , count(*) Muertes 
FROM (
	SELECT * FROM (
	SELECT Internado_Personas_DNI 
		FROM pacienteinternado 
		WHERE CheckOut='Fallecido') AS t1
	INNER JOIN salida_paciente
	ON t1.Internado_Personas_DNI = salida_paciente.pacienteinternado_Internado_Personas_DNI) as t
GROUP by dayname(FH_Salida) 
ORDER BY Muertes DESC
LIMIT 1) as t4;	-- LIMIT 1 me va a traer el primer dato de la tabla obtenida, tambien podria haber utilizado MAX en el ultimo SELECT

/*
Aqui lo que se esta haciendo es lo siguiente:
	En la parte de SELECT se trae todos los datos de los horario de todos los empleados, sin embargo, utilizo CASE 
    determinar que datos traer de acuerdo al dia obtenido. Esto se hace a partir de  la condicion de @dia_muertos=NrodeDia 
    ya que al cumplirse dicha condicion me permite traer los datos contenidos en esa columnas miestras que 
    el resto al no cumplir la condicion voy a obtener uplas en NULL
    
    Por ultimo, en la parte del WHERE el objetivo es eliminar a aquellas personas que no trabajen en el dia
    determinado. Esto se puede determinar ya que en los dias en los que el empleado no trabaja se 
    tiene un NULL, y es con este dato que yo al decir "WHEN @dia_muertos = 2 THEN horario.Miercoles IS NOT NULL"
    voy a traer unicamente los dato no nulos en la upla de la columna determinada.
*/

SELECT DNI as Empleados FROM (
SELECT 
	CASE WHEN @dia_muertos = 0 THEN horario.Lunes END AS Lunes,
	CASE WHEN @dia_muertos = 1 THEN horario.Martes END AS Martes,
    CASE WHEN @dia_muertos = 2 THEN horario.Miercoles END AS Miercoles,
    CASE WHEN @dia_muertos = 3 THEN horario.Jueves END AS Jueves,
    CASE WHEN @dia_muertos = 4 THEN horario.Viernes END AS Viernes,
    CASE WHEN @dia_muertos = 5 THEN horario.Sabado END AS Sabado,
    CASE WHEN @dia_muertos = 6 THEN horario.Domingo END AS Domingo,
    PersonalMedico_Empleados_Personas_DNI as 'DNI'
FROM horario
	WHERE (
	CASE WHEN @dia_muertos = 0 THEN horario.Lunes IS NOT NULL
		 WHEN @dia_muertos = 1 THEN horario.Martes  IS NOT NULL
		 WHEN @dia_muertos = 2 THEN horario.Miercoles  IS NOT NULL 
		 WHEN @dia_muertos = 3 THEN horario.Jueves  IS NOT NULL 
		 WHEN @dia_muertos = 4 THEN horario.Viernes  IS NOT NULL
		 WHEN @dia_muertos = 5 THEN horario.Sabado  IS NOT NULL
		 WHEN @dia_muertos = 6 THEN horario.Domingo  IS NOT NULL
    END
	) 
) as EMP;