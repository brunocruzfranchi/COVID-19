#
# TABLE STRUCTURE FOR: suministros
#

DROP TABLE IF EXISTS `suministros`;

CREATE TABLE `suministros` (
  `CodigoSuministro` varchar(6) NOT NULL,
  `CostoUnitario` float NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Descripcion` varchar(75) NOT NULL,
  PRIMARY KEY (`CodigoSuministro`),
  UNIQUE KEY `CodigoSuministro_UNIQUE` (`CodigoSuministro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `suministros` (`CodigoSuministro`, `CostoUnitario`, `Nombre`, `Descripcion`) VALUES ('al4g57', '175.34', 'Hexoprenalina', 'Enim dolores libero officiis qui distinctio id.');
INSERT INTO `suministros` (`CodigoSuministro`, `CostoUnitario`, `Nombre`, `Descripcion`) VALUES ('am3v79', '92.25', 'Filtro para ventiladores', 'Veniam voluptate molestias aut.');
INSERT INTO `suministros` (`CodigoSuministro`, `CostoUnitario`, `Nombre`, `Descripcion`) VALUES ('ba4r15', '197.76', ' Amoxicilina', 'Autem saepe consequatur id fugiat et et sunt.');
INSERT INTO `suministros` (`CodigoSuministro`, `CostoUnitario`, `Nombre`, `Descripcion`) VALUES ('bg9s56', '257.56', 'Metformina', 'Error quibusdam assumenda exercitationem non sunt illo.');
INSERT INTO `suministros` (`CodigoSuministro`, `CostoUnitario`, `Nombre`, `Descripcion`) VALUES ('bx9h87', '220.49', 'Solución dextrosa', 'Magni architecto hic aspernatur nostrum.');
INSERT INTO `suministros` (`CodigoSuministro`, `CostoUnitario`, `Nombre`, `Descripcion`) VALUES ('cp7k47', '187.17', 'Esponja hemostática', 'Fugit et libero eum.');
INSERT INTO `suministros` (`CodigoSuministro`, `CostoUnitario`, `Nombre`, `Descripcion`) VALUES ('dl3x30', '111.75', 'Cánula para oxigenación', 'Optio itaque beatae ex rem reiciendis nulla.');
INSERT INTO `suministros` (`CodigoSuministro`, `CostoUnitario`, `Nombre`, `Descripcion`) VALUES ('eh0q74', '80.03', 'Cloruro de potasio', 'Totam ut quam molestiae.');
INSERT INTO `suministros` (`CodigoSuministro`, `CostoUnitario`, `Nombre`, `Descripcion`) VALUES ('fz6n74', '150.77', 'Gluconato de calcio', 'Ratione odit nisi voluptate.');
INSERT INTO `suministros` (`CodigoSuministro`, `CostoUnitario`, `Nombre`, `Descripcion`) VALUES ('jh3s19', '303.37', 'Mascarilla', 'Ducimus aperiam voluptatibus enim recusandae est quia quos.');
INSERT INTO `suministros` (`CodigoSuministro`, `CostoUnitario`, `Nombre`, `Descripcion`) VALUES ('kl0x15', '114.83', 'Glimepirida', 'Facilis ea sit quia quam dolorem.');
INSERT INTO `suministros` (`CodigoSuministro`, `CostoUnitario`, `Nombre`, `Descripcion`) VALUES ('ni7e19', '253.98', ' Vancomicina', 'Excepturi excepturi nemo blanditiis debitis laborum.');
INSERT INTO `suministros` (`CodigoSuministro`, `CostoUnitario`, `Nombre`, `Descripcion`) VALUES ('nq2c64', '121.33', 'Atenolol', 'Ut voluptas praesentium dolor.');
INSERT INTO `suministros` (`CodigoSuministro`, `CostoUnitario`, `Nombre`, `Descripcion`) VALUES ('ot2e87', '143.21', 'Lidocaína', 'Quidem et qui provident.');
INSERT INTO `suministros` (`CodigoSuministro`, `CostoUnitario`, `Nombre`, `Descripcion`) VALUES ('rg1a42', '343.9', 'Gel', 'Repellat odit accusantium natus.');
INSERT INTO `suministros` (`CodigoSuministro`, `CostoUnitario`, `Nombre`, `Descripcion`) VALUES ('sh7c07', '142.52', 'Bolsas respiratorias', 'Et odit ut magni iure.');
INSERT INTO `suministros` (`CodigoSuministro`, `CostoUnitario`, `Nombre`, `Descripcion`) VALUES ('sk6y52', '69.46', 'Heparina sódica', 'Laudantium nulla voluptas hic ut vel.');
INSERT INTO `suministros` (`CodigoSuministro`, `CostoUnitario`, `Nombre`, `Descripcion`) VALUES ('sk7r39', '339.8', ' Colistina', 'Reiciendis a quaerat enim aperiam distinctio.');
INSERT INTO `suministros` (`CodigoSuministro`, `CostoUnitario`, `Nombre`, `Descripcion`) VALUES ('sl7t43', '169.41', 'Catéteres urinarios', 'Dolor inventore modi animi dolorem sunt voluptatibus.');
INSERT INTO `suministros` (`CodigoSuministro`, `CostoUnitario`, `Nombre`, `Descripcion`) VALUES ('sn4e68', '86.08', 'Curetas', 'Cum saepe est et quis dolorem voluptates.');
INSERT INTO `suministros` (`CodigoSuministro`, `CostoUnitario`, `Nombre`, `Descripcion`) VALUES ('ss1z79', '208.82', 'Enoxaparina', 'Cupiditate possimus ad et totam.');
INSERT INTO `suministros` (`CodigoSuministro`, `CostoUnitario`, `Nombre`, `Descripcion`) VALUES ('sx8b10', '132.9', 'Tubos para Ventilación', 'Tempora eum tenetur sapiente ea pariatur.');
INSERT INTO `suministros` (`CodigoSuministro`, `CostoUnitario`, `Nombre`, `Descripcion`) VALUES ('tn5l30', '68.57', 'Hoja de Bisturí', 'Ut quam mollitia aut.');
INSERT INTO `suministros` (`CodigoSuministro`, `CostoUnitario`, `Nombre`, `Descripcion`) VALUES ('tx1z28', '191.33', ' Cefotaxima', 'Tempora sit animi enim est.');
INSERT INTO `suministros` (`CodigoSuministro`, `CostoUnitario`, `Nombre`, `Descripcion`) VALUES ('ty4s65', '124.19', 'Furosemida', 'Temporibus asperiores aut ut porro dolor.');
INSERT INTO `suministros` (`CodigoSuministro`, `CostoUnitario`, `Nombre`, `Descripcion`) VALUES ('ug9y52', '275.05', ' Cefixime', 'Et porro deleniti aliquid repellat laudantium.');
INSERT INTO `suministros` (`CodigoSuministro`, `CostoUnitario`, `Nombre`, `Descripcion`) VALUES ('uo9z41', '136.77', ' Oxacilina', 'Alias impedit odio eligendi ut aut dolores.');
INSERT INTO `suministros` (`CodigoSuministro`, `CostoUnitario`, `Nombre`, `Descripcion`) VALUES ('wl3i67', '128.27', ' Bisturí', 'Eum omnis quibusdam dolor et.');
INSERT INTO `suministros` (`CodigoSuministro`, `CostoUnitario`, `Nombre`, `Descripcion`) VALUES ('ww1l19', '120.29', 'Warfarina', 'Velit itaque cupiditate et.');
INSERT INTO `suministros` (`CodigoSuministro`, `CostoUnitario`, `Nombre`, `Descripcion`) VALUES ('xi6q50', '137.53', 'Termómetro', 'Recusandae minus sunt qui enim at.');


