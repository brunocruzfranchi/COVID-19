#
# TABLE STRUCTURE FOR: departamentos_hospital
#

DROP TABLE IF EXISTS `departamentos_hospital`;

CREATE TABLE `departamentos_hospital` (
  `Hospital_NroHospital` int(10) unsigned NOT NULL,
  `Departamento_NroDepartamento` int(11) NOT NULL,
  KEY `fk_Departamentos_Hospital_Hospital1_idx` (`Hospital_NroHospital`),
  KEY `fk_Departamentos_Hospital_Departamento1_idx` (`Departamento_NroDepartamento`),
  CONSTRAINT `fk_Departamentos_Hospital_Departamento1` FOREIGN KEY (`Departamento_NroDepartamento`) REFERENCES `departamento` (`NroDepartamento`),
  CONSTRAINT `fk_Departamentos_Hospital_Hospital1` FOREIGN KEY (`Hospital_NroHospital`) REFERENCES `hospital` (`NroHospital`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (17, 751);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (65, 574);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (97, 88);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (50, 88);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (97, 574);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (50, 945);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (67, 679);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (17, 679);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (17, 88);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (50, 783);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (50, 541);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (17, 315);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (22, 574);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (22, 187);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (97, 751);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (27, 367);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (27, 88);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (65, 541);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (2, 315);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (27, 88);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (65, 818);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (71, 467);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (27, 88);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (97, 695);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (2, 574);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (27, 679);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (71, 695);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (67, 187);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (2, 956);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (17, 88);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (67, 695);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (22, 187);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (65, 818);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (50, 751);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (97, 818);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (67, 679);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (67, 679);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (71, 187);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (65, 783);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (67, 751);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (22, 187);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (22, 315);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (67, 945);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (22, 757);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (71, 574);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (71, 679);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (2, 88);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (65, 757);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (71, 187);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (27, 783);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (97, 187);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (27, 695);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (65, 396);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (67, 367);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (2, 541);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (97, 467);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (50, 315);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (50, 315);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (2, 757);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (97, 945);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (17, 757);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (50, 396);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (67, 315);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (97, 695);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (22, 467);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (27, 367);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (27, 783);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (71, 88);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (2, 654);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (22, 187);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (71, 367);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (27, 467);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (27, 945);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (50, 541);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (65, 574);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (22, 783);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (17, 818);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (2, 945);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (2, 88);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (50, 396);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (27, 945);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (50, 757);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (67, 396);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (71, 757);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (71, 187);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (71, 751);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (22, 367);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (2, 695);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (2, 679);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (2, 751);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (97, 541);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (50, 315);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (17, 679);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (2, 367);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (65, 654);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (50, 945);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (27, 956);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (67, 315);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (22, 654);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (71, 88);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (65, 751);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (67, 818);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (71, 757);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (50, 956);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (22, 654);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (65, 396);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (71, 315);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (27, 88);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (67, 541);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (22, 396);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (97, 757);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (17, 467);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (67, 818);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (50, 956);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (22, 467);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (2, 818);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (97, 783);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (67, 818);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (50, 367);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (71, 783);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (67, 574);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (2, 679);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (65, 574);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (65, 467);
INSERT INTO `departamentos_hospital` (`Hospital_NroHospital`, `Departamento_NroDepartamento`) VALUES (71, 818);


