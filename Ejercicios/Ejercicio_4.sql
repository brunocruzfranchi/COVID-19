/* 
4) Encontrar la fecha en la que hubo mayor cantidad de muertos y mostrar los nombres
de enfermeros y enfermeras que trabajaron ese día.
*/ 

SELECT count(*) cant FROM (
SELECT * FROM(
SELECT Internado_Personas_DNI FROM pacienteinternado where CheckOut='Fallecido') AS t1
inner join (SELECT * FROM salida_paciente) as t2
ON t1.Internado_Personas_DNI = t2.pacienteinternado_Internado_Personas_DNI)
group by date(FH_Salida)

-- Select count(*) cant from Salidas group by FH_Salida