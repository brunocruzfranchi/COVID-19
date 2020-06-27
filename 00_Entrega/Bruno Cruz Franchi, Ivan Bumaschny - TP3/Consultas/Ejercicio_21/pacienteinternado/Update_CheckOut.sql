CREATE DEFINER=`root`@`localhost` TRIGGER `Update_CheckOut` AFTER UPDATE ON `pacienteinternado` FOR EACH ROW BEGIN
	
    IF new.CheckOut IS NOT NULL THEN
		INSERT INTO salida_paciente(pacienteinternado_Internado_Personas_DNI, FH_Salida)
		VALUES(old.Internado_Personas_DNI, now());
	END IF;
    
    SET SQL_SAFE_UPDATES = 0;
    IF new.CheckOut = 'Fallecido' THEN
		UPDATE informacion_covid19
			SET Fallecidos = Fallecidos + 1
            WHERE FechaInformacion = date(20200604);
	ELSEIF new.CheckOut = 'Alta' THEN
		UPDATE informacion_covid19
			SET Recuperados = Recuperados + 1
            WHERE FechaInformacion = date(20200604);
	END IF;
    SET SQL_SAFE_UPDATES = 1;
END