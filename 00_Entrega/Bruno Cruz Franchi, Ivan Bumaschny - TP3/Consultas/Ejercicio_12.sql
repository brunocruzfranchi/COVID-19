/*
12)	Mostrar el porcentaje de la gente infectada con COVID que posee una cobertura médica junto al porcentaje de personas que no. 
Además, determinar la cantidad de asociados a cada una de las obras social existente. 
*/

DROP VIEW Personas_Infectadas;

CREATE VIEW Personas_Infectadas AS
(SELECT pacientes_Personas_DNI as 'DNI', Resultado FROM (SELECT * FROM Muestra WHERE Resultado = 1) as t3   -- Aqui obtengo los DNI de los pacientes que poseen 
INNER JOIN muestra_paciente                                                                                 -- la muestra de COVID positivo
ON t3.NroTesteo = muestra_paciente.muestra_NroTesteo                                                        -- 
UNION                                                                                                       -- El objetivo de este Union es obtener una tabla continua con todos los DNI y sus Resultados
SELECT DISTINCT empleados_Personas_DNI as 'DNI' , Resultado FROM (                                          -- 
SELECT * FROM (SELECT * FROM muestra_emp_covid WHERE Resultado = 1) AS t1                                   -- Aqui se obtiene los DNI de los empleados que 
INNER JOIN muestra_empleados                                                                                -- tiene positivo para Covid
ON t1.NroTesteo = muestra_empleados.muestra_emp_covid_NroTesteo) AS t2);                                    -- 

SELECT Empresa, Cantidad                                                                                    -- Una vez obtenidos los DNI de aquellas personas con COVID positivo
FROM                                                                                                        -- obtengo en esta seccion la cantidad de personas asociadas
    (SELECT ObraSocial_idPlanMedico AS idPlanMedico,COUNT(ObraSocial_idPlanMedico) AS Cantidad              -- a cada una de las Obras Sociales
    FROM (SELECT * FROM Personas_Infectadas) AS t1                                                          -- 
    INNER JOIN obrasocial_persona ON obrasocial_persona.Personas_DNI = t1.DNI
    GROUP BY ObraSocial_idPlanMedico) AS Cant_personas
        NATURAL JOIN
    obrasocial;

SELECT @Total:=count(*) as Total FROM Personas_Infectadas;                                                  -- Creo una variable con el total de los pacientes positivos para poder utilizar luego

SELECT 	(count(*)/@Total)*100 as Con_ObraSocial,                                                            -- Por ultimo, aca lo que se hace es el calculo del porcentaje de 
		(1-count(*)/@Total)*100 as Sin_ObraSocial                                                           -- aquellas personas que posee obras social mediante la cantidad 
FROM ( SELECT * FROM                                                                                        -- un contador que obtiene dicha informacion. 
(SELECT * FROM Personas_Infectadas) as t1                                                                   -- 
INNER JOIN obrasocial_persona
ON obrasocial_persona.Personas_DNI = t1.DNI) as t5;
