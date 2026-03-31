-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema universidade
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema universidade
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `universidade` DEFAULT CHARACTER SET utf8mb3 ;
USE `universidade` ;

-- -----------------------------------------------------
-- Table `universidade`.`professor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `universidade`.`professor` (
  `matriculaProfessor` INT NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `nome` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`matriculaProfessor`),
  UNIQUE INDEX `Email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `universidade`.`curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `universidade`.`curso` (
  `codigoCurso` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `cargaHoraria` INT NOT NULL DEFAULT 3600,
  `professorMatricula` INT NOT NULL,
  PRIMARY KEY (`codigoCurso`),
  INDEX `fk_Curso_Professor1_idx` (`professorMatricula` ASC) VISIBLE,
  UNIQUE INDEX `Professor_Matricula_UNIQUE` (`professorMatricula` ASC) VISIBLE,
  CONSTRAINT `fk_Curso_Professor1`
    FOREIGN KEY (`professorMatricula`)
    REFERENCES `universidade`.`professor` (`matriculaProfessor`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `universidade`.`aluno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `universidade`.`aluno` (
  `matricula` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `curso_Codigo` INT NULL,
  PRIMARY KEY (`matricula`),
  INDEX `fk_Aluno_Curso1_idx` (`curso_Codigo` ASC) VISIBLE,
  CONSTRAINT `fk_Aluno_Curso1`
    FOREIGN KEY (`curso_Codigo`)
    REFERENCES `universidade`.`curso` (`codigoCurso`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `universidade`.`materia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `universidade`.`materia` (
  `codigoMateria` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `cargaHorariaMin` INT NOT NULL,
  PRIMARY KEY (`codigoMateria`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `universidade`.`curso_has_materia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `universidade`.`curso_has_materia` (
  `cursoCodigo` INT NOT NULL,
  `materiaCodigo` INT NOT NULL,
  PRIMARY KEY (`cursoCodigo`, `materiaCodigo`),
  INDEX `fk_Curso_has_Materia_Materia1_idx` (`materiaCodigo` ASC) VISIBLE,
  INDEX `fk_Curso_has_Materia_Curso1_idx` (`cursoCodigo` ASC) VISIBLE,
  CONSTRAINT `fk_Curso_has_Materia_Curso1`
    FOREIGN KEY (`cursoCodigo`)
    REFERENCES `universidade`.`curso` (`codigoCurso`),
  CONSTRAINT `fk_Curso_has_Materia_Materia1`
    FOREIGN KEY (`materiaCodigo`)
    REFERENCES `universidade`.`materia` (`codigoMateria`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `universidade`.`disciplina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `universidade`.`disciplina` (
  `codigoDisciplina` INT NOT NULL,
  `vagas` INT NOT NULL,
  `semestre` VARCHAR(45) NOT NULL,
  `materiaCodigo` INT NOT NULL,
  `professorMatricula` INT NOT NULL,
  PRIMARY KEY (`codigoDisciplina`),
  INDEX `fk_Disciplina_Materia1_idx` (`materiaCodigo` ASC) VISIBLE,
  INDEX `fk_Disciplina_Professor1_idx` (`professorMatricula` ASC) VISIBLE,
  CONSTRAINT `fk_Disciplina_Materia1`
    FOREIGN KEY (`materiaCodigo`)
    REFERENCES `universidade`.`materia` (`codigoMateria`),
  CONSTRAINT `fk_Disciplina_Professor1`
    FOREIGN KEY (`professorMatricula`)
    REFERENCES `universidade`.`professor` (`matriculaProfessor`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `universidade`.`disciplina_has_aluno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `universidade`.`disciplina_has_aluno` (
  `disciplinaCodigo` INT NOT NULL,
  `alunoMatricula` INT NOT NULL,
  PRIMARY KEY (`disciplinaCodigo`, `alunoMatricula`),
  INDEX `fk_Disciplina_has_Aluno_Aluno1_idx` (`alunoMatricula` ASC) VISIBLE,
  INDEX `fk_Disciplina_has_Aluno_Disciplina1_idx` (`disciplinaCodigo` ASC) VISIBLE,
  CONSTRAINT `fk_Disciplina_has_Aluno_Aluno1`
    FOREIGN KEY (`alunoMatricula`)
    REFERENCES `universidade`.`aluno` (`matricula`),
  CONSTRAINT `fk_Disciplina_has_Aluno_Disciplina1`
    FOREIGN KEY (`disciplinaCodigo`)
    REFERENCES `universidade`.`disciplina` (`codigoDisciplina`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `universidade`.`emailaluno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `universidade`.`emailaluno` (
  `email` VARCHAR(255) NOT NULL,
  `alunoMatricula` INT NOT NULL,
  PRIMARY KEY (`alunoMatricula`, `email`),
  INDEX `fk_EmailAluno_Aluno1_idx` (`alunoMatricula` ASC) VISIBLE,
  CONSTRAINT `fk_EmailAluno_Aluno1`
    FOREIGN KEY (`alunoMatricula`)
    REFERENCES `universidade`.`aluno` (`matricula`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `universidade`.`prerequisito`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `universidade`.`prerequisito` (
  `materiaCodigoPre` INT NOT NULL,
  `materiaCodigo` INT NOT NULL,
  PRIMARY KEY (`materiaCodigoPre`, `materiaCodigo`),
  INDEX `fk_PreRequisito_Materia_idx` (`materiaCodigoPre` ASC) VISIBLE,
  INDEX `fk_prerequisito_materia1_idx` (`materiaCodigo` ASC) VISIBLE,
  CONSTRAINT `fk_PreRequisito_Materia`
    FOREIGN KEY (`materiaCodigoPre`)
    REFERENCES `universidade`.`materia` (`codigoMateria`),
  CONSTRAINT `fk_prerequisito_materia1`
    FOREIGN KEY (`materiaCodigo`)
    REFERENCES `universidade`.`materia` (`codigoMateria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

ALTER TABLE universidade.professor 
ADD CONSTRAINT chk_matricula_digitos 
CHECK (matriculaProfessor BETWEEN 1000 AND 9999);

ALTER TABLE universidade.materia 
ADD CONSTRAINT chk_carga_minima 
CHECK (cargaHorariaMin >= 40);

ALTER TABLE universidade.disciplina 
ADD CONSTRAINT chk_vagas_limite 
CHECK (vagas <= 60);

ALTER TABLE universidade.professor 
ADD CONSTRAINT chk_matricula_professor_4_digitos 
CHECK (matriculaProfessor BETWEEN 1000 AND 9999);
