CREATE DEFINER=`root`@`localhost` TRIGGER `exist_suministro` BEFORE INSERT ON `departamento_suminstro` FOR EACH ROW BEGIN
    IF (SELECT EXISTS(SELECT * from departamento_suminstro WHERE Departamento_NroDepartamento = NEW.Departamento_NroDepartamento AND 
    Suministros_CodigoSuministro = NEW.Suministros_CodigoSuministro))
    THEN
		UPDATE departamento_suminstro
			SET CantSum = CantSum + NEW.CantSum
            WHERE Departamento_NroDepartamento = NEW.Departamento_NroDepartamento AND Suministros_CodigoSuministro = NEW.Suministros_CodigoSuministro;
    END IF;
END