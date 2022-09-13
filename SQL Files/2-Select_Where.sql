CREATE TABLE IF NOT EXISTS Empregado (
     id SERIAL,
     matricula VARCHAR(10) NOT NULL,
     nome TEXT NOT NULL,
     sobrenome TEXT NOT NULL,
     PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS Produto (
    id SERIAL,
	nome TEXT NOT NULL,
	valor REAL NOT NULL DEFAULT 10.00, 
	PRIMARY KEY(id)
);

DROP TABLE Produto;

SELECT *
FROM Empregado;

INSERT INTO Empregado (matricula, nome, sobrenome) VALUES ('BAC247', 'Carla', 'Fernandes');
INSERT INTO Empregado (matricula, nome, sobrenome) VALUES ('DJD778', 'Danilo', 'Curvelo');
INSERT INTO Empregado (matricula, nome, sobrenome) VALUES ('BAPQIS', 'Daniel', 'Curvelo'); 
INSERT INTO Empregado (matricula, nome, sobrenome) VALUES ('38JSSH', 'Alice', 'Curvelo'); 
INSERT INTO Empregado (matricula, nome, sobrenome) VALUES ('2JJII9', 'Carla', 'Medeiros');

INSERT INTO Produto (nome, valor) VALUES ('Nesquik', 2.25);
INSERT INTO Produto (nome, valor) VALUES ('Todinho', 1.90);
INSERT INTO Produto (nome, valor) VALUES ('Bisnaguinha', 10.35);
INSERT INTO Produto (nome, valor) VALUES ('Queijo mussarela', 16.60);
INSERT INTO Produto (nome, valor) VALUES ('Mortadela', 10.90);

SELECT *
FROM Produto;

SELECT DISTINCT nome
FROM Empregado;

SELECT nome, sobrenome
FROM Empregado;

SELECT nome
FROM Empregado
WHERE sobrenome = 'Curvelo';

SELECT nome, sobrenome
FROM Empregado
WHERE sobrenome= 'Curvelo' OR sobrenome = 'Fernandes';

SELECT nome, valor
FROM Produto
WHERE valor > 5.50 AND valor < 11;

SELECT nome, valor, valor*0.9
FROM Produto;

SELECT nome, valor, ROUND(CAST(valor*0.9 AS NUMERIC),2)
FROM Produto;

SELECT nome, valor AS valor_inicial, ROUND(CAST(valor*0.9 AS NUMERIC),2) AS valor_desconto
FROM Produto;

SELECT nome || ' ' || sobrenome AS nome_completo
FROM Empregado;





















