#
# TABLE STRUCTURE FOR: hospital
#

DROP TABLE IF EXISTS `hospital`;

CREATE TABLE `hospital` (
  `NroHospital` int(10) unsigned NOT NULL,
  `Nombre_Hospital` varchar(45) NOT NULL,
  PRIMARY KEY (`NroHospital`),
  UNIQUE KEY `NroHospital_UNIQUE` (`NroHospital`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `hospital` (`NroHospital`, `Nombre_Hospital`) VALUES (2, 'Hospital Universitario');
INSERT INTO `hospital` (`NroHospital`, `Nombre_Hospital`) VALUES (17, 'Hospital Naval Central');
INSERT INTO `hospital` (`NroHospital`, `Nombre_Hospital`) VALUES (22, 'Hospital Italiano');
INSERT INTO `hospital` (`NroHospital`, `Nombre_Hospital`) VALUES (27, 'Hospital Aeronáutico Central');
INSERT INTO `hospital` (`NroHospital`, `Nombre_Hospital`) VALUES (50, 'Hospital Favaloro');
INSERT INTO `hospital` (`NroHospital`, `Nombre_Hospital`) VALUES (65, 'Hospital Militar Central');
INSERT INTO `hospital` (`NroHospital`, `Nombre_Hospital`) VALUES (67, 'Hospital Alemán');
INSERT INTO `hospital` (`NroHospital`, `Nombre_Hospital`) VALUES (71, 'Hospital Británico');
INSERT INTO `hospital` (`NroHospital`, `Nombre_Hospital`) VALUES (97, 'Hospital Garrahan');


