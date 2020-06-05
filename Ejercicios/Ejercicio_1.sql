/* 
1) Mostrar el total de infectados, activos, recuperados y muertos en CABA, desde que
comenzó a registrarse los datos de la pandemia, en marzo de 2020, mes a mes. 
*/

DROP VIEW IF EXISTS Datos;
DROP VIEW IF EXISTS ACTIVOS;
DROP VIEW IF EXISTS INFECTADOS;
DROP VIEW IF EXISTS RECUPERADOS;
DROP VIEW IF EXISTS FALLECIDOS;

CREATE VIEW Datos AS (
SELECT Dia_de_Ingreso, CheckOut, Resultado 
	FROM (SELECT * FROM pacientes
	INNER JOIN pacienteinternado
		ON pacientes.Personas_DNI = pacienteinternado.Internado_Personas_DNI)  a
	INNER JOIN (SELECT * FROM muestra WHERE Resultado = 1) b
		ON a.Personas_DNI = B.Pacientes_Personas_DNI) ;

CREATE VIEW ACTIVOS AS (SELECT Dia_de_Ingreso, count(*) Activos FROM Datos WHERE CheckOut IS NULL GROUP BY MONTH(Dia_de_Ingreso)) ;
CREATE VIEW INFECTADOS AS(select Dia_de_Ingreso, count(*) Infectados FROM Datos GROUP BY MONTH(Dia_de_Ingreso)) ;
CREATE VIEW RECUPERADOS AS (select Dia_de_Ingreso, count(*) Recuperados FROM Datos WHERE CheckOut='Alta' GROUP BY MONTH(Dia_de_Ingreso)) ;
CREATE VIEW FALLECIDOS AS (select Dia_de_Ingreso, count(*) Fallecidos FROM Datos WHERE CheckOut='Fallecido' GROUP BY MONTH(Dia_de_Ingreso)) ;

/*
SELECT *
FROM (SELECT Dia_de_Ingreso, count(*) Recuperados FROM Datos WHERE CheckOut='Alta' GROUP BY MONTH(Dia_de_Ingreso)) AS HOLA
INNER JOIN (SELECT Dia_de_Ingreso, count(*) Activos FROM Datos WHERE CheckOut IS NULL GROUP BY MONTH(Dia_de_Ingreso)) AS HOL1
ON month(HOLA.Dia_de_Ingreso)=month(HOL1.Dia_de_Ingreso)*/

SELECT MONTHNAME(t1.Dia_de_Ingreso), ACTIVOS, RECUPERADOS, FALLECIDOS, INFECTADOS
  FROM ACTIVOS AS t1 
  INNER JOIN INFECTADOS AS t2 
	ON MONTH(t1.Dia_de_Ingreso) = MONTH(t2.Dia_de_Ingreso)
  INNER JOIN RECUPERADOS AS t3 
	ON MONTH(t1.Dia_de_Ingreso) = MONTH(t3.Dia_de_Ingreso)
  INNER JOIN FALLECIDOS AS t4 
	ON MONTH(t1.Dia_de_Ingreso) = MONTH(t4.Dia_de_Ingreso)
  ORDER BY t1.Dia_de_Ingreso ASC;
