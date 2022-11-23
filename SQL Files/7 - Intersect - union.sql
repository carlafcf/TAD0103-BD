CREATE TABLE Produtos (
       referencia VARCHAR(3) PRIMARY KEY,
       descricao TEXT UNIQUE,
       estoque INT NOT NULL DEFAULT 0
);

INSERT INTO Produtos VALUES ('001', 'Feijão', 10);
INSERT INTO Produtos VALUES ('002', 'Arroz', 5);
INSERT INTO Produtos VALUES ('003', 'Farinha', 15);

CREATE TABLE ItensVenda
(
    venda INT,
    produto VARCHAR(3),
    quantidade INT,
    PRIMARY KEY (venda, produto),
    FOREIGN KEY (produto) REFERENCES Produtos(referencia)
);

SELECT *
FROM Produtos;

CREATE OR REPLACE FUNCTION f_diminuir_estoque() RETURNS trigger AS $diminuir_estoque$
    BEGIN
		UPDATE Produtos SET estoque = estoque - NEW.quantidade
		WHERE referencia = NEW.produto;
		RETURN NULL;
    END;
$diminuir_estoque$ LANGUAGE plpgsql;

CREATE TRIGGER diminuir_estoque 
AFTER INSERT ON ItensVenda
    FOR EACH ROW EXECUTE FUNCTION f_diminuir_estoque();
	
CREATE FUNCTION aumentar_estoque() RETURNS trigger AS $aumentar_estoque$
    BEGIN
		UPDATE Produtos SET estoque = estoque + OLD.quantidade
		WHERE referencia = OLD.produto
    END;
$aumentar_estoque$ LANGUAGE plpgsql;

CREATE TRIGGER aumentar_estoque AFTER DELETE ON ItensVenda
    FOR EACH ROW EXECUTE FUNCTION aumentar_estoque();