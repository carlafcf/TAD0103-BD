CREATE TABLE Curso (
	id SERIAL PRIMARY KEY,
	codigo TEXT UNIQUE NOT NULL,
	nome TEXT NOT NULL,
	instituicao TEXT NOT NULL,
	duracao INT NOT NULL,
	ativo BOOLEAN NOT NULL
);

CREATE TABLE Aluno (
	id SERIAL PRIMARY KEY,
	nome TEXT NOT NULL,
	sobrenome TEXT NOT NULL,
	endereco TEXT,
	data_nascimento DATE
)

CREATE TABLE CursoAluno (
	id SERIAL PRIMARY KEY,
	id_aluno INT REFERENCES Aluno(id),
	id_curso INT REFERENCES Curso(id),
	ativo BOOLEAN NOT NULL DEFAULT True,
	ano_ingresso INT NOT NULL
)

ALTER TABLE Curso ALTER COLUMN duracao SET DEFAULT 0;
ALTER TABLE Curso ALTER COLUMN ativo SET DEFAULT True;

INSERT INTO Curso (codigo, nome, instituicao, duracao) VALUES ('EAJ0001', 'TADS', 'UFRN', 2000);
INSERT INTO Curso (codigo, nome, instituicao, duracao) VALUES ('EAJ0002', 'Agronomia', 'UFRN', 3000);
INSERT INTO Curso (codigo, nome, instituicao, duracao) VALUES ('DCA0001', 'Eng.Comp.', 'UFRN', 4000);
INSERT INTO Curso (codigo, nome, instituicao) VALUES ('IMD0001', 'BTI', 'UFRN');
INSERT INTO Curso (codigo, nome, instituicao) VALUES ('IMD0010', 'BTI', 'UERN');

INSERT INTO Aluno (nome, sobrenome) VALUES
	('Carla', 'Fernandes'),
	('Carla', 'Curvelo'),
	('Danilo', 'Curvelo'),
	('Daniel', 'F. Curvelo'),
	('Alice', 'Fernandes Curvelo'),
	('Flávia', 'Fernandes'),
	('Silvia', 'Fernandes'),
	('Flávio', 'Lisboa'),
	('Faber', 'Mesquita'),
	('Carla', 'F. Curvelo');
	
SELECT * FROM Curso;
SELECT * FROM Aluno;
SELECT * FROM CursoAluno;

INSERT INTO CursoAluno (id_aluno, id_curso, ano_ingresso) VALUES
	(1, 2, 2000),
	(1, 3, 2000),
	(1, 4, 2000),
	(2, 2, 2000),
	(2, 3, 2000),
	(3, 2, 2000),
	(4, 2, 2000),
	(5, 5, 2000);

-- Questão 7
UPDATE Curso
SET duracao = 2475
WHERE nome = 'TADS' AND instituicao = 'UFRN';

-- Questão 8
-- DELETE FROM Curso
-- WHERE nome = 'Eng.Comp.' AND instituicao = 'UFRN';

UPDATE Curso
SET ativo = False
WHERE nome = 'Eng.Comp.' AND instituicao = 'UFRN';

-- Questão 9
INSERT INTO Aluno (nome, sobrenome) VALUES
	('Ana Carla', 'Fernandes'),
	('carla f.', 'curvelo');
	
SELECT nome, sobrenome
FROM Aluno
WHERE nome = 'Carla' OR sobrenome = 'Carla';

SELECT nome, sobrenome
FROM Aluno
WHERE nome LIKE '%Carla%' OR sobrenome LIKE '%Carla%';

SELECT nome, sobrenome
FROM Aluno
WHERE UPPER(nome) LIKE '%CARLA%' OR UPPER(sobrenome) LIKE '%CARLA%';

-- Questão 10

SELECT a.id, a.nome, a.sobrenome, COUNT(*)
FROM (Curso c JOIN CursoAluno ca ON ca.id_curso = c.id)
		JOIN Aluno a ON ca.id_aluno = a.id
WHERE c.ativo = True
GROUP BY a.id
HAVING COUNT(*) > 1;

-- Questão 15
SELECT c.id, c.nome, COUNT(*)
FROM (Curso c JOIN CursoAluno ca ON ca.id_curso = c.id)
		JOIN Aluno a ON ca.id_aluno = a.id
WHERE c.ativo = TRUE
GROUP BY c.id
HAVING COUNT(*) > 2
ORDER BY c.id

-- Questão 11
SELECT * FROM Curso;

SELECT instituicao, ROUND(AVG(duracao),2)
FROM Curso
GROUP BY instituicao
ORDER BY instituicao

-- QUESTÃO 12
SELECT nome, instituicao, duracao
FROM Curso
WHERE duracao IN
		(SELECT MIN(duracao)
		FROM Curso)

SELECT nome, instituicao, duracao
FROM Curso
WHERE duracao IN
		(SELECT MAX(duracao)
		FROM Curso)

-- Questão 13
SELECT instituicao, COUNT(*)
FROM Curso
WHERE ativo = True
GROUP BY instituicao
ORDER BY instituicao

-- Questão 14
SELECT id_curso, COUNT(*)
FROM CursoAluno
WHERE ativo = TRUE
GROUP BY id_curso
ORDER BY id_curso

-- Questão 16		
(SELECT a.nome, a.sobrenome
FROM Aluno a JOIN CursoAluno ca ON ca.id_aluno = a.id
WHERE ca.id_curso IN (
		SELECT id
		FROM Curso
		WHERE nome = 'TADS' AND instituicao = 'UFRN'))	
EXCEPT
(SELECT a.nome, a.sobrenome
FROM Aluno a JOIN CursoAluno ca ON ca.id_aluno = a.id
WHERE ca.id_curso NOT IN (
		SELECT id
		FROM Curso
		WHERE nome = 'TADS' AND instituicao = 'UFRN'))

-- Questão 17
(SELECT a.nome, a.sobrenome
FROM Aluno a JOIN CursoAluno ca ON ca.id_aluno = a.id
WHERE ca.id_curso IN (
		SELECT id
		FROM Curso
		WHERE nome = 'TADS' AND instituicao = 'UFRN'))	
INTERSECT
(SELECT a.nome, a.sobrenome
FROM Aluno a JOIN CursoAluno ca ON ca.id_aluno = a.id
WHERE ca.id_curso IN (
		SELECT id
		FROM Curso
		WHERE nome = 'Eng.Comp.' AND instituicao = 'UFRN'))

-- CRIAÇÃO DE VIEW

CREATE VIEW AlunosMatriculados AS
SELECT nome, sobrenome, ca.id_aluno AS id, id_curso, ativo
FROM Aluno a JOIN CursoAluno ca ON ca.id_aluno = a.id;

SELECT *
FROM AlunosMatriculados;

(SELECT nome, sobrenome
FROM AlunosMatriculados
WHERE id_curso IN (
		SELECT id
		FROM Curso
		WHERE nome = 'TADS' AND instituicao = 'UFRN'))	
EXCEPT
(SELECT nome, sobrenome
FROM AlunosMatriculados
WHERE id_curso NOT IN (
		SELECT id
		FROM Curso
		WHERE nome = 'TADS' AND instituicao = 'UFRN'))
