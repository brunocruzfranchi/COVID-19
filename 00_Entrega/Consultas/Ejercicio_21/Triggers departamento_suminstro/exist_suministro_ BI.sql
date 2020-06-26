CREATE DEFINER=`root`@`localhost` TRIGGER `exist_suministro` BEFORE INSERT ON `departamento_suminstro` FOR EACH ROW BEGIN
	IF (SELECT EXISTS(SELECT * FROM departamento_suminstro AS t1
		WHERE (t1.Suministros_CodigoSuministro = NEW.Suministros_CodigoSuministro 
			AND strcmp(NEW.departamento_NroDepartamento, t1.departamento_NroDepartamento)=0))) THEN
		SIGNAL SQLSTATE VALUE '45000' 
        SET MESSAGE_TEXT = 'INSERT fallido debido a que se quiere agregar un valor duplicado';
	END IF;
END