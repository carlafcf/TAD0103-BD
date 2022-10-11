CREATE TABLE produto (
	codigo SERIAL PRIMARY KEY,
	quantidade INT,
	preco FLOAT,
	nome TEXT,
	marca TEXT,
	peso FLOAT
);

CREATE TABLE cliente (
	id SERIAL PRIMARY KEY,
	nome TEXT,
	cpf VARCHAR(14),
	data_nascimento DATE,
	endereco TEXT
);
CREATE TABLE venda (
	numero SERIAL PRIMARY KEY,
	preco_total FLOAT,
	cpf_nota_fiscal CHAR(14),
	fk_cliente INT,
	FOREIGN KEY (fk_cliente) REFERENCES cliente (id)
);

CREATE TABLE cupom (
	numero SERIAL PRIMARY KEY,
	mes TEXT,
	fk_venda INT,
	FOREIGN KEY (fk_venda) REFERENCES venda (numero)
);

CREATE TABLE sorteio (
	id SERIAL PRIMARY KEY,
	mes TEXT,
	data DATE,
	premio TEXT
);

CREATE TABLE cupomsorteio (
	fk_cupom INT,
	fk_sorteio INT,
	ganhou BOOL,
	PRIMARY KEY (fk_cupom, fk_sorteio),
	FOREIGN KEY (fk_cupom) REFERENCES cupom (numero),
	FOREIGN KEY (fk_sorteio) REFERENCES sorteio (id)
);

CREATE TABLE produtovenda (
	fk_produto INT,
	fk_venda INT,
	qnt INT,
	preco FLOAT,
	PRIMARY KEY (fk_produto, fk_venda),
	FOREIGN KEY (fk_produto) REFERENCES produto (codigo),
	FOREIGN KEY (fk_venda) REFERENCES venda (numero)
);

INSERT INTO produto (quantidade, preco, nome, marca, peso) VALUES
	(10, 5.50, 'apagador', 'X', 2.50),
	(14, 10.50, 'borracha', 'X', 2.50),
	(13, 1.00, 'lapis', 'X', 2.50),
	(10, 2.50, 'caneta', 'X', 2.50),
	(1, 3.50, 'chave', 'X', 2.50);

INSERT INTO cliente (nome, cpf, data_nascimento, endereco) VALUES
	('Carla', '0123837352', '1988-10-10', 'Rua X'),
	('Alice', '0123837352', '1988-10-10', 'Rua Y'),
	('Danilo', '0123837352', '1988-10-10', 'Rua Z');

INSERT INTO venda (cpf, data, fk_cliente) VALUES
	('011.333.444-55', '2022-10-10', 1),
	('011.333.444-55', '2022-10-10', 1),
	('011.333.444-55', '2022-10-10', 3);

INSERT INTO cupom (mes, fk_venda) VALUES
	('outubro/2022', 1),
	('outubro/2022', 1),
	('outubro/2022', 2),
	('outubro/2022', 2),
	('outubro/2022', 2),
	('novembro/2022', 3);
	
INSERT INTO sorteio (mes, data, premio) VALUES
	('outubro/2022', '2022-09-10', 'Carro'),
	('outubro/2022', '2022-09-10', 'Casa'),
	('novembro/2022', '2022-09-11', 'Celular');

INSERT INTO cupomsorteio (fk_cupom, fk_sorteio, ganhou) VALUES
	(1, 1, false),
	(1, 2, false),
	(2, 1, false),
	(2, 2, false),
	(3, 1, true),
	(4, 1, false),
	(5, 1, false),
	(3, 1, false),
	(4, 1, false),
	(5, 1, true);

SELECT c.nome
FROM cliente c, cupomsorteio cs, venda v, cupom cp
WHERE ganhou = true AND 
	v.fk_cliente = c.id AND
	cp.fk_venda = v.numero AND
	cs.fk_cupom = cp.numero;















