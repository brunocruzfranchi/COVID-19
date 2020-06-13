CREATE DEFINER=`root`@`localhost` TRIGGER `new_suministros` AFTER INSERT ON `pm_suministros` FOR EACH ROW BEGIN
	/* Intento 1*/ 
    /*
	DECLARE DNI_aux int;
    DECLARE Hospital_aux int;
    
    SELECT empleado_hospital.empleados_Personas_DNI AS Persona_DNI 
    INTO DNI_aux
    FROM empleado_hospital 
    WHERE NEW.PersonalMedico_Empleados_Personas_DNI = empleado_hospital.Persona_DNI;
    
    SELECT empleado_hospital.hospital_NroHospital AS NroHospital_t2, almacen_hospital.NroHospital AS NroHospital
    INTO Hospital_aux
    FROM empleado_hospital, almacen_hospital
    WHERE almacen_hospital.NroHospital = empleado_hospital.NroHospital_t2;*/
    
    /*Intento 2*/ 
    /*
    UPDATE almacen_hospital
    SET Cant_TotalSum = Cant_TotalSum+NEW.Cant_Repuesto
    WHERE NEW.PersonalMedico_Empleados_Personas_DNI = DNI_aux
			AND NroHospital = Hospital_aux
				AND CodigoSuministro = NEW.Suministros_CodigoSuministro;*/
	
    /* Intento 3*/
	/*
	INSERT INTO almacen_hospital (NroHospital, CodigoSuministro, Cant_TotalSum)
		SELECT Cant_TotalSum+NEW.Cant_Repuesto
		WHERE CodigoSuministro = NEW.Suministros_CodigoSuministro 
   ;*/
    
                
END