/* 
4) Encontrar la fecha en la que hubo mayor cantidad de muertos y mostrar los nombres
de enfermeros y enfermeras que trabajaron ese día.
*/ 


SELECT @dia_muertos :=  weekday(Fecha) FROM (SELECT dayname(FH_Salida) AS Dia, date(FH_Salida) AS Fecha , count(*) Muertes FROM (
SELECT * FROM(
SELECT Internado_Personas_DNI 
	FROM pacienteinternado 
	WHERE CheckOut='Fallecido') AS t1
INNER JOIN 
(SELECT * FROM salida_paciente) as t2
ON t1.Internado_Personas_DNI = t2.pacienteinternado_Internado_Personas_DNI) as t
GROUP by dayname(FH_Salida) 
ORDER BY Muertes DESC
LIMIT 1,1) as t4;


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