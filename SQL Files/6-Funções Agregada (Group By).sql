SELECT *
FROM Empregado;

SELECT SUM(salario), MIN(salario), MAX(salario), AVG(salario)
FROM Empregado;

SELECT SUM(salario), MIN(salario), MAX(salario), AVG(salario)
FROM Empregado
WHERE id_depto=2;

SELECT COUNT(*)
FROM Empregado;

SELECT COUNT(DISTINCT salario)
FROM EMPREGADO;

SELECT id_depto, SUM(salario), MIN(salario), MAX(salario), AVG(salario)
FROM Empregado
WHERE id_depto IS NOT NULL
GROUP BY id_depto;

SELECT id_depto, SUM(salario) as soma, MIN(salario), MAX(salario), AVG(salario)
FROM Empregado e
WHERE id_depto IS NOT NULL
GROUP BY id_depto
HAVING MIN(salario) > 1000;










