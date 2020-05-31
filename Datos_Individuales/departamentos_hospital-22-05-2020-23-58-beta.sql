-- Generation time: Fri, 22 May 2020 23:59:40 +0000
-- Host: mysql.hostinger.ro
-- DB name: u574849695_25
/*!40030 SET NAMES UTF8 */;
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP TABLE IF EXISTS `departamentos_hospital`;
CREATE TABLE `departamentos_hospital` (
  `Hospital_NroHospital` int(10) unsigned NOT NULL,
  `Departamento_NroDepartamento` int(11) NOT NULL,
  KEY `fk_Departamentos_Hospital_Hospital1_idx` (`Hospital_NroHospital`),
  KEY `fk_Departamentos_Hospital_Departamento1_idx` (`Departamento_NroDepartamento`),
  CONSTRAINT `fk_Departamentos_Hospital_Departamento1` FOREIGN KEY (`Departamento_NroDepartamento`) REFERENCES `departamento` (`NroDepartamento`),
  CONSTRAINT `fk_Departamentos_Hospital_Hospital1` FOREIGN KEY (`Hospital_NroHospital`) REFERENCES `hospital` (`NroHospital`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `departamentos_hospital` VALUES ('17','751'),
('65','574'),
('97','88'),
('50','88'),
('97','574'),
('50','945'),
('67','679'),
('17','679'),
('17','88'),
('50','783'),
('50','541'),
('17','315'),
('22','574'),
('22','187'),
('97','751'),
('27','367'),
('27','88'),
('65','541'),
('2','315'),
('27','88'),
('65','818'),
('71','467'),
('27','88'),
('97','695'),
('2','574'),
('27','679'),
('71','695'),
('67','187'),
('2','956'),
('17','88'),
('67','695'),
('22','187'),
('65','818'),
('50','751'),
('97','818'),
('67','679'),
('67','679'),
('71','187'),
('65','783'),
('67','751'),
('22','187'),
('22','315'),
('67','945'),
('22','757'),
('71','574'),
('71','679'),
('2','88'),
('65','757'),
('71','187'),
('27','783'),
('97','187'),
('27','695'),
('65','396'),
('67','367'),
('2','541'),
('97','467'),
('50','315'),
('50','315'),
('2','757'),
('97','945'),
('17','757'),
('50','396'),
('67','315'),
('97','695'),
('22','467'),
('27','367'),
('27','783'),
('71','88'),
('2','654'),
('22','187'),
('71','367'),
('27','467'),
('27','945'),
('50','541'),
('65','574'),
('22','783'),
('17','818'),
('2','945'),
('2','88'),
('50','396'),
('27','945'),
('50','757'),
('67','396'),
('71','757'),
('71','187'),
('71','751'),
('22','367'),
('2','695'),
('2','679'),
('2','751'),
('97','541'),
('50','315'),
('17','679'),
('2','367'),
('65','654'),
('50','945'),
('27','956'),
('67','315'),
('22','654'),
('71','88'),
('65','751'),
('67','818'),
('71','757'),
('50','956'),
('22','654'),
('65','396'),
('71','315'),
('27','88'),
('67','541'),
('22','396'),
('97','757'),
('17','467'),
('67','818'),
('50','956'),
('22','467'),
('2','818'),
('97','783'),
('67','818'),
('50','367'),
('71','783'),
('67','574'),
('2','679'),
('65','574'),
('65','467'),
('71','818'); 




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

