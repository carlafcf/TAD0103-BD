CREATE TABLE professor (
      id SERIAL,
      nome TEXT,
      CPF CHAR(14),
      PRIMARY KEY(id)
);

CREATE TABLE turma (
    codigo INT,
	numero INT,
	duracao_dias INT NOT NULL,
	id_professor INT,
	PRIMARY KEY(codigo, numero),
	FOREIGN KEY(id_professor) REFERENCES professor(id)
);

INSERT INTO Professor (nome, CPF) VALUES ('Carla', '035.641.688-22');
INSERT INTO Professor (nome, CPF) VALUES ('Danilo', '003.421.445-77');
INSERT INTO Professor (nome, CPF) VALUES ('Daniel', '344.568.222-54');
INSERT INTO Professor (nome, CPF) VALUES ('Alice', '098.765.432-11');
INSERT INTO Turma (codigo, numero, duracao_dias, id_professor) VALUES (1, 1, 60, 1);
INSERT INTO Turma (codigo, numero, duracao_dias, id_professor) VALUES (1, 2, 70, 1); 
INSERT INTO Turma (codigo, numero, duracao_dias, id_professor) VALUES (1, 3, 80, 2); 
INSERT INTO Turma (codigo, numero, duracao_dias, id_professor) VALUES (2, 1, 10, 2);


SELECT nome, duracao_dias
FROM Turma, Professor
WHERE id_professor = id AND
		duracao_dias > 50;

SELECT c.nome
FROM Coordenador c, Departamento d, Professor p, Turma t
WHERE d.id_coordenador = c.id AND
		p.id_departamento = d.id AND
		t.id_professor = p.id AND
		codigo = 1 AND numero = 2;
























