CREATE DEFINER=`root`@`localhost` TRIGGER `add_hospital_suministro_if_not_exist` AFTER INSERT ON `departamento_suminstro` FOR EACH ROW BEGIN
	DECLARE nroHospital int;
	SELECT departamentos_hospital.Hospital_NroHospital
	INTO nroHospital FROM departamentos_hospital
	WHERE (departamentos_hospital.Departamento_NroDepartamento = NEW.Departamento_NroDepartamento);
		
	IF NOT EXISTS (SELECT 1 FROM almacen_hospital WHERE nroHospital = almacen_hospital.NroHospital AND almacen_hospital.CodigoSuministro = NEW.Suministros_CodigoSuministro) 
	THEN
		INSERT INTO covid19.almacen_hospital(NroHospital, CodigoSuministro, Cant_TotalSum)
		VALUES (nroHospital, NEW.Suministros_CodigoSuministro, NEW.CantSum);
	ELSE 
		UPDATE almacen_hospital
			   SET  Cant_TotalSum= Cant_TotalSum+NEW.CantSum
			   WHERE nroHospital= NroHospital AND CodigoSuministro = NEW.Suministros_CodigoSuministro;
	END IF;
END