CREATE DATABASE  IF NOT EXISTS `covid19` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `covid19`;
-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: covid19
-- ------------------------------------------------------
-- Server version	8.0.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `almacen_hospital`
--

DROP TABLE IF EXISTS `almacen_hospital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `almacen_hospital` (
  `NroHospital` int unsigned NOT NULL,
  `CodigoSuministro` varchar(6) NOT NULL,
  `Cant_TotalSum` int unsigned DEFAULT NULL,
  KEY `fk_Almacen_Hospital_Hospital1_idx` (`NroHospital`),
  KEY `fk_Almacen_Hospital_Suministros1_idx` (`CodigoSuministro`),
  CONSTRAINT `fk_Almacen_Hospital_Hospital1` FOREIGN KEY (`NroHospital`) REFERENCES `hospital` (`NroHospital`),
  CONSTRAINT `fk_Almacen_Hospital_Suministros1` FOREIGN KEY (`CodigoSuministro`) REFERENCES `suministros` (`CodigoSuministro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `almacen_hospital`
--

LOCK TABLES `almacen_hospital` WRITE;
/*!40000 ALTER TABLE `almacen_hospital` DISABLE KEYS */;
/*!40000 ALTER TABLE `almacen_hospital` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `camas`
--

DROP TABLE IF EXISTS `camas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `camas` (
  `NroCama` int unsigned NOT NULL,
  PRIMARY KEY (`NroCama`),
  UNIQUE KEY `NroCama_UNIQUE` (`NroCama`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `camas`
--

LOCK TABLES `camas` WRITE;
/*!40000 ALTER TABLE `camas` DISABLE KEYS */;
/*!40000 ALTER TABLE `camas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `camas_hospital`
--

DROP TABLE IF EXISTS `camas_hospital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `camas_hospital` (
  `Camas_NroCama` int unsigned NOT NULL,
  `Hospital_NroHospital` int unsigned NOT NULL,
  KEY `fk_Camas_Hospital_Camas1_idx` (`Camas_NroCama`),
  KEY `fk_Camas_Hospital_Hospital1_idx` (`Hospital_NroHospital`),
  CONSTRAINT `fk_Camas_Hospital_Camas1` FOREIGN KEY (`Camas_NroCama`) REFERENCES `camas` (`NroCama`),
  CONSTRAINT `fk_Camas_Hospital_Hospital1` FOREIGN KEY (`Hospital_NroHospital`) REFERENCES `hospital` (`NroHospital`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `camas_hospital`
--

LOCK TABLES `camas_hospital` WRITE;
/*!40000 ALTER TABLE `camas_hospital` DISABLE KEYS */;
/*!40000 ALTER TABLE `camas_hospital` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `convivientes`
--

DROP TABLE IF EXISTS `convivientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `convivientes` (
  `Personas_DNI` int unsigned NOT NULL,
  `Conviviente_DNI` int unsigned NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`Conviviente_DNI`),
  UNIQUE KEY `Conviviente_DNI_UNIQUE` (`Conviviente_DNI`),
  KEY `fk_Convivientes_Personas1` (`Personas_DNI`) /*!80000 INVISIBLE */,
  CONSTRAINT `fk_Convivientes_Personas1` FOREIGN KEY (`Personas_DNI`) REFERENCES `personas` (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `convivientes`
--

LOCK TABLES `convivientes` WRITE;
/*!40000 ALTER TABLE `convivientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `convivientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamento` (
  `NroDepartamento` int NOT NULL,
  `EspecialidadDepto` varchar(45) NOT NULL,
  PRIMARY KEY (`NroDepartamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamento_suminstro`
--

DROP TABLE IF EXISTS `departamento_suminstro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamento_suminstro` (
  `Departamento_NroDepartamento` int NOT NULL,
  `Suministros_CodigoSuministro` varchar(6) NOT NULL,
  `CantSum` int unsigned NOT NULL,
  KEY `fk_Departamento_Suminstro_Departamento1_idx` (`Departamento_NroDepartamento`),
  KEY `fk_Departamento_Suminstro_Suministros1_idx` (`Suministros_CodigoSuministro`),
  CONSTRAINT `fk_Departamento_Suminstro_Departamento1` FOREIGN KEY (`Departamento_NroDepartamento`) REFERENCES `departamento` (`NroDepartamento`),
  CONSTRAINT `fk_Departamento_Suminstro_Suministros1` FOREIGN KEY (`Suministros_CodigoSuministro`) REFERENCES `suministros` (`CodigoSuministro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento_suminstro`
--

LOCK TABLES `departamento_suminstro` WRITE;
/*!40000 ALTER TABLE `departamento_suminstro` DISABLE KEYS */;
/*!40000 ALTER TABLE `departamento_suminstro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamentos_hospital`
--

DROP TABLE IF EXISTS `departamentos_hospital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamentos_hospital` (
  `Hospital_NroHospital` int unsigned NOT NULL,
  `Departamento_NroDepartamento` int NOT NULL,
  KEY `fk_Departamentos_Hospital_Hospital1_idx` (`Hospital_NroHospital`),
  KEY `fk_Departamentos_Hospital_Departamento1_idx` (`Departamento_NroDepartamento`),
  CONSTRAINT `fk_Departamentos_Hospital_Departamento1` FOREIGN KEY (`Departamento_NroDepartamento`) REFERENCES `departamento` (`NroDepartamento`),
  CONSTRAINT `fk_Departamentos_Hospital_Hospital1` FOREIGN KEY (`Hospital_NroHospital`) REFERENCES `hospital` (`NroHospital`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamentos_hospital`
--

LOCK TABLES `departamentos_hospital` WRITE;
/*!40000 ALTER TABLE `departamentos_hospital` DISABLE KEYS */;
/*!40000 ALTER TABLE `departamentos_hospital` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directormedico`
--

DROP TABLE IF EXISTS `directormedico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directormedico` (
  `Empleados_Personas_DNI` int unsigned NOT NULL,
  PRIMARY KEY (`Empleados_Personas_DNI`),
  KEY `fk_DirectorMedico_Empleados1_idx` (`Empleados_Personas_DNI`),
  CONSTRAINT `fk_DirectorMedico_Empleados1` FOREIGN KEY (`Empleados_Personas_DNI`) REFERENCES `empleados` (`Personas_DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directormedico`
--

LOCK TABLES `directormedico` WRITE;
/*!40000 ALTER TABLE `directormedico` DISABLE KEYS */;
/*!40000 ALTER TABLE `directormedico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado_departamento`
--

DROP TABLE IF EXISTS `empleado_departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado_departamento` (
  `Empleados_Personas_DNI` int unsigned NOT NULL,
  `Departamento_NroDepartamento` int NOT NULL,
  KEY `fk_Empleado_Departamento_Empleados1_idx` (`Empleados_Personas_DNI`),
  KEY `fk_Empleado_Departamento_Departamento1_idx` (`Departamento_NroDepartamento`),
  CONSTRAINT `fk_Empleado_Departamento_Departamento1` FOREIGN KEY (`Departamento_NroDepartamento`) REFERENCES `departamento` (`NroDepartamento`),
  CONSTRAINT `fk_Empleado_Departamento_Empleados1` FOREIGN KEY (`Empleados_Personas_DNI`) REFERENCES `empleados` (`Personas_DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado_departamento`
--

LOCK TABLES `empleado_departamento` WRITE;
/*!40000 ALTER TABLE `empleado_departamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `empleado_departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `Personas_DNI` int unsigned NOT NULL,
  `Fecha_de_Contratacion` date NOT NULL,
  `Lugar_de_desempeño` varchar(45) NOT NULL,
  PRIMARY KEY (`Personas_DNI`),
  KEY `fk_Empleados_Personas1_idx` (`Personas_DNI`),
  CONSTRAINT `fk_Empleados_Personas1` FOREIGN KEY (`Personas_DNI`) REFERENCES `personas` (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `farmaceuticos`
--

DROP TABLE IF EXISTS `farmaceuticos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `farmaceuticos` (
  `CodigoSuministro` varchar(6) NOT NULL,
  `NiveldePeticion` varchar(45) NOT NULL,
  `Dosis` varchar(45) NOT NULL,
  `EspecialidadFarmaceutica` varchar(45) NOT NULL,
  `ModoDeAdministracion` varchar(45) NOT NULL,
  KEY `fk_Farmaceuticos_Suministros1_idx` (`CodigoSuministro`),
  CONSTRAINT `fk_Farmaceuticos_Suministros1` FOREIGN KEY (`CodigoSuministro`) REFERENCES `suministros` (`CodigoSuministro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farmaceuticos`
--

LOCK TABLES `farmaceuticos` WRITE;
/*!40000 ALTER TABLE `farmaceuticos` DISABLE KEYS */;
/*!40000 ALTER TABLE `farmaceuticos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horario`
--

DROP TABLE IF EXISTS `horario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `horario` (
  `Lunes` time NOT NULL,
  `Martes` time NOT NULL,
  `Miercoles` time NOT NULL,
  `Jueves` time NOT NULL,
  `Viernes` time NOT NULL,
  `Sabado` time NOT NULL,
  `Domingo` time NOT NULL,
  `PersonalMedico_Empleados_Personas_DNI` int unsigned NOT NULL,
  KEY `fk_Horario_PersonalMedico1_idx` (`PersonalMedico_Empleados_Personas_DNI`),
  CONSTRAINT `fk_Horario_PersonalMedico1` FOREIGN KEY (`PersonalMedico_Empleados_Personas_DNI`) REFERENCES `personalmedico` (`Empleados_Personas_DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horario`
--

LOCK TABLES `horario` WRITE;
/*!40000 ALTER TABLE `horario` DISABLE KEYS */;
/*!40000 ALTER TABLE `horario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hospital`
--

DROP TABLE IF EXISTS `hospital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hospital` (
  `NroHospital` int unsigned NOT NULL,
  `Nombre_Hospital` varchar(45) NOT NULL,
  PRIMARY KEY (`NroHospital`),
  UNIQUE KEY `NroHospital_UNIQUE` (`NroHospital`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospital`
--

LOCK TABLES `hospital` WRITE;
/*!40000 ALTER TABLE `hospital` DISABLE KEYS */;
/*!40000 ALTER TABLE `hospital` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `informacion_covid19`
--

DROP TABLE IF EXISTS `informacion_covid19`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `informacion_covid19` (
  `DirectorMedico_Empleados_Personas_DNI` int unsigned NOT NULL,
  `Infectados` int NOT NULL,
  `Fallecidos` int NOT NULL,
  `Recuperados` int NOT NULL,
  `FechaInformacion` date NOT NULL,
  UNIQUE KEY `Fallecidos_UNIQUE` (`Fallecidos`),
  UNIQUE KEY `Recuperados_UNIQUE` (`Recuperados`),
  UNIQUE KEY `Infectados_UNIQUE` (`Infectados`),
  UNIQUE KEY `DirectorMedico_Empleados_Personas_DNI_UNIQUE` (`DirectorMedico_Empleados_Personas_DNI`),
  KEY `fk_Informacion_COVID19_DirectorMedico1_idx` (`DirectorMedico_Empleados_Personas_DNI`),
  CONSTRAINT `fk_Informacion_COVID19_DirectorMedico1` FOREIGN KEY (`DirectorMedico_Empleados_Personas_DNI`) REFERENCES `directormedico` (`Empleados_Personas_DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `informacion_covid19`
--

LOCK TABLES `informacion_covid19` WRITE;
/*!40000 ALTER TABLE `informacion_covid19` DISABLE KEYS */;
/*!40000 ALTER TABLE `informacion_covid19` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jefedeenfermeria`
--

DROP TABLE IF EXISTS `jefedeenfermeria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jefedeenfermeria` (
  `Empleados_Personas_DNI` int unsigned NOT NULL,
  PRIMARY KEY (`Empleados_Personas_DNI`),
  KEY `fk_JefedeEnfermeria_Empleados1_idx` (`Empleados_Personas_DNI`),
  CONSTRAINT `fk_JefedeEnfermeria_Empleados1` FOREIGN KEY (`Empleados_Personas_DNI`) REFERENCES `empleados` (`Personas_DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jefedeenfermeria`
--

LOCK TABLES `jefedeenfermeria` WRITE;
/*!40000 ALTER TABLE `jefedeenfermeria` DISABLE KEYS */;
/*!40000 ALTER TABLE `jefedeenfermeria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicamentos`
--

DROP TABLE IF EXISTS `medicamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicamentos` (
  `Internado_Personas_DNI` int unsigned NOT NULL,
  `Medicamento` varchar(45) NOT NULL,
  UNIQUE KEY `Internado_Personas_DNI_UNIQUE` (`Internado_Personas_DNI`),
  KEY `fk_Medicamentos_PacienteInternado1_idx` (`Internado_Personas_DNI`),
  CONSTRAINT `fk_Medicamentos_PacienteInternado1` FOREIGN KEY (`Internado_Personas_DNI`) REFERENCES `pacienteinternado` (`Internado_Personas_DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicamentos`
--

LOCK TABLES `medicamentos` WRITE;
/*!40000 ALTER TABLE `medicamentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `medicamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `muestra`
--

DROP TABLE IF EXISTS `muestra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `muestra` (
  `NroTesteo` int NOT NULL,
  `Pacientes_Personas_DNI` int unsigned NOT NULL,
  `Resultado` tinyint NOT NULL,
  `SatO2` float NOT NULL,
  `Temperatura` float NOT NULL,
  PRIMARY KEY (`NroTesteo`),
  KEY `fk_Muestra_Pacientes1_idx` (`Pacientes_Personas_DNI`),
  CONSTRAINT `fk_Muestra_Pacientes1` FOREIGN KEY (`Pacientes_Personas_DNI`) REFERENCES `pacientes` (`Personas_DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `muestra`
--

LOCK TABLES `muestra` WRITE;
/*!40000 ALTER TABLE `muestra` DISABLE KEYS */;
/*!40000 ALTER TABLE `muestra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `normales`
--

DROP TABLE IF EXISTS `normales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `normales` (
  `Camas_NroCama` int unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`Camas_NroCama`),
  UNIQUE KEY `Camas_NroCama_UNIQUE` (`Camas_NroCama`),
  KEY `fk_Normales_Camas1_idx` (`Camas_NroCama`),
  CONSTRAINT `fk_Normales_Camas1` FOREIGN KEY (`Camas_NroCama`) REFERENCES `camas` (`NroCama`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `normales`
--

LOCK TABLES `normales` WRITE;
/*!40000 ALTER TABLE `normales` DISABLE KEYS */;
/*!40000 ALTER TABLE `normales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `obrasocial`
--

DROP TABLE IF EXISTS `obrasocial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `obrasocial` (
  `Personas_DNI` int unsigned NOT NULL,
  `NroAfiliado` int NOT NULL,
  `Empresa` varchar(45) NOT NULL,
  PRIMARY KEY (`NroAfiliado`),
  UNIQUE KEY `Personas_DNI_UNIQUE` (`Personas_DNI`),
  KEY `fk_ObraSocial_Personas_idx` (`Personas_DNI`) /*!80000 INVISIBLE */,
  CONSTRAINT `fk_ObraSocial_Personas` FOREIGN KEY (`Personas_DNI`) REFERENCES `personas` (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `obrasocial`
--

LOCK TABLES `obrasocial` WRITE;
/*!40000 ALTER TABLE `obrasocial` DISABLE KEYS */;
/*!40000 ALTER TABLE `obrasocial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paciente_cama`
--

DROP TABLE IF EXISTS `paciente_cama`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paciente_cama` (
  `Internado_Personas_DNI` int unsigned NOT NULL,
  `Camas_NroCama` int unsigned NOT NULL,
  KEY `fk_Paciente_Cama_PacienteInternado1_idx` (`Internado_Personas_DNI`),
  KEY `fk_Paciente_Cama_Camas1_idx` (`Camas_NroCama`),
  CONSTRAINT `fk_Paciente_Cama_Camas1` FOREIGN KEY (`Camas_NroCama`) REFERENCES `camas` (`NroCama`),
  CONSTRAINT `fk_Paciente_Cama_PacienteInternado1` FOREIGN KEY (`Internado_Personas_DNI`) REFERENCES `pacienteinternado` (`Internado_Personas_DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paciente_cama`
--

LOCK TABLES `paciente_cama` WRITE;
/*!40000 ALTER TABLE `paciente_cama` DISABLE KEYS */;
/*!40000 ALTER TABLE `paciente_cama` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paciente_hospital`
--

DROP TABLE IF EXISTS `paciente_hospital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paciente_hospital` (
  `Internado_Personas_DNI` int unsigned NOT NULL,
  `Hospital_NroHospital` int unsigned NOT NULL,
  KEY `fk_Paciente_Hospital_PacienteInternado1_idx` (`Internado_Personas_DNI`),
  KEY `fk_Paciente_Hospital_Hospital1_idx` (`Hospital_NroHospital`),
  CONSTRAINT `fk_Paciente_Hospital_Hospital1` FOREIGN KEY (`Hospital_NroHospital`) REFERENCES `hospital` (`NroHospital`),
  CONSTRAINT `fk_Paciente_Hospital_PacienteInternado1` FOREIGN KEY (`Internado_Personas_DNI`) REFERENCES `pacienteinternado` (`Internado_Personas_DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paciente_hospital`
--

LOCK TABLES `paciente_hospital` WRITE;
/*!40000 ALTER TABLE `paciente_hospital` DISABLE KEYS */;
/*!40000 ALTER TABLE `paciente_hospital` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pacientedomicilio`
--

DROP TABLE IF EXISTS `pacientedomicilio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pacientedomicilio` (
  `Domicilio_Personas_DNI` int unsigned NOT NULL,
  `Direccion` varchar(65) NOT NULL,
  `Tipo` varchar(45) NOT NULL,
  PRIMARY KEY (`Domicilio_Personas_DNI`),
  KEY `fk_PacienteDomicilio_Pacientes1_idx` (`Domicilio_Personas_DNI`),
  CONSTRAINT `fk_PacienteDomicilio_Pacientes1` FOREIGN KEY (`Domicilio_Personas_DNI`) REFERENCES `pacientes` (`Personas_DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pacientedomicilio`
--

LOCK TABLES `pacientedomicilio` WRITE;
/*!40000 ALTER TABLE `pacientedomicilio` DISABLE KEYS */;
/*!40000 ALTER TABLE `pacientedomicilio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pacienteinternado`
--

DROP TABLE IF EXISTS `pacienteinternado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pacienteinternado` (
  `Internado_Personas_DNI` int unsigned NOT NULL,
  `EstadoEvolutivo` varchar(45) DEFAULT NULL,
  `CheckOut` varchar(45) DEFAULT NULL,
  `FH_Salida` datetime DEFAULT NULL,
  PRIMARY KEY (`Internado_Personas_DNI`),
  KEY `fk_PacienteInternado_Pacientes1_idx` (`Internado_Personas_DNI`) /*!80000 INVISIBLE */,
  CONSTRAINT `fk_PacienteInternado_Pacientes1` FOREIGN KEY (`Internado_Personas_DNI`) REFERENCES `pacientes` (`Personas_DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pacienteinternado`
--

LOCK TABLES `pacienteinternado` WRITE;
/*!40000 ALTER TABLE `pacienteinternado` DISABLE KEYS */;
/*!40000 ALTER TABLE `pacienteinternado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pacientes`
--

DROP TABLE IF EXISTS `pacientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pacientes` (
  `Personas_DNI` int unsigned NOT NULL,
  `Triage` int NOT NULL,
  `Dia_de_Ingreso` date NOT NULL,
  UNIQUE KEY `Personas_DNI_UNIQUE` (`Personas_DNI`),
  KEY `fk_Pacientes_Personas1_idx` (`Personas_DNI`),
  CONSTRAINT `fk_Pacientes_Personas1` FOREIGN KEY (`Personas_DNI`) REFERENCES `personas` (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pacientes`
--

LOCK TABLES `pacientes` WRITE;
/*!40000 ALTER TABLE `pacientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `pacientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personalmedico`
--

DROP TABLE IF EXISTS `personalmedico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personalmedico` (
  `Empleados_Personas_DNI` int unsigned NOT NULL,
  `Especialidad` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Empleados_Personas_DNI`),
  KEY `fk_PersonalMedico_Empleados1_idx` (`Empleados_Personas_DNI`),
  CONSTRAINT `fk_PersonalMedico_Empleados1` FOREIGN KEY (`Empleados_Personas_DNI`) REFERENCES `empleados` (`Personas_DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personalmedico`
--

LOCK TABLES `personalmedico` WRITE;
/*!40000 ALTER TABLE `personalmedico` DISABLE KEYS */;
/*!40000 ALTER TABLE `personalmedico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personas`
--

DROP TABLE IF EXISTS `personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personas` (
  `DNI` int unsigned NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Apellido` varchar(45) NOT NULL,
  `Sexo` varchar(45) NOT NULL,
  `TelParticular` varchar(45) DEFAULT NULL,
  `Domicilio` varchar(45) DEFAULT NULL,
  `Persona_de_contacto` varchar(45) NOT NULL,
  `F_Nacimiento` date NOT NULL,
  PRIMARY KEY (`DNI`),
  UNIQUE KEY `DNI_UNIQUE` (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personas`
--

LOCK TABLES `personas` WRITE;
/*!40000 ALTER TABLE `personas` DISABLE KEYS */;
/*!40000 ALTER TABLE `personas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pm_suministros`
--

DROP TABLE IF EXISTS `pm_suministros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pm_suministros` (
  `NroPedido` int NOT NULL,
  `PersonalMedico_Empleados_Personas_DNI` int unsigned NOT NULL,
  `Suministros_CodigoSuministro` varchar(6) NOT NULL,
  `FH_Entrega` datetime DEFAULT NULL,
  `FH_Pedido` datetime DEFAULT NULL,
  `Cant_Repuesto` int DEFAULT NULL,
  PRIMARY KEY (`NroPedido`),
  UNIQUE KEY `NroPedido_UNIQUE` (`NroPedido`),
  UNIQUE KEY `PersonalMedico_Empleados_Personas_DNI_UNIQUE` (`PersonalMedico_Empleados_Personas_DNI`),
  UNIQUE KEY `Suministros_CodigoSuministro_UNIQUE` (`Suministros_CodigoSuministro`),
  KEY `fk_PM_Suministros_PersonalMedico1_idx` (`PersonalMedico_Empleados_Personas_DNI`),
  KEY `fk_PM_Suministros_Suministros1_idx` (`Suministros_CodigoSuministro`),
  CONSTRAINT `fk_PM_Suministros_PersonalMedico1` FOREIGN KEY (`PersonalMedico_Empleados_Personas_DNI`) REFERENCES `personalmedico` (`Empleados_Personas_DNI`),
  CONSTRAINT `fk_PM_Suministros_Suministros1` FOREIGN KEY (`Suministros_CodigoSuministro`) REFERENCES `suministros` (`CodigoSuministro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pm_suministros`
--

LOCK TABLES `pm_suministros` WRITE;
/*!40000 ALTER TABLE `pm_suministros` DISABLE KEYS */;
/*!40000 ALTER TABLE `pm_suministros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `NroProveedores` int NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Telefono` varchar(45) NOT NULL,
  `Direccion` varchar(45) NOT NULL,
  `Mail` varchar(75) NOT NULL,
  PRIMARY KEY (`NroProveedores`),
  UNIQUE KEY `NroProveedores_UNIQUE` (`NroProveedores`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores_suministros`
--

DROP TABLE IF EXISTS `proveedores_suministros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores_suministros` (
  `Proveedores_NroProveedores` int NOT NULL,
  `Suministros_CodigoSuministro` varchar(6) NOT NULL,
  KEY `fk_Proveedores_Suministros_Suministros1_idx` (`Suministros_CodigoSuministro`),
  KEY `fk_Proveedores_Suministros_Proveedores1` (`Proveedores_NroProveedores`),
  CONSTRAINT `fk_Proveedores_Suministros_Proveedores1` FOREIGN KEY (`Proveedores_NroProveedores`) REFERENCES `proveedores` (`NroProveedores`),
  CONSTRAINT `fk_Proveedores_Suministros_Suministros1` FOREIGN KEY (`Suministros_CodigoSuministro`) REFERENCES `suministros` (`CodigoSuministro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores_suministros`
--

LOCK TABLES `proveedores_suministros` WRITE;
/*!40000 ALTER TABLE `proveedores_suministros` DISABLE KEYS */;
/*!40000 ALTER TABLE `proveedores_suministros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suministros`
--

DROP TABLE IF EXISTS `suministros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suministros` (
  `CodigoSuministro` varchar(6) NOT NULL,
  `CostoUnitario` float NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Descripcion` varchar(75) NOT NULL,
  PRIMARY KEY (`CodigoSuministro`),
  UNIQUE KEY `CodigoSuministro_UNIQUE` (`CodigoSuministro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suministros`
--

LOCK TABLES `suministros` WRITE;
/*!40000 ALTER TABLE `suministros` DISABLE KEYS */;
/*!40000 ALTER TABLE `suministros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `terapia_intensiva`
--

DROP TABLE IF EXISTS `terapia_intensiva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `terapia_intensiva` (
  `Camas_NroCama` int unsigned NOT NULL AUTO_INCREMENT,
  `Respirador` int NOT NULL,
  PRIMARY KEY (`Camas_NroCama`),
  UNIQUE KEY `Camas_NroCama_UNIQUE` (`Camas_NroCama`),
  KEY `fk_Terapia_Intensiva_Camas1_idx` (`Camas_NroCama`),
  CONSTRAINT `fk_Terapia_Intensiva_Camas1` FOREIGN KEY (`Camas_NroCama`) REFERENCES `camas` (`NroCama`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `terapia_intensiva`
--

LOCK TABLES `terapia_intensiva` WRITE;
/*!40000 ALTER TABLE `terapia_intensiva` DISABLE KEYS */;
/*!40000 ALTER TABLE `terapia_intensiva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `titulos_y_capacitacion`
--

DROP TABLE IF EXISTS `titulos_y_capacitacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `titulos_y_capacitacion` (
  `Empleados_Personas_DNI` int unsigned NOT NULL,
  `Capacitacion` varchar(45) NOT NULL,
  PRIMARY KEY (`Capacitacion`),
  KEY `fk_Titulos_y_Capacitacione_Empleados1_idx` (`Empleados_Personas_DNI`),
  CONSTRAINT `fk_Titulos_y_Capacitacione_Empleados1` FOREIGN KEY (`Empleados_Personas_DNI`) REFERENCES `empleados` (`Personas_DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `titulos_y_capacitacion`
--

LOCK TABLES `titulos_y_capacitacion` WRITE;
/*!40000 ALTER TABLE `titulos_y_capacitacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `titulos_y_capacitacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'covid19'
--

--
-- Dumping routines for database 'covid19'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-31 21:52:05
