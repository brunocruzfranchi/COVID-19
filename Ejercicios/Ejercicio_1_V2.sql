/* 
1) Mostrar el total de infectados, activos, recuperados y muertos en CABA, desde que
comenzó a registrarse los datos de la pandemia, en marzo de 2020, mes a mes. 
*/

DROP VIEW IF EXISTS Datos;

CREATE VIEW Datos AS (
SELECT Persona_DNI, Dia_de_Ingreso, CheckOut, FH_Salida, Resultado, Localidad
    FROM (SELECT NroTesteo, pacientes_Personas_DNI as Persona_DNI, Resultado					-- Aca obtengo los datos de los pacientes que dieron
	FROM muestra NATURAL JOIN (																	-- Covid positivo. Esta tabla nos dio de un n=1324
	SELECT muestra_NroTesteo as NroTesteo, pacientes_Personas_DNI FROM muestra_paciente) AS A	-- 
	WHERE Resultado = 1) as t1
    LEFT JOIN
    (SELECT * FROM pacientes													    -- Obtener las fechas de testeo de los pacientes
		LEFT JOIN pacienteinternado													-- tanto de los que se encuentran en domicilio como de los internados. 
		ON pacientes.Personas_DNI = pacienteinternado.Internado_Personas_DNI) as t2	-- A la vez obtengo los datos del CheckOut para despues usarlo. n=3900
        ON t1.Persona_DNI = t2.Personas_DNI
	LEFT JOIN
		salida_paciente
        on t2.Personas_DNI = salida_paciente.pacienteinternado_Internado_Personas_DNI
	INNER JOIN
		(SELECT * FROM domicilio WHERE Localidad = 'CABA') as t3
        ON t2.Personas_DNI = t3.personas_DNI) ;

-- Lo que se va a multiples inner joins para poder crear una tabla con todos los datos obtenidos anteriormente

SELECT D1.MESES, ACTIVOS, RECUPERADOS, FALLECIDOS, INFECTADOS 
FROM (
SELECT MONTHNAME(t1.Dia_de_Ingreso) AS MESES, ACTIVOS, INFECTADOS
  FROM
  (SELECT Dia_de_Ingreso, count(*) Activos 		-- Obtengo el valor total de activos agrupados por mes, a partir del dato de CheckOut = Null. Esto lo que me indica es que sigue internado
	FROM Datos 
	WHERE CheckOut IS NULL GROUP BY MONTH(Dia_de_Ingreso)) AS t1 
  
  INNER JOIN 
  (SELECT Dia_de_Ingreso, count(*) Infectados 	-- Obtengo el valor total de infectados agrupados por mes, obtengo este dato de la tabla anteriormente creada
	FROM Datos GROUP BY MONTH(Dia_de_Ingreso)) AS t2 
    ON MONTH(t1.Dia_de_Ingreso) = MONTH(t2.Dia_de_Ingreso)
ORDER BY t1.Dia_de_Ingreso ASC) as D1

LEFT OUTER JOIN (

SELECT MONTHNAME(t3.FH_Salida) AS MESES, RECUPERADOS, FALLECIDOS
  FROM 
  (SELECT FH_Salida, count(*) Recuperados 	-- Obtengo el valor total de recuperados agrupados por mes a partir del dato de CheckOut = Recuperado
	FROM Datos 
	WHERE CheckOut='Alta' GROUP BY MONTH(FH_Salida)) AS t3 
  
  INNER JOIN 
  (SELECT FH_Salida, count(*) Fallecidos 	-- Obtengo el valor total de fallecidos agrupados por mes a partir del dato de CheckOut = Fallecido
	FROM Datos 
	WHERE CheckOut='Fallecido' GROUP BY MONTH(FH_Salida)) AS t4 
    ON MONTH(t3.FH_Salida) = MONTH(t4.FH_Salida)
  ORDER BY t3.FH_Salida ASC) as D2
  ON D1.MESES = D2.MESES
  ORDER BY MESES ASC
  