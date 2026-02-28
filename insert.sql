ALTER TABLE disciplina
ADD CONSTRAINT chk_vagas
CHECK (Vagas BETWEEN 1 AND 60);

ALTER TABLE professor
ADD CONSTRAINT chk_matricula_professor
CHECK (Matricula BETWEEN 1000 AND 9999);



INSERT INTO professor (MatriculaProfessor, Email) VALUES
(1234, 'ana.silva@uni.com'),
(2345, 'bruno.lima@uni.com'),
(3456, 'carla.souza@uni.com');

INSERT INTO curso (CodigoCurso, Nome, CargaHoraria, Professor_Matricula) VALUES
(1, 'Ciência da Computação', 3600, 1234),
(2, 'Engenharia de Software', 3600, 2345);

INSERT INTO materia (CodigoMateria, Nome, CargaHorariaMin) VALUES
(10, 'Algoritmos', 60),
(20, 'Banco de Dados', 80),
(30, 'Estruturas de Dados', 70);

INSERT INTO prerequisito (CodigoMateriaPre, Materia_Codigo) VALUES
(10, 20),
(10, 30);

INSERT INTO curso_has_materia (Curso_Codigo, Materia_Codigo) VALUES
(1, 10),
(1, 20),
(1, 30),
(2, 10),
(2, 20);

INSERT INTO disciplina (CodigoDisciplina, Vagas, Semestre, Materia_Codigo, Professor_Matricula) VALUES
(100, 40, '2025.1', 10, 1234),
(101, 35, '2025.1', 20, 2345),
(102, 25, '2025.1', 30, 3456);

INSERT INTO aluno (Matricula, Nome, Curso_Codigo) VALUES
(5001, 'Lucas Pereira', 1),
(5002, 'Mariana Costa', 1),
(5003, 'João Avulso', NULL);

INSERT INTO emailaluno (Aluno_Matricula, Email) VALUES
(5001, 'lucas@gmail.com'),
(5001, 'lucas@outlook.com'),
(5002, 'mariana@gmail.com'),
(5003, 'joao@gmail.com');

INSERT INTO disciplina_has_aluno (Disciplina_CodigoDisciplina, Aluno_Matricula) VALUES
(100, 5001),
(101, 5001),
(100, 5002),
(102, 5003);

