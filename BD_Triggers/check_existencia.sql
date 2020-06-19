CREATE DEFINER=`root`@`localhost` TRIGGER `check_existencia` BEFORE INSERT ON `empleado_departamento` FOR EACH ROW BEGIN
        IF NEW.Empleados_Personas_DNI NOT IN (
            SELECT t1.DNI
            FROM personas AS t1  	
            WHERE (NEW.Empleados_Personas_DNI = t1.DNI)
        ) THEN 
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'La persona que quiere agregar no existe en la base de datos';
		ELSEIF EXISTS (SELECT 1 FROM empleado_departamento WHERE Empleados_Personas_DNI = NEW.Empleados_Personas_DNI) 
        THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'La persona que quiere agregar ya existe en esta tabla';
        END IF;        
END