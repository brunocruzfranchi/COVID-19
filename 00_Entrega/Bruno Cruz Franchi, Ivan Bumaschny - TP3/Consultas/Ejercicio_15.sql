/*
15) Mostrar aquellas personas, cuyo estado evovlutivo es grave, junto a su fecha de ingreso,
la saturacion de O2 y temperatura de la muestra (para asi tener una nocion de la evolucion
del virus). Ademas, listar el hospital y la cama donde se encuentra.
*/

-- Como cada informacion necesaria esta en otra tabla, concateno INNER JOINs
SELECT Apellido, Nombre, SatO2, Temperatura, Dia_De_Ingreso,Nombre_Hospital AS Hospital, Camas_NroCama AS Cama 
FROM(
	SELECT Internado_Personas_DNI AS DNI
	FROM pacienteinternado
	WHERE EstadoEvolutivo = 'Grave') AS A
    INNER JOIN muestra_paciente ON muestra_paciente.pacientes_Personas_DNI = A.DNI
    INNER JOIN muestra on muestra_paciente.muestra_NroTesteo = muestra.NroTesteo
    INNER JOIN personas ON personas.DNI = A.DNI
    INNER JOIN paciente_hospital ON paciente_hospital.Internado_Personas_DNI = A.DNI
    INNER JOIN hospital ON hospital.NroHospital = paciente_hospital.Hospital_NroHospital
    INNER JOIN paciente_cama ON paciente_cama.Internado_Personas_DNI = A.DNI
    INNER JOIN pacientes ON pacientes.Personas_DNI = A.DNI;
    
