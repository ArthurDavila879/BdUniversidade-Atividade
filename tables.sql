CREATE SCHEMA IF NOT EXISTS `universidade` DEFAULT CHARACTER SET utf8mb3 ;
USE `universidade` ;


CREATE TABLE IF NOT EXISTS professor (
  MatriculaProfessor INT NOT NULL,
  Email VARCHAR(255) NOT NULL,

  PRIMARY KEY (MatriculaProfessor),
  UNIQUE INDEX Email_UNIQUE (Email),
  
  CONSTRAINT chk_prof_matricula 
    CHECK (MatriculaProfessor BETWEEN 1000 AND 9999),

  CONSTRAINT chk_prof_email
    CHECK (Email LIKE '%@%.%')
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;



CREATE TABLE IF NOT EXISTS curso (
  CodigoCurso INT NOT NULL,
  Nome VARCHAR(45) NOT NULL,
  CargaHoraria INT NOT NULL DEFAULT 3600,
  Professor_Matricula INT NOT NULL,

  PRIMARY KEY (CodigoCurso),

  CONSTRAINT chk_curso_carga
    CHECK (CargaHoraria >= 1000),

  FOREIGN KEY (Professor_Matricula)
    REFERENCES professor (MatriculaProfessor)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;



CREATE TABLE IF NOT EXISTS aluno (
  Matricula INT NOT NULL,
  Nome VARCHAR(45) NOT NULL,
  Curso_Codigo INT NULL,

  PRIMARY KEY (Matricula),

  CONSTRAINT chk_aluno_matricula
    CHECK (Matricula > 0),

  FOREIGN KEY (Curso_Codigo)
    REFERENCES curso (CodigoCurso)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;



CREATE TABLE IF NOT EXISTS materia (
  CodigoMateria INT NOT NULL,
  Nome VARCHAR(45) NOT NULL,
  CargaHorariaMin INT NOT NULL,

  PRIMARY KEY (CodigoMateria),

  CONSTRAINT chk_materia_carga
    CHECK (CargaHorariaMin > 0)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;



CREATE TABLE IF NOT EXISTS curso_has_materia (
  Curso_Codigo INT NOT NULL,
  Materia_Codigo INT NOT NULL,

  PRIMARY KEY (Curso_Codigo, Materia_Codigo),

  FOREIGN KEY (Curso_Codigo)
    REFERENCES curso (CodigoCurso),

  FOREIGN KEY (Materia_Codigo)
    REFERENCES materia (CodigoMateria)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;



CREATE TABLE IF NOT EXISTS disciplina (
  CodigoDisciplina INT NOT NULL,
  Vagas INT NOT NULL,
  Semestre VARCHAR(7) NOT NULL,
  Materia_Codigo INT NOT NULL,
  Professor_Matricula INT NOT NULL,

  PRIMARY KEY (CodigoDisciplina),

  CONSTRAINT chk_disc_vagas
    CHECK (Vagas > 0),

  CONSTRAINT chk_disc_semestre
    CHECK (Semestre REGEXP '^[0-9]{4}\\.[12]$'),

  FOREIGN KEY (Materia_Codigo)
    REFERENCES materia (CodigoMateria),

  FOREIGN KEY (Professor_Matricula)
    REFERENCES professor (MatriculaProfessor)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;



CREATE TABLE IF NOT EXISTS disciplina_has_aluno (
  Disciplina_CodigoDisciplina INT NOT NULL,
  Aluno_Matricula INT NOT NULL,

  PRIMARY KEY (Disciplina_CodigoDisciplina, Aluno_Matricula),

  FOREIGN KEY (Aluno_Matricula)
    REFERENCES aluno (Matricula),

  FOREIGN KEY (Disciplina_CodigoDisciplina)
    REFERENCES disciplina (CodigoDisciplina)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;



CREATE TABLE IF NOT EXISTS emailaluno (
  Email VARCHAR(255) NOT NULL,
  Aluno_Matricula INT NOT NULL,

  PRIMARY KEY (Aluno_Matricula, Email),

  CONSTRAINT chk_emailaluno_email
    CHECK (Email LIKE '%@%.%'),

  FOREIGN KEY (Aluno_Matricula)
    REFERENCES aluno (Matricula)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;



CREATE TABLE IF NOT EXISTS prerequisito (
  CodigoMateriaPre INT NOT NULL,
  Materia_Codigo INT NOT NULL,

  PRIMARY KEY (CodigoMateriaPre, Materia_Codigo),

  CONSTRAINT chk_prereq_diferente
    CHECK (CodigoMateriaPre <> Materia_Codigo),

  FOREIGN KEY (Materia_Codigo)
    REFERENCES materia (CodigoMateria)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;
