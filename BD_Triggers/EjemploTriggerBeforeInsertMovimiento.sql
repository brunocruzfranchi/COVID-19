CREATE DEFINER=`root`@`localhost` TRIGGER `movimiento_BEFORE_INSERT` BEFORE INSERT ON `movimiento` FOR EACH ROW BEGIN   
       DECLARE saldoCuenta int;
       SELECT cuenta.saldo
       INTO saldoCuenta FROM cuenta
       WHERE (cuenta.cbu = NEW.cuenta_cbu);

       IF (((saldoCuenta-NEW.importe) < 0) AND (NEW.tipo = 'E'))
       THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'El importe de la extracción es mayor al saldo de la cuenta';
        END IF;
END