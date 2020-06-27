/* 
2) Contabilizar la cantidad de pacientes muertos, separándolos por grupos de
enfermedad preexistente (diabetes, cardiopatías, hipertensión arterial, insuficiencia
renal, insuficiencia respiratoria, obesidad mórbida, edad mayor a 75 años, por
ejemplo).
*/ 

SELECT Enfermedades, count(*) Muertes 
FROM
	(SELECT Internado_Personas_DNI as Personas_DNI FROM pacienteinternado WHERE CheckOut = 'Fallecido') AS t1 	-- t1 = Obtengo mi tabla con todos aquellos pacientes que hayan fallecido (n=684)
    NATURAL JOIN																								-- t2 = Obtengo todos los datos de las enfermedades que padecen los pacientes
    (SELECT pacientes_Personas_DNI as Personas_DNI, Enfermedades FROM HistorialClinico) AS t2					-- A partir del natural join obtengo una tabla con los pacientes fallecidos y sus enfermedades 
GROUP BY Enfermedades ORDER BY Muertes DESC																		-- Y finalmente, al agrupar por las enfermedades y utilzando la funcion COUNT obtengo un numero 
																												-- de las patologias que padecian los fallecidos.