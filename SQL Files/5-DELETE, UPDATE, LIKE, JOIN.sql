CREATE TABLE Departamento (
	id SERIAL PRIMARY KEY,
	nome TEXT NOT NULL,
	data_inicio DATE
);

CREATE TABLE Empregado (
	matricula INTEGER,
	nome TEXT NOT NULL,
	endereco TEXT,
	salario DECIMAL(10,2),
	supervisor INTEGER,
	id_depto INTEGER,
	PRIMARY KEY (matricula),
	FOREIGN KEY (supervisor) REFERENCES Empregado(matricula), 
	FOREIGN KEY (id_depto) REFERENCES Departamento(id)
);

CREATE TABLE Gerencia ( 
	id_depto SERIAL PRIMARY KEY,
	matricula_emp INTEGER,
	FOREIGN KEY (matricula_emp) REFERENCES Empregado(matricula), 
	FOREIGN KEY (id_depto) REFERENCES Departamento(id)
);

CREATE TABLE Projeto (
	id SERIAL,
	nome TEXT NOT NULL,
	local TEXT NOT NULL,
	id_depto INTEGER,
	PRIMARY KEY(id),
	FOREIGN KEY (id_depto) REFERENCES Departamento(id)
);

CREATE TABLE Alocacao (
	id_projeto INTEGER,
	matricula_emp INTEGER,
	horas INTEGER,
	PRIMARY KEY(id_projeto, matricula_emp),
	FOREIGN KEY (matricula_emp) REFERENCES Empregado(matricula), 
	FOREIGN KEY (id_projeto) REFERENCES Projeto(id)
);

CREATE TABLE Dependente (
	id SERIAL,
	nome TEXT NOT NULL,
	sexo CHAR(1) NOT NULL,
	matricula_responsavel INTEGER,
	PRIMARY KEY(id),
	FOREIGN KEY (matricula_responsavel) REFERENCES Empregado(matricula)
);

INSERT INTO Departamento (nome, data_inicio) VALUES ('Pesquisa', '2019-11-09'); 
INSERT INTO Departamento (nome, data_inicio) VALUES ('Cozinha', '2009-08-05'); 
INSERT INTO Departamento (nome, data_inicio) VALUES ('Estudo', '2020-03-17'); 
INSERT INTO Departamento (nome, data_inicio) VALUES ('Ciencia', '2010-03-09'); 
INSERT INTO Departamento (nome, data_inicio) VALUES ('Compras', '2012-09-09');

INSERT INTO Empregado (matricula, nome, endereco, salario, id_depto) VALUES (273729, 'Carla', 'Rua A', 1000.20, 3);
INSERT INTO Empregado VALUES (777746, 'Danilo', 'Rua B', 2000.20, 273729, 3); 
INSERT INTO Empregado VALUES (988716, 'Daniel', 'Rua C', 100.20, 273729, 2); 
INSERT INTO Empregado VALUES (483292, 'Alice', 'Rua D', 2000.20, 777746, 2); 
INSERT INTO Empregado VALUES (553211, 'Picachu', 'Rua E', 20.20, 777746, 2);

INSERT INTO Gerencia VALUES (1, 273729);
INSERT INTO Gerencia VALUES (2, 777746);
INSERT INTO Gerencia VALUES (3, 273729);

INSERT INTO Projeto (nome, local, id_depto) VALUES ('Projeto Alpha', 'Natal', 1); 
INSERT INTO Projeto (nome, local, id_depto) VALUES ('Projeto Beta', 'Recife', 1); 
INSERT INTO Projeto (nome, local, id_depto) VALUES ('Projeto Delta', 'Natal', 1); 
INSERT INTO Projeto (nome, local, id_depto) VALUES ('Projeto Gama', 'Natal', 2);

INSERT INTO Alocacao VALUES (1, 273729, 40);
INSERT INTO Alocacao VALUES (2, 273729, 20);
INSERT INTO Alocacao VALUES (3, 777746, 60);
INSERT INTO Alocacao VALUES (3, 988716, 40);
INSERT INTO Alocacao VALUES (3, 483292, 40);

INSERT INTO Dependente (nome, sexo, matricula_responsavel) VALUES ('Filho 1', 'M', 273729); 
INSERT INTO Dependente (nome, sexo, matricula_responsavel) VALUES ('Filha 2', 'F', 273729);

SELECT *
FROM Dependente;

DELETE FROM Dependente;

DELETE FROM Dependente
WHERE sexo='M';

DELETE FROM Dependente
WHERE id=4;

UPDATE Dependente
SET nome='Alice';

UPDATE Dependente
SET nome='Daniel'
WHERE id=5;

ALTER TABLE projeto
ADD ativo BOOLEAN DEFAULT true;

SELECT *
FROM Projeto;

UPDATE projeto
SET ativo=false
WHERE id=2;

SELECT *
FROM Projeto
WHERE ativo=true;

SELECT *
FROM Projeto
WHERE ativo=false;

UPDATE Empregado
SET nome='Carla Fernandes Curvelo'
WHERE matricula=273729;

SELECT *
FROM Empregado;

SELECT *
FROM Empregado
WHERE nome='Carla';

SELECT * FROM Empregado;

UPDATE Empregado
SET nome='Eu Carla Curvelo'
WHERE matricula=777746;

UPDATE Empregado
SET nome='Carla Curvelo'
WHERE matricula=553211;

SELECT *
FROM Empregado
WHERE nome = 'Carla';

SELECT *
FROM Empregado
WHERE nome ILIKE '%carla%';

SELECT *
FROM Projeto JOIN Alocacao ON id=id_projeto;

SELECT e.nome, p.nome
FROM (Projeto p FULL OUTER JOIN Alocacao ON id=id_projeto)
		FULL OUTER JOIN Empregado e ON matricula_emp=matricula;























 




 