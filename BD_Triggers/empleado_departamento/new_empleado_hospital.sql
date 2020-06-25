CREATE DEFINER=`root`@`localhost` TRIGGER `new_empleado_departamento` AFTER INSERT ON `empleado_departamento` FOR EACH ROW BEGIN
        DECLARE nroHospital int;
		SELECT departamentos_hospital.Hospital_NroHospital
		INTO nroHospital FROM departamentos_hospital
		WHERE (departamentos_hospital.Departamento_NroDepartamento = NEW.Departamento_NroDepartamento);
		
        INSERT INTO covid19.empleado_hospital 
			(
				empleados_Personas_DNI, 
                hospital_NroHospital
			)
		VALUES 
			(
				NEW.Empleados_Personas_DNI,
                nroHospital
			);
END