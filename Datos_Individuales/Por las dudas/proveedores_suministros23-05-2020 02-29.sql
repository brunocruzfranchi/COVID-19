#
# TABLE STRUCTURE FOR: proveedores_suministros
#

DROP TABLE IF EXISTS `proveedores_suministros`;

CREATE TABLE `proveedores_suministros` (
  `Proveedores_NroProveedores` int(11) NOT NULL,
  `Suministros_CodigoSuministro` varchar(6) NOT NULL,
  KEY `fk_Proveedores_Suministros_Suministros1_idx` (`Suministros_CodigoSuministro`),
  KEY `fk_Proveedores_Suministros_Proveedores1` (`Proveedores_NroProveedores`),
  CONSTRAINT `fk_Proveedores_Suministros_Proveedores1` FOREIGN KEY (`Proveedores_NroProveedores`) REFERENCES `proveedores` (`NroProveedores`),
  CONSTRAINT `fk_Proveedores_Suministros_Suministros1` FOREIGN KEY (`Suministros_CodigoSuministro`) REFERENCES `suministros` (`CodigoSuministro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `proveedores_suministros` (`Proveedores_NroProveedores`, `Suministros_CodigoSuministro`) VALUES (1885, 'al4g57');
INSERT INTO `proveedores_suministros` (`Proveedores_NroProveedores`, `Suministros_CodigoSuministro`) VALUES (7306, 'am3v79');
INSERT INTO `proveedores_suministros` (`Proveedores_NroProveedores`, `Suministros_CodigoSuministro`) VALUES (8140, 'ba4r15');
INSERT INTO `proveedores_suministros` (`Proveedores_NroProveedores`, `Suministros_CodigoSuministro`) VALUES (8140, 'bg9s56');
INSERT INTO `proveedores_suministros` (`Proveedores_NroProveedores`, `Suministros_CodigoSuministro`) VALUES (4656, 'bx9h87');
INSERT INTO `proveedores_suministros` (`Proveedores_NroProveedores`, `Suministros_CodigoSuministro`) VALUES (8881, 'cp7k47');
INSERT INTO `proveedores_suministros` (`Proveedores_NroProveedores`, `Suministros_CodigoSuministro`) VALUES (9073, 'dl3x30');
INSERT INTO `proveedores_suministros` (`Proveedores_NroProveedores`, `Suministros_CodigoSuministro`) VALUES (122, 'eh0q74');
INSERT INTO `proveedores_suministros` (`Proveedores_NroProveedores`, `Suministros_CodigoSuministro`) VALUES (1885, 'fz6n74');
INSERT INTO `proveedores_suministros` (`Proveedores_NroProveedores`, `Suministros_CodigoSuministro`) VALUES (3547, 'jh3s19');
INSERT INTO `proveedores_suministros` (`Proveedores_NroProveedores`, `Suministros_CodigoSuministro`) VALUES (1885, 'kl0x15');
INSERT INTO `proveedores_suministros` (`Proveedores_NroProveedores`, `Suministros_CodigoSuministro`) VALUES (3614, 'ni7e19');
INSERT INTO `proveedores_suministros` (`Proveedores_NroProveedores`, `Suministros_CodigoSuministro`) VALUES (3347, 'nq2c64');
INSERT INTO `proveedores_suministros` (`Proveedores_NroProveedores`, `Suministros_CodigoSuministro`) VALUES (7619, 'ot2e87');
INSERT INTO `proveedores_suministros` (`Proveedores_NroProveedores`, `Suministros_CodigoSuministro`) VALUES (1921, 'rg1a42');
INSERT INTO `proveedores_suministros` (`Proveedores_NroProveedores`, `Suministros_CodigoSuministro`) VALUES (1885, 'sh7c07');
INSERT INTO `proveedores_suministros` (`Proveedores_NroProveedores`, `Suministros_CodigoSuministro`) VALUES (5767, 'sk6y52');
INSERT INTO `proveedores_suministros` (`Proveedores_NroProveedores`, `Suministros_CodigoSuministro`) VALUES (9436, 'sk7r39');
INSERT INTO `proveedores_suministros` (`Proveedores_NroProveedores`, `Suministros_CodigoSuministro`) VALUES (7619, 'sl7t43');
INSERT INTO `proveedores_suministros` (`Proveedores_NroProveedores`, `Suministros_CodigoSuministro`) VALUES (7382, 'sn4e68');
INSERT INTO `proveedores_suministros` (`Proveedores_NroProveedores`, `Suministros_CodigoSuministro`) VALUES (1402, 'ss1z79');
INSERT INTO `proveedores_suministros` (`Proveedores_NroProveedores`, `Suministros_CodigoSuministro`) VALUES (7484, 'sx8b10');
INSERT INTO `proveedores_suministros` (`Proveedores_NroProveedores`, `Suministros_CodigoSuministro`) VALUES (8881, 'tn5l30');
INSERT INTO `proveedores_suministros` (`Proveedores_NroProveedores`, `Suministros_CodigoSuministro`) VALUES (8039, 'tx1z28');
INSERT INTO `proveedores_suministros` (`Proveedores_NroProveedores`, `Suministros_CodigoSuministro`) VALUES (9913, 'ty4s65');
INSERT INTO `proveedores_suministros` (`Proveedores_NroProveedores`, `Suministros_CodigoSuministro`) VALUES (3547, 'ug9y52');
INSERT INTO `proveedores_suministros` (`Proveedores_NroProveedores`, `Suministros_CodigoSuministro`) VALUES (5767, 'uo9z41');
INSERT INTO `proveedores_suministros` (`Proveedores_NroProveedores`, `Suministros_CodigoSuministro`) VALUES (122, 'wl3i67');
INSERT INTO `proveedores_suministros` (`Proveedores_NroProveedores`, `Suministros_CodigoSuministro`) VALUES (5905, 'ww1l19');
INSERT INTO `proveedores_suministros` (`Proveedores_NroProveedores`, `Suministros_CodigoSuministro`) VALUES (7382, 'xi6q50');


