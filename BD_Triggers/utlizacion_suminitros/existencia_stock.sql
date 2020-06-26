CREATE DEFINER=`root`@`localhost` TRIGGER `existencia_stock` BEFORE INSERT ON `utilizacion_suministro` FOR EACH ROW BEGIN
	DECLARE Depto VARCHAR(45);
    DECLARE cantidad int;
    
    /*--------------------Aca hago la actualizacion en la tabla Departamento_suministro------------------------*/
	SELECT empleado_departamento.Departamento_NroDepartamento											-- Lo que hago es encontrar el valor del
	INTO Depto FROM empleado_departamento																-- departamento correspondiente a la persona
	WHERE (empleado_departamento.Empleados_Personas_DNI = NEW.personalMedico_Empleados_Personas_DNI);	-- que hizo el pedido

    /*--------------------Aca hago la actualizacion en la tabla Departamento_suministro------------------------*/
    
	IF NOT EXISTS (SELECT 1 FROM departamento_suminstro AS t2 
		WHERE (t2.Suministros_CodigoSuministro = NEW.suministros_CodigoSuministro
		AND strcmp(Depto, t2.departamento_NroDepartamento)=0))
	THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'No hay stock de los suministros que desea utilizar';
	END IF;
    
	SELECT t1.CantSum
    INTO cantidad from departamento_suminstro as t1
    WHERE (t1.Departamento_NroDepartamento = Depto AND t1.Suministros_CodigoSuministro = NEW.Suministros_CodigoSuministro);
    
	IF (cantidad = 0) THEN 
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'No hay stock de los suministros que desea utilizar';
	
	ELSEIF(cantidad < NEW.Cant_utilizada)
    THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'No hay stock sufienciente de los suministros que desea utilizar';
    END IF;
END