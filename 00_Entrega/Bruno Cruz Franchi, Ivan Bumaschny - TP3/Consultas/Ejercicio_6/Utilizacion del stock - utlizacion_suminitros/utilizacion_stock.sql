CREATE DEFINER=`root`@`localhost` TRIGGER `use_stock` AFTER INSERT ON `utilizacion_suministro` FOR EACH ROW BEGIN
	DECLARE nroDepartamento VARCHAR(45);
    DECLARE hospt int unsigned;

/*--------------------Aca hago la actualizacion en la tabla Departamento_suministro------------------------*/
	SELECT empleado_departamento.Departamento_NroDepartamento											-- Lo que hago es encontrar el valor del
	INTO nroDepartamento FROM empleado_departamento														-- departamento correspondiente a la persona
	WHERE (empleado_departamento.Empleados_Personas_DNI = NEW.personalmedico_Empleados_Personas_DNI);	-- que hizo el sacado del producto

	UPDATE departamento_suminstro
		SET  CantSum = CantSum-NEW.Cant_utilizada
		WHERE (nroDepartamento=Departamento_NroDepartamento AND Suministros_CodigoSuministro=NEW.suministros_CodigoSuministro);
      
/*--------------------Aca hago la actualizacion en la tabla Almacen_Hospital------------------------*/
	SELECT t1.hospital_NroHospital																		-- Lo que hago es encontrar el valor del
	INTO hospt FROM empleado_hospital as t1																-- hospital correspondiente a la personas
	WHERE (t1.empleados_Personas_DNI = NEW.personalmedico_Empleados_Personas_DNI);						-- que hizo el sacado del producto
    
    UPDATE almacen_hospital
		SET  Cant_TotalSum = Cant_TotalSum - NEW.Cant_utilizada
		WHERE (hospt = NroHospital AND strcmp(CodigoSuministro,NEW.suministros_CodigoSuministro)=0);
END