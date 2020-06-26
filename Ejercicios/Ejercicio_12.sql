/*
12)	Mostrar el porcentaje de la gente infectada con COVID que posee una cobertura médica junto al porcentaje de personas que no. 
Además, determinar la cantidad de asociados a cada una de las obras social existente. 
*/

DROP VIEW Personas_Infectadas;

CREATE VIEW Personas_Infectadas AS
(SELECT pacientes_Personas_DNI as 'DNI', Resultado FROM (SELECT * FROM Muestra WHERE Resultado = 1) as t3
INNER JOIN muestra_paciente
ON t3.NroTesteo = muestra_paciente.muestra_NroTesteo
UNION
SELECT DISTINCT empleados_Personas_DNI as 'DNI' , Resultado FROM (
SELECT * FROM (SELECT * FROM muestra_emp_covid WHERE Resultado = 1) AS t1
INNER JOIN muestra_empleados
ON t1.NroTesteo = muestra_empleados.muestra_emp_covid_NroTesteo) AS t2);

SELECT Empresa, Cantidad
FROM
    (SELECT ObraSocial_idPlanMedico AS idPlanMedico,COUNT(ObraSocial_idPlanMedico) AS Cantidad
    FROM (SELECT * FROM Personas_Infectadas) AS t1
    INNER JOIN obrasocial_persona ON obrasocial_persona.Personas_DNI = t1.DNI
    GROUP BY ObraSocial_idPlanMedico) AS Cant_personas
        NATURAL JOIN
    obrasocial;

SELECT @Total:=count(*) as Total FROM Personas_Infectadas;

SELECT 	(count(*)/@Total)*100 as Con_ObraSocial, 
		(1-count(*)/@Total)*100 as Sin_ObraSocial
FROM ( SELECT * FROM 
(SELECT * FROM Personas_Infectadas) as t1
INNER JOIN obrasocial_persona
ON obrasocial_persona.Personas_DNI = t1.DNI) as t5;
