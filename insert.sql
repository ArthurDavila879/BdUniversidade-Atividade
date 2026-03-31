USE `universidade`;

INSERT INTO professor (matriculaProfessor, email, nome) VALUES 
(1001, 'mario.silva@uni.edu', 'Mário Silva'),
(1002, 'ana.souza@uni.edu', 'Ana Souza'),
(1003, 'claudio.ferreira@uni.edu', 'Cláudio Ferreira');

INSERT INTO curso (codigoCurso, nome, cargaHoraria, professorMatricula) VALUES 
(10, 'Sistemas de Informação', 3200, 1001),
(20, 'Ciência da Computação', 3600, 1002);

INSERT INTO aluno (matricula, nome, curso_Codigo) VALUES 
(50001, 'João Pedro', 10),
(50002, 'Maria Clara', 10),
(50003, 'Lucas Santos', 20);

INSERT INTO emailaluno (email, alunoMatricula) VALUES 
('joao.p@gmail.com', 50001),
('joao.trabalho@empresa.com', 50001),
('maria.c@outlook.com', 50002);

INSERT INTO materia (codigoMateria, nome, cargaHorariaMin) VALUES 
(1, 'Algoritmos I', 60),
(2, 'Estrutura de Dados', 80),
(3, 'Cálculo I', 72);

INSERT INTO prerequisito (materiaCodigoPre, materiaCodigo) VALUES (1, 2);

INSERT INTO curso_has_materia (cursoCodigo, materiaCodigo) VALUES 
(10, 1), 
(10, 2), 
(20, 1);

INSERT INTO disciplina (codigoDisciplina, vagas, semestre, materiaCodigo, professorMatricula) VALUES 
(101, 40, '2024.1', 1, 1001),
(102, 30, '2024.1', 2, 1003);

INSERT INTO disciplina_has_aluno (disciplinaCodigo, alunoMatricula) VALUES 
(101, 50001),
(101, 50002),
(102, 50001);

