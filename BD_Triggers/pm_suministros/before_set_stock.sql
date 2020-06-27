CREATE DEFINER=`root`@`localhost` TRIGGER `before_set_stock` BEFORE INSERT ON `pm_suministros` FOR EACH ROW BEGIN
	DECLARE Depto VARCHAR(45);
    -- DECLARE nroHospital int;
    
	SELECT empleado_departamento.Departamento_NroDepartamento											-- Lo que hago es encontrar el valor del
	INTO Depto FROM empleado_departamento																-- departamento correspondiente a la persona
	WHERE (empleado_departamento.Empleados_Personas_DNI = NEW.PersonalMedico_Empleados_Personas_DNI);	-- que hizo el pedido
		
	 /*--------------------Aca hago el insert del producto en caso de que no exista en Dep_Suministro------------------------*/
	IF NOT EXISTS (
    SELECT 1 FROM departamento_suminstro AS t1
    WHERE (t1.Suministros_CodigoSuministro = NEW.Suministros_CodigoSuministro
    AND strcmp(Depto, t1.departamento_NroDepartamento)=0))
	THEN
		INSERT INTO departamento_suminstro(departamento_NroDepartamento, Suministros_CodigoSuministro, CantSum)
		VALUES (Depto, NEW.Suministros_CodigoSuministro, 0);
    END IF;
    
END