CREATE DATABASE IF NOT EXISTS universidade;
USE universidade;
CREATE TABLE aluno (
    Matricula INT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL
);
CREATE TABLE professor (
    Matricula INT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Email VARCHAR(150) NOT NULL UNIQUE,

    CONSTRAINT chk_matricula_professor
    CHECK (Matricula BETWEEN 1000 AND 9999),

    CONSTRAINT chk_email_professor
    CHECK (Email LIKE '%@%.%')
);
CREATE TABLE materia (
    Codigo INT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    CargaHoraria INT NOT NULL,

    CONSTRAINT chk_carga_horaria
    CHECK (CargaHoraria > 0)
);
CREATE TABLE disciplina (
    CodigoDisciplina INT PRIMARY KEY,
    Vagas INT NOT NULL,
    Semestre INT NOT NULL,
    Materia_Codigo INT NOT NULL,
    Professor_Matricula INT NOT NULL,

    CONSTRAINT chk_vagas
    CHECK (Vagas BETWEEN 1 AND 60),

    CONSTRAINT chk_semestre
    CHECK (Semestre BETWEEN 1 AND 8),

    CONSTRAINT fk_disciplina_materia
    FOREIGN KEY (Materia_Codigo)
    REFERENCES materia(Codigo),

    CONSTRAINT fk_disciplina_professor
    FOREIGN KEY (Professor_Matricula)
    REFERENCES professor(Matricula)
);
CREATE TABLE emailaluno (
    IdEmail INT AUTO_INCREMENT PRIMARY KEY,
    Aluno_Matricula INT NOT NULL,
    Email VARCHAR(150) NOT NULL,

    CONSTRAINT chk_email_aluno
    CHECK (Email LIKE '%@%.%'),

    CONSTRAINT fk_emailaluno_aluno
    FOREIGN KEY (Aluno_Matricula)
    REFERENCES aluno(Matricula)
);
