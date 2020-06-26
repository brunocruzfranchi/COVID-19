CREATE DEFINER=`root`@`localhost` TRIGGER `paciente_cama_AFTER_INSERT` AFTER INSERT ON `paciente_cama` FOR EACH ROW BEGIN
	DECLARE Hospital int;
	SELECT camas.Hospital_NroHospital
	INTO Hospital FROM camas
	WHERE (camas.NroCama = NEW.Camas_NroCama);
    
    INSERT INTO covid19.paciente_hospital( Internado_Personas_DNI, Hospital_NroHospital)
		VALUES (NEW.Internado_Personas_DNI,	Hospital);
END