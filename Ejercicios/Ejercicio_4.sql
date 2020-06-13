/* 
4) Encontrar la fecha en la que hubo mayor cantidad de muertos y mostrar los nombres
de enfermeros y enfermeras que trabajaron ese día.
*/ 

SELECT dayname(FH_Salida) AS Dia, date(FH_Salida) AS Fecha , count(*) Muertes FROM (
SELECT * FROM(
SELECT Internado_Personas_DNI 
	FROM pacienteinternado 
	WHERE CheckOut='Fallecido') AS t1
inner join 
(SELECT * FROM salida_paciente) as t2
ON t1.Internado_Personas_DNI = t2.pacienteinternado_Internado_Personas_DNI) as t
GROUP by dayname(FH_Salida) 
ORDER BY Muertes DESC
LIMIT 1; 

-- Select count(*) cant from Salidas group by FH_Salida