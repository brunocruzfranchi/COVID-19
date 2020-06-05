-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema covid19
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `covid19` ;

-- -----------------------------------------------------
-- Schema covid19
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `covid19` DEFAULT CHARACTER SET utf8 ;
USE `covid19` ;

-- -----------------------------------------------------
-- Table `covid19`.`hospital`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `covid19`.`hospital` ;

CREATE TABLE IF NOT EXISTS `covid19`.`hospital` (
  `NroHospital` INT UNSIGNED NOT NULL,
  `Nombre_Hospital` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`NroHospital`),
  UNIQUE INDEX `NroHospital_UNIQUE` (`NroHospital` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `covid19`.`suministros`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `covid19`.`suministros` ;

CREATE TABLE IF NOT EXISTS `covid19`.`suministros` (
  `CodigoSuministro` VARCHAR(6) NOT NULL,
  `CostoUnitario` FLOAT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Descripcion` VARCHAR(75) NOT NULL,
  PRIMARY KEY (`CodigoSuministro`),
  UNIQUE INDEX `CodigoSuministro_UNIQUE` (`CodigoSuministro` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `covid19`.`almacen_hospital`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `covid19`.`almacen_hospital` ;

CREATE TABLE IF NOT EXISTS `covid19`.`almacen_hospital` (
  `NroHospital` INT UNSIGNED NOT NULL,
  `CodigoSuministro` VARCHAR(6) NOT NULL,
  `Cant_TotalSum` INT UNSIGNED NULL DEFAULT NULL,
  INDEX `fk_Almacen_Hospital_Hospital1_idx` (`NroHospital` ASC) VISIBLE,
  INDEX `fk_Almacen_Hospital_Suministros1_idx` (`CodigoSuministro` ASC) VISIBLE,
  CONSTRAINT `fk_Almacen_Hospital_Hospital1`
    FOREIGN KEY (`NroHospital`)
    REFERENCES `covid19`.`hospital` (`NroHospital`),
  CONSTRAINT `fk_Almacen_Hospital_Suministros1`
    FOREIGN KEY (`CodigoSuministro`)
    REFERENCES `covid19`.`suministros` (`CodigoSuministro`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `covid19`.`camas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `covid19`.`camas` ;

CREATE TABLE IF NOT EXISTS `covid19`.`camas` (
  `NroCama` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`NroCama`),
  UNIQUE INDEX `NroCama_UNIQUE` (`NroCama` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `covid19`.`camas_hospital`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `covid19`.`camas_hospital` ;

CREATE TABLE IF NOT EXISTS `covid19`.`camas_hospital` (
  `Camas_NroCama` INT UNSIGNED NOT NULL,
  `Hospital_NroHospital` INT UNSIGNED NOT NULL,
  INDEX `fk_Camas_Hospital_Camas1_idx` (`Camas_NroCama` ASC) VISIBLE,
  INDEX `fk_Camas_Hospital_Hospital1_idx` (`Hospital_NroHospital` ASC) VISIBLE,
  CONSTRAINT `fk_Camas_Hospital_Camas1`
    FOREIGN KEY (`Camas_NroCama`)
    REFERENCES `covid19`.`camas` (`NroCama`),
  CONSTRAINT `fk_Camas_Hospital_Hospital1`
    FOREIGN KEY (`Hospital_NroHospital`)
    REFERENCES `covid19`.`hospital` (`NroHospital`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `covid19`.`personas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `covid19`.`personas` ;

CREATE TABLE IF NOT EXISTS `covid19`.`personas` (
  `DNI` INT UNSIGNED NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Apellido` VARCHAR(45) NOT NULL,
  `Sexo` VARCHAR(45) NOT NULL,
  `TelParticular` VARCHAR(45) NULL DEFAULT NULL,
  `Domicilio` VARCHAR(45) NULL DEFAULT NULL,
  `Persona_de_contacto` VARCHAR(45) NOT NULL,
  `F_Nacimiento` DATE NOT NULL,
  `Lugar_de_Residencia` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`DNI`),
  UNIQUE INDEX `DNI_UNIQUE` (`DNI` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `covid19`.`convivientes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `covid19`.`convivientes` ;

CREATE TABLE IF NOT EXISTS `covid19`.`convivientes` (
  `Personas_DNI` INT UNSIGNED NOT NULL,
  `Conviviente_DNI` INT UNSIGNED NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Conviviente_DNI`),
  UNIQUE INDEX `Conviviente_DNI_UNIQUE` (`Conviviente_DNI` ASC) VISIBLE,
  INDEX `fk_Convivientes_Personas1` (`Personas_DNI` ASC) INVISIBLE,
  CONSTRAINT `fk_Convivientes_Personas1`
    FOREIGN KEY (`Personas_DNI`)
    REFERENCES `covid19`.`personas` (`DNI`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `covid19`.`departamento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `covid19`.`departamento` ;

CREATE TABLE IF NOT EXISTS `covid19`.`departamento` (
  `NroDepartamento` INT NOT NULL,
  `EspecialidadDepto` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`NroDepartamento`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `covid19`.`departamento_suminstro`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `covid19`.`departamento_suminstro` ;

CREATE TABLE IF NOT EXISTS `covid19`.`departamento_suminstro` (
  `Departamento_NroDepartamento` INT NOT NULL,
  `Suministros_CodigoSuministro` VARCHAR(6) NOT NULL,
  `CantSum` INT UNSIGNED NOT NULL,
  INDEX `fk_Departamento_Suminstro_Departamento1_idx` (`Departamento_NroDepartamento` ASC) VISIBLE,
  INDEX `fk_Departamento_Suminstro_Suministros1_idx` (`Suministros_CodigoSuministro` ASC) VISIBLE,
  CONSTRAINT `fk_Departamento_Suminstro_Departamento1`
    FOREIGN KEY (`Departamento_NroDepartamento`)
    REFERENCES `covid19`.`departamento` (`NroDepartamento`),
  CONSTRAINT `fk_Departamento_Suminstro_Suministros1`
    FOREIGN KEY (`Suministros_CodigoSuministro`)
    REFERENCES `covid19`.`suministros` (`CodigoSuministro`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `covid19`.`departamentos_hospital`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `covid19`.`departamentos_hospital` ;

CREATE TABLE IF NOT EXISTS `covid19`.`departamentos_hospital` (
  `Hospital_NroHospital` INT UNSIGNED NOT NULL,
  `Departamento_NroDepartamento` INT NOT NULL,
  INDEX `fk_Departamentos_Hospital_Hospital1_idx` (`Hospital_NroHospital` ASC) VISIBLE,
  INDEX `fk_Departamentos_Hospital_Departamento1_idx` (`Departamento_NroDepartamento` ASC) VISIBLE,
  CONSTRAINT `fk_Departamentos_Hospital_Departamento1`
    FOREIGN KEY (`Departamento_NroDepartamento`)
    REFERENCES `covid19`.`departamento` (`NroDepartamento`),
  CONSTRAINT `fk_Departamentos_Hospital_Hospital1`
    FOREIGN KEY (`Hospital_NroHospital`)
    REFERENCES `covid19`.`hospital` (`NroHospital`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `covid19`.`empleados`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `covid19`.`empleados` ;

CREATE TABLE IF NOT EXISTS `covid19`.`empleados` (
  `Personas_DNI` INT UNSIGNED NOT NULL,
  `Fecha_de_Contratacion` DATE NOT NULL,
  `Lugar_de_desempenio` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Personas_DNI`),
  INDEX `fk_Empleados_Personas1_idx` (`Personas_DNI` ASC) VISIBLE,
  CONSTRAINT `fk_Empleados_Personas1`
    FOREIGN KEY (`Personas_DNI`)
    REFERENCES `covid19`.`personas` (`DNI`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `covid19`.`directormedico`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `covid19`.`directormedico` ;

CREATE TABLE IF NOT EXISTS `covid19`.`directormedico` (
  `Empleados_Personas_DNI` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`Empleados_Personas_DNI`),
  INDEX `fk_DirectorMedico_Empleados1_idx` (`Empleados_Personas_DNI` ASC) VISIBLE,
  CONSTRAINT `fk_DirectorMedico_Empleados1`
    FOREIGN KEY (`Empleados_Personas_DNI`)
    REFERENCES `covid19`.`empleados` (`Personas_DNI`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `covid19`.`empleado_departamento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `covid19`.`empleado_departamento` ;

CREATE TABLE IF NOT EXISTS `covid19`.`empleado_departamento` (
  `Empleados_Personas_DNI` INT UNSIGNED NOT NULL,
  `Departamento_NroDepartamento` INT NOT NULL,
  INDEX `fk_Empleado_Departamento_Empleados1_idx` (`Empleados_Personas_DNI` ASC) VISIBLE,
  INDEX `fk_Empleado_Departamento_Departamento1_idx` (`Departamento_NroDepartamento` ASC) VISIBLE,
  CONSTRAINT `fk_Empleado_Departamento_Departamento1`
    FOREIGN KEY (`Departamento_NroDepartamento`)
    REFERENCES `covid19`.`departamento` (`NroDepartamento`),
  CONSTRAINT `fk_Empleado_Departamento_Empleados1`
    FOREIGN KEY (`Empleados_Personas_DNI`)
    REFERENCES `covid19`.`empleados` (`Personas_DNI`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `covid19`.`farmaceuticos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `covid19`.`farmaceuticos` ;

CREATE TABLE IF NOT EXISTS `covid19`.`farmaceuticos` (
  `CodigoSuministro` VARCHAR(6) NOT NULL,
  `NiveldePeticion` VARCHAR(45) NOT NULL,
  `Dosis` VARCHAR(45) NOT NULL,
  `EspecialidadFarmaceutica` VARCHAR(45) NOT NULL,
  `ModoDeAdministracion` VARCHAR(45) NOT NULL,
  INDEX `fk_Farmaceuticos_Suministros1_idx` (`CodigoSuministro` ASC) VISIBLE,
  CONSTRAINT `fk_Farmaceuticos_Suministros1`
    FOREIGN KEY (`CodigoSuministro`)
    REFERENCES `covid19`.`suministros` (`CodigoSuministro`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `covid19`.`personalmedico`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `covid19`.`personalmedico` ;

CREATE TABLE IF NOT EXISTS `covid19`.`personalmedico` (
  `Empleados_Personas_DNI` INT UNSIGNED NOT NULL,
  `Especialidad` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`Empleados_Personas_DNI`),
  INDEX `fk_PersonalMedico_Empleados1_idx` (`Empleados_Personas_DNI` ASC) VISIBLE,
  CONSTRAINT `fk_PersonalMedico_Empleados1`
    FOREIGN KEY (`Empleados_Personas_DNI`)
    REFERENCES `covid19`.`empleados` (`Personas_DNI`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `covid19`.`horario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `covid19`.`horario` ;

CREATE TABLE IF NOT EXISTS `covid19`.`horario` (
  `Lunes` TIME NOT NULL,
  `Martes` TIME NOT NULL,
  `Miercoles` TIME NOT NULL,
  `Jueves` TIME NOT NULL,
  `Viernes` TIME NOT NULL,
  `Sabado` TIME NOT NULL,
  `Domingo` TIME NOT NULL,
  `PersonalMedico_Empleados_Personas_DNI` INT UNSIGNED NOT NULL,
  INDEX `fk_Horario_PersonalMedico1_idx` (`PersonalMedico_Empleados_Personas_DNI` ASC) VISIBLE,
  CONSTRAINT `fk_Horario_PersonalMedico1`
    FOREIGN KEY (`PersonalMedico_Empleados_Personas_DNI`)
    REFERENCES `covid19`.`personalmedico` (`Empleados_Personas_DNI`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `covid19`.`informacion_covid19`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `covid19`.`informacion_covid19` ;

CREATE TABLE IF NOT EXISTS `covid19`.`informacion_covid19` (
  `DirectorMedico_Empleados_Personas_DNI` INT UNSIGNED NOT NULL,
  `Infectados` INT NOT NULL,
  `Fallecidos` INT NOT NULL,
  `Recuperados` INT NOT NULL,
  `FechaInformacion` DATE NOT NULL,
  UNIQUE INDEX `Fallecidos_UNIQUE` (`Fallecidos` ASC) VISIBLE,
  UNIQUE INDEX `Recuperados_UNIQUE` (`Recuperados` ASC) VISIBLE,
  UNIQUE INDEX `Infectados_UNIQUE` (`Infectados` ASC) VISIBLE,
  UNIQUE INDEX `DirectorMedico_Empleados_Personas_DNI_UNIQUE` (`DirectorMedico_Empleados_Personas_DNI` ASC) VISIBLE,
  INDEX `fk_Informacion_COVID19_DirectorMedico1_idx` (`DirectorMedico_Empleados_Personas_DNI` ASC) VISIBLE,
  CONSTRAINT `fk_Informacion_COVID19_DirectorMedico1`
    FOREIGN KEY (`DirectorMedico_Empleados_Personas_DNI`)
    REFERENCES `covid19`.`directormedico` (`Empleados_Personas_DNI`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `covid19`.`jefedeenfermeria`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `covid19`.`jefedeenfermeria` ;

CREATE TABLE IF NOT EXISTS `covid19`.`jefedeenfermeria` (
  `Empleados_Personas_DNI` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`Empleados_Personas_DNI`),
  INDEX `fk_JefedeEnfermeria_Empleados1_idx` (`Empleados_Personas_DNI` ASC) VISIBLE,
  CONSTRAINT `fk_JefedeEnfermeria_Empleados1`
    FOREIGN KEY (`Empleados_Personas_DNI`)
    REFERENCES `covid19`.`empleados` (`Personas_DNI`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `covid19`.`pacientes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `covid19`.`pacientes` ;

CREATE TABLE IF NOT EXISTS `covid19`.`pacientes` (
  `Personas_DNI` INT UNSIGNED NOT NULL,
  `Triage` INT NOT NULL,
  `Dia_de_Ingreso` DATE NOT NULL,
  UNIQUE INDEX `Personas_DNI_UNIQUE` (`Personas_DNI` ASC) VISIBLE,
  INDEX `fk_Pacientes_Personas1_idx` (`Personas_DNI` ASC) VISIBLE,
  PRIMARY KEY (`Personas_DNI`),
  CONSTRAINT `fk_Pacientes_Personas1`
    FOREIGN KEY (`Personas_DNI`)
    REFERENCES `covid19`.`personas` (`DNI`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `covid19`.`pacienteinternado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `covid19`.`pacienteinternado` ;

CREATE TABLE IF NOT EXISTS `covid19`.`pacienteinternado` (
  `Internado_Personas_DNI` INT UNSIGNED NOT NULL,
  `EstadoEvolutivo` VARCHAR(45) NULL DEFAULT NULL,
  `CheckOut` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`Internado_Personas_DNI`),
  INDEX `fk_PacienteInternado_Pacientes1_idx` (`Internado_Personas_DNI` ASC) INVISIBLE,
  CONSTRAINT `fk_PacienteInternado_Pacientes1`
    FOREIGN KEY (`Internado_Personas_DNI`)
    REFERENCES `covid19`.`pacientes` (`Personas_DNI`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `covid19`.`medicamentos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `covid19`.`medicamentos` ;

CREATE TABLE IF NOT EXISTS `covid19`.`medicamentos` (
  `Internado_Personas_DNI` INT UNSIGNED NOT NULL,
  `Medicamento` VARCHAR(45) NOT NULL,
  UNIQUE INDEX `Internado_Personas_DNI_UNIQUE` (`Internado_Personas_DNI` ASC) VISIBLE,
  INDEX `fk_Medicamentos_PacienteInternado1_idx` (`Internado_Personas_DNI` ASC) VISIBLE,
  CONSTRAINT `fk_Medicamentos_PacienteInternado1`
    FOREIGN KEY (`Internado_Personas_DNI`)
    REFERENCES `covid19`.`pacienteinternado` (`Internado_Personas_DNI`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `covid19`.`muestra`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `covid19`.`muestra` ;

CREATE TABLE IF NOT EXISTS `covid19`.`muestra` (
  `NroTesteo` INT NOT NULL,
  `Pacientes_Personas_DNI` INT UNSIGNED NOT NULL,
  `Resultado` TINYINT NOT NULL,
  `SatO2` FLOAT NOT NULL,
  `Temperatura` FLOAT NOT NULL,
  PRIMARY KEY (`NroTesteo`),
  INDEX `fk_Muestra_Pacientes1_idx` (`Pacientes_Personas_DNI` ASC) VISIBLE,
  CONSTRAINT `fk_Muestra_Pacientes1`
    FOREIGN KEY (`Pacientes_Personas_DNI`)
    REFERENCES `covid19`.`pacientes` (`Personas_DNI`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `covid19`.`normales`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `covid19`.`normales` ;

CREATE TABLE IF NOT EXISTS `covid19`.`normales` (
  `Camas_NroCama` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`Camas_NroCama`),
  UNIQUE INDEX `Camas_NroCama_UNIQUE` (`Camas_NroCama` ASC) VISIBLE,
  INDEX `fk_Normales_Camas1_idx` (`Camas_NroCama` ASC) VISIBLE,
  CONSTRAINT `fk_Normales_Camas1`
    FOREIGN KEY (`Camas_NroCama`)
    REFERENCES `covid19`.`camas` (`NroCama`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `covid19`.`obrasocial`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `covid19`.`obrasocial` ;

CREATE TABLE IF NOT EXISTS `covid19`.`obrasocial` (
  `Personas_DNI` INT UNSIGNED NOT NULL,
  `NroAfiliado` INT NOT NULL,
  `Empresa` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`NroAfiliado`),
  UNIQUE INDEX `Personas_DNI_UNIQUE` (`Personas_DNI` ASC) VISIBLE,
  INDEX `fk_ObraSocial_Personas_idx` (`Personas_DNI` ASC) INVISIBLE,
  CONSTRAINT `fk_ObraSocial_Personas`
    FOREIGN KEY (`Personas_DNI`)
    REFERENCES `covid19`.`personas` (`DNI`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `covid19`.`paciente_cama`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `covid19`.`paciente_cama` ;

CREATE TABLE IF NOT EXISTS `covid19`.`paciente_cama` (
  `Internado_Personas_DNI` INT UNSIGNED NOT NULL,
  `Camas_NroCama` INT UNSIGNED NOT NULL,
  INDEX `fk_Paciente_Cama_PacienteInternado1_idx` (`Internado_Personas_DNI` ASC) VISIBLE,
  INDEX `fk_Paciente_Cama_Camas1_idx` (`Camas_NroCama` ASC) VISIBLE,
  CONSTRAINT `fk_Paciente_Cama_Camas1`
    FOREIGN KEY (`Camas_NroCama`)
    REFERENCES `covid19`.`camas` (`NroCama`),
  CONSTRAINT `fk_Paciente_Cama_PacienteInternado1`
    FOREIGN KEY (`Internado_Personas_DNI`)
    REFERENCES `covid19`.`pacienteinternado` (`Internado_Personas_DNI`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `covid19`.`paciente_hospital`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `covid19`.`paciente_hospital` ;

CREATE TABLE IF NOT EXISTS `covid19`.`paciente_hospital` (
  `Internado_Personas_DNI` INT UNSIGNED NOT NULL,
  `Hospital_NroHospital` INT UNSIGNED NOT NULL,
  INDEX `fk_Paciente_Hospital_PacienteInternado1_idx` (`Internado_Personas_DNI` ASC) VISIBLE,
  INDEX `fk_Paciente_Hospital_Hospital1_idx` (`Hospital_NroHospital` ASC) VISIBLE,
  CONSTRAINT `fk_Paciente_Hospital_Hospital1`
    FOREIGN KEY (`Hospital_NroHospital`)
    REFERENCES `covid19`.`hospital` (`NroHospital`),
  CONSTRAINT `fk_Paciente_Hospital_PacienteInternado1`
    FOREIGN KEY (`Internado_Personas_DNI`)
    REFERENCES `covid19`.`pacienteinternado` (`Internado_Personas_DNI`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `covid19`.`pacientedomicilio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `covid19`.`pacientedomicilio` ;

CREATE TABLE IF NOT EXISTS `covid19`.`pacientedomicilio` (
  `Domicilio_Personas_DNI` INT UNSIGNED NOT NULL,
  `Direccion` VARCHAR(65) NOT NULL,
  `Tipo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Domicilio_Personas_DNI`),
  INDEX `fk_PacienteDomicilio_Pacientes1_idx` (`Domicilio_Personas_DNI` ASC) VISIBLE,
  CONSTRAINT `fk_PacienteDomicilio_Pacientes1`
    FOREIGN KEY (`Domicilio_Personas_DNI`)
    REFERENCES `covid19`.`pacientes` (`Personas_DNI`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `covid19`.`pm_suministros`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `covid19`.`pm_suministros` ;

CREATE TABLE IF NOT EXISTS `covid19`.`pm_suministros` (
  `NroPedido` INT NOT NULL,
  `PersonalMedico_Empleados_Personas_DNI` INT UNSIGNED NOT NULL,
  `Suministros_CodigoSuministro` VARCHAR(6) NOT NULL,
  `FH_Entrega` DATETIME NULL DEFAULT NULL,
  `FH_Pedido` DATETIME NULL DEFAULT NULL,
  `Cant_Repuesto` INT NULL DEFAULT NULL,
  PRIMARY KEY (`NroPedido`),
  UNIQUE INDEX `NroPedido_UNIQUE` (`NroPedido` ASC) VISIBLE,
  UNIQUE INDEX `PersonalMedico_Empleados_Personas_DNI_UNIQUE` (`PersonalMedico_Empleados_Personas_DNI` ASC) VISIBLE,
  UNIQUE INDEX `Suministros_CodigoSuministro_UNIQUE` (`Suministros_CodigoSuministro` ASC) VISIBLE,
  INDEX `fk_PM_Suministros_PersonalMedico1_idx` (`PersonalMedico_Empleados_Personas_DNI` ASC) VISIBLE,
  INDEX `fk_PM_Suministros_Suministros1_idx` (`Suministros_CodigoSuministro` ASC) VISIBLE,
  CONSTRAINT `fk_PM_Suministros_PersonalMedico1`
    FOREIGN KEY (`PersonalMedico_Empleados_Personas_DNI`)
    REFERENCES `covid19`.`personalmedico` (`Empleados_Personas_DNI`),
  CONSTRAINT `fk_PM_Suministros_Suministros1`
    FOREIGN KEY (`Suministros_CodigoSuministro`)
    REFERENCES `covid19`.`suministros` (`CodigoSuministro`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `covid19`.`proveedores`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `covid19`.`proveedores` ;

CREATE TABLE IF NOT EXISTS `covid19`.`proveedores` (
  `NroProveedores` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Telefono` VARCHAR(45) NOT NULL,
  `Direccion` VARCHAR(45) NOT NULL,
  `Mail` VARCHAR(75) NOT NULL,
  PRIMARY KEY (`NroProveedores`),
  UNIQUE INDEX `NroProveedores_UNIQUE` (`NroProveedores` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `covid19`.`proveedores_suministros`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `covid19`.`proveedores_suministros` ;

CREATE TABLE IF NOT EXISTS `covid19`.`proveedores_suministros` (
  `Proveedores_NroProveedores` INT NOT NULL,
  `Suministros_CodigoSuministro` VARCHAR(6) NOT NULL,
  INDEX `fk_Proveedores_Suministros_Suministros1_idx` (`Suministros_CodigoSuministro` ASC) VISIBLE,
  INDEX `fk_Proveedores_Suministros_Proveedores1` (`Proveedores_NroProveedores` ASC) VISIBLE,
  CONSTRAINT `fk_Proveedores_Suministros_Proveedores1`
    FOREIGN KEY (`Proveedores_NroProveedores`)
    REFERENCES `covid19`.`proveedores` (`NroProveedores`),
  CONSTRAINT `fk_Proveedores_Suministros_Suministros1`
    FOREIGN KEY (`Suministros_CodigoSuministro`)
    REFERENCES `covid19`.`suministros` (`CodigoSuministro`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `covid19`.`terapia_intensiva`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `covid19`.`terapia_intensiva` ;

CREATE TABLE IF NOT EXISTS `covid19`.`terapia_intensiva` (
  `Camas_NroCama` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Respirador` INT NOT NULL,
  PRIMARY KEY (`Camas_NroCama`),
  UNIQUE INDEX `Camas_NroCama_UNIQUE` (`Camas_NroCama` ASC) VISIBLE,
  INDEX `fk_Terapia_Intensiva_Camas1_idx` (`Camas_NroCama` ASC) VISIBLE,
  CONSTRAINT `fk_Terapia_Intensiva_Camas1`
    FOREIGN KEY (`Camas_NroCama`)
    REFERENCES `covid19`.`camas` (`NroCama`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `covid19`.`titulos_y_capacitacion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `covid19`.`titulos_y_capacitacion` ;

CREATE TABLE IF NOT EXISTS `covid19`.`titulos_y_capacitacion` (
  `Empleados_Personas_DNI` INT UNSIGNED NOT NULL,
  `Capacitacion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Capacitacion`),
  INDEX `fk_Titulos_y_Capacitacione_Empleados1_idx` (`Empleados_Personas_DNI` ASC) VISIBLE,
  CONSTRAINT `fk_Titulos_y_Capacitacione_Empleados1`
    FOREIGN KEY (`Empleados_Personas_DNI`)
    REFERENCES `covid19`.`empleados` (`Personas_DNI`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `covid19`.`Salida_Paciente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `covid19`.`Salida_Paciente` ;

CREATE TABLE IF NOT EXISTS `covid19`.`Salida_Paciente` (
  `pacienteinternado_Internado_Personas_DNI` INT UNSIGNED NOT NULL,
  `FH_Salida` DATETIME NULL,
  PRIMARY KEY (`pacienteinternado_Internado_Personas_DNI`),
  CONSTRAINT `fk_Salida_Paciente_pacienteinternado1`
    FOREIGN KEY (`pacienteinternado_Internado_Personas_DNI`)
    REFERENCES `covid19`.`pacienteinternado` (`Internado_Personas_DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `covid19`.`HistorialClinico`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `covid19`.`HistorialClinico` ;

CREATE TABLE IF NOT EXISTS `covid19`.`HistorialClinico` (
  `pacientes_Personas_DNI` INT UNSIGNED NOT NULL,
  `Enfermedades` VARCHAR(45) NULL,
  CONSTRAINT `fk_HistoriaClinico_pacientes1`
    FOREIGN KEY (`pacientes_Personas_DNI`)
    REFERENCES `covid19`.`pacientes` (`Personas_DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `covid19`.`muestra_empleado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `covid19`.`muestra_empleado` ;

CREATE TABLE IF NOT EXISTS `covid19`.`muestra_empleado` (
  `NroTesteo` VARCHAR(45) NOT NULL,
  `empleados_Personas_DNI` INT UNSIGNED NOT NULL,
  `Resultado` VARCHAR(45) NULL,
  `Fecha_muestra` DATE NULL,
  PRIMARY KEY (`NroTesteo`),
  INDEX `fk_muestra_empleado_empleados1_idx` (`empleados_Personas_DNI` ASC) VISIBLE,
  CONSTRAINT `fk_muestra_empleado_empleados1`
    FOREIGN KEY (`empleados_Personas_DNI`)
    REFERENCES `covid19`.`empleados` (`Personas_DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
