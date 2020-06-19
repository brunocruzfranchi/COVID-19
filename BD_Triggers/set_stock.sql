CREATE DEFINER=`root`@`localhost` TRIGGER `set_stock` AFTER INSERT ON `pm_suministros` FOR EACH ROW BEGIN
	DECLARE nroDepartamento VARCHAR(45);
    DECLARE nroHospital int;

/*--------------------Aca hago la actualizacion en la tabla Departamento_suministro------------------------*/
	SELECT empleado_departamento.Departamento_NroDepartamento											-- Lo que hago es encontrar el valor del
	INTO nroDepartamento FROM empleado_departamento														-- departamento correspondiente a la persona
	WHERE (empleado_departamento.Empleados_Personas_DNI = NEW.PersonalMedico_Empleados_Personas_DNI);	-- que hizo el pedido

	UPDATE departamento_suminstro
		SET  CantSum = CantSum+NEW.Cant_Repuesto
		WHERE nroDepartamento=Departamento_NroDepartamento AND Suministros_CodigoSuministro=NEW.Suministros_CodigoSuministro;
      
/*--------------------Aca hago la actualizacion en la tabla Almacen_Hospital------------------------*/
	SELECT empleado_hospital.hospital_NroHospital														-- Lo que hago es encontrar el valor del
	INTO nroHospital FROM empleado_hospital																-- hospital correspondiente a la personas
	WHERE (empleado_hospital.empleados_Personas_DNI = NEW.PersonalMedico_Empleados_Personas_DNI);		-- que hizo el pedido
    
    UPDATE almacen_hospital
		SET  Cant_TotalSum = Cant_TotalSum+NEW.Cant_Repuesto
		WHERE nroHospital=Departamento_NroDepartamento AND CodigoSuministro=NEW.Suministros_CodigoSuministro;
END