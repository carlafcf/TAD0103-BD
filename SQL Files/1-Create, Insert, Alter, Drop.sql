DROP TABLE Bicho;

CREATE TABLE IF NOT EXISTS Dono (
	id SERIAL,
	nome TEXT,
	PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS Bicho (
	id SERIAL PRIMARY KEY,
	nome TEXT,
	raca TEXT,
	idade INT,
	pai_pet INT,
	FOREIGN KEY (pai_pet) REFERENCES Dono(id)
);

INSERT INTO Dono (nome) VALUES ('Carla'), ('Danilo');

INSERT INTO Bicho (nome, raca, idade) VALUES ('Dolly', 'Poodle', 10);
INSERT INTO Bicho (nome, raca, idade, pai_pet) VALUES
	('Lulu', 'Poodle', 10, 1),
	('Marley', 'Pastor', 10, 2),
	('Dudu', 'SRD', 10, 2);

SELECT *
FROM Bicho;

ALTER TABLE Bicho DROP COLUMN idade;
ALTER TABLE Bicho ADD idade INT DEFAULT 0;
ALTER TABLE Bicho ADD peso REAL;
ALTER TABLE Bicho ADD CONSTRAINT fk_dono FOREIGN KEY (pai_pet) REFERENCES Dono(id);
