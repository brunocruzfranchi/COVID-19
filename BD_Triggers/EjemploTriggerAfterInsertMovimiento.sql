CREATE DEFINER=`root`@`localhost` TRIGGER `movimiento_AFTER_INSERT` AFTER INSERT ON `movimiento` FOR EACH ROW BEGIN

       
       IF (NEW.tipo = 'E')
		   THEN
			   UPDATE cuenta
			   SET saldo = saldo-NEW.importe
			   WHERE cuenta.cbu= NEW.cuenta_cbu;
		ELSE 
			UPDATE cuenta
			SET saldo = saldo+NEW.importe
			WHERE cuenta.cbu= NEW.cuenta_cbu;
        END IF;
END