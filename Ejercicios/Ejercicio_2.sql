/* 
2) Contabilizar la cantidad de pacientes muertos, separándolos por grupos de
enfermedad preexistente (diabetes, cardiopatías, hipertensión arterial, insuficiencia
renal, insuficiencia respiratoria, obesidad mórbida, edad mayor a 75 años, por
ejemplo).
*/ 

SELECT Enfermedades, count(*) Muertes FROM
	(SELECT * FROM pacienteinternado WHERE CheckOut = 'Fallecido') AS t1
    INNER JOIN HistorialClinico AS t2
    ON t1.Internado_Personas_DNI = t2.pacientes_Personas_DNI
    GROUP BY Enfermedades ORDER BY Muertes DESC