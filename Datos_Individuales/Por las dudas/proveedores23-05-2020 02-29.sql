#
# TABLE STRUCTURE FOR: proveedores
#

DROP TABLE IF EXISTS `proveedores`;

CREATE TABLE `proveedores` (
  `NroProveedores` int(11) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Telefono` varchar(45) NOT NULL,
  `Direccion` varchar(45) NOT NULL,
  `Mail` varchar(75) NOT NULL,
  PRIMARY KEY (`NroProveedores`),
  UNIQUE KEY `NroProveedores_UNIQUE` (`NroProveedores`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `proveedores` (`NroProveedores`, `Nombre`, `Telefono`, `Direccion`, `Mail`) VALUES (122, 'Gusikowski-Ferry', '1180663773', 'Marilou Station', 'adeline.orn@example.org');
INSERT INTO `proveedores` (`NroProveedores`, `Nombre`, `Telefono`, `Direccion`, `Mail`) VALUES (439, 'Bergnaum-Deckow', '1192013848', 'Bosco Junctions', 'igislason@example.org');
INSERT INTO `proveedores` (`NroProveedores`, `Nombre`, `Telefono`, `Direccion`, `Mail`) VALUES (996, 'Hackett, Farrell and Morissette', '1194217528', 'Rosenbaum Court', 'mueller.chaya@example.com');
INSERT INTO `proveedores` (`NroProveedores`, `Nombre`, `Telefono`, `Direccion`, `Mail`) VALUES (1402, 'Pfeffer LLC', '1166908098', 'Ratke Tunnel', 'lromaguera@example.net');
INSERT INTO `proveedores` (`NroProveedores`, `Nombre`, `Telefono`, `Direccion`, `Mail`) VALUES (1885, 'Kutch-Bergstrom', '1170767652', 'Treutel Hollow', 'mhartmann@example.org');
INSERT INTO `proveedores` (`NroProveedores`, `Nombre`, `Telefono`, `Direccion`, `Mail`) VALUES (1921, 'Breitenberg and Sons', '1115934664', 'Brock Route', 'hbaumbach@example.org');
INSERT INTO `proveedores` (`NroProveedores`, `Nombre`, `Telefono`, `Direccion`, `Mail`) VALUES (3347, 'Moore Ltd', '1155779091', 'Yundt Lights', 'mckenzie.abdul@example.com');
INSERT INTO `proveedores` (`NroProveedores`, `Nombre`, `Telefono`, `Direccion`, `Mail`) VALUES (3547, 'Nikolaus-Kris', '1169364661', 'Jaylen Coves', 'lowell.lueilwitz@example.net');
INSERT INTO `proveedores` (`NroProveedores`, `Nombre`, `Telefono`, `Direccion`, `Mail`) VALUES (3614, 'Lueilwitz and Sons', '1127932241', 'Uriel Garden', 'elsie.barrows@example.net');
INSERT INTO `proveedores` (`NroProveedores`, `Nombre`, `Telefono`, `Direccion`, `Mail`) VALUES (3823, 'Cormier Group', '1110678458', 'Reilly Bypass', 'ocie53@example.com');
INSERT INTO `proveedores` (`NroProveedores`, `Nombre`, `Telefono`, `Direccion`, `Mail`) VALUES (4048, 'Ernser Inc', '1168861855', 'Birdie Pass', 'zreynolds@example.org');
INSERT INTO `proveedores` (`NroProveedores`, `Nombre`, `Telefono`, `Direccion`, `Mail`) VALUES (4656, 'Bode, Hudson and Strosin', '1120263051', 'Dannie Fields', 'xlangworth@example.org');
INSERT INTO `proveedores` (`NroProveedores`, `Nombre`, `Telefono`, `Direccion`, `Mail`) VALUES (5767, 'Kub LLC', '1132564984', 'Reyna Vista', 'telly89@example.org');
INSERT INTO `proveedores` (`NroProveedores`, `Nombre`, `Telefono`, `Direccion`, `Mail`) VALUES (5905, 'Koch Ltd', '1151200946', 'Madelyn Lodge', 'jkoss@example.net');
INSERT INTO `proveedores` (`NroProveedores`, `Nombre`, `Telefono`, `Direccion`, `Mail`) VALUES (7306, 'Jacobs-Fahey', '1119067463', 'Devyn Key', 'jakubowski.katelynn@example.com');
INSERT INTO `proveedores` (`NroProveedores`, `Nombre`, `Telefono`, `Direccion`, `Mail`) VALUES (7382, 'Schmitt PLC', '1110988191', 'Cummings Inlet', 'block.keenan@example.com');
INSERT INTO `proveedores` (`NroProveedores`, `Nombre`, `Telefono`, `Direccion`, `Mail`) VALUES (7484, 'Rutherford Ltd', '1148890646', 'Damian Shoal', 'labadie.anna@example.com');
INSERT INTO `proveedores` (`NroProveedores`, `Nombre`, `Telefono`, `Direccion`, `Mail`) VALUES (7619, 'Cole, Hoeger and Blick', '1190828087', 'Reagan Cove', 'dooley.janelle@example.org');
INSERT INTO `proveedores` (`NroProveedores`, `Nombre`, `Telefono`, `Direccion`, `Mail`) VALUES (8039, 'Buckridge-Toy', '1143607606', 'Ortiz Camp', 'langosh.modesta@example.org');
INSERT INTO `proveedores` (`NroProveedores`, `Nombre`, `Telefono`, `Direccion`, `Mail`) VALUES (8140, 'O\'Hara-Hilll', '1130791245', 'Schinner Route', 'philpert@example.com');
INSERT INTO `proveedores` (`NroProveedores`, `Nombre`, `Telefono`, `Direccion`, `Mail`) VALUES (8881, 'Zboncak-Kuhlman', '1183553714', 'Micah Crest', 'curtis62@example.org');
INSERT INTO `proveedores` (`NroProveedores`, `Nombre`, `Telefono`, `Direccion`, `Mail`) VALUES (9073, 'Zboncak-Zboncak', '1176198434', 'Pfeffer Isle', 'lowe.vicenta@example.org');
INSERT INTO `proveedores` (`NroProveedores`, `Nombre`, `Telefono`, `Direccion`, `Mail`) VALUES (9436, 'Tillman-VonRueden', '1138855076', 'Maurine Passage', 'rowe.danika@example.org');
INSERT INTO `proveedores` (`NroProveedores`, `Nombre`, `Telefono`, `Direccion`, `Mail`) VALUES (9614, 'Heidenreich, Carter and Quigley', '1116633125', 'Jazmyne Drive', 'stiedemann.greg@example.com');
INSERT INTO `proveedores` (`NroProveedores`, `Nombre`, `Telefono`, `Direccion`, `Mail`) VALUES (9913, 'Hodkiewicz-Klein', '1153690533', 'Ward Dale', 'chelsey08@example.com');


