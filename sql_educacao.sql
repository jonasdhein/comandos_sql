SELECT id, DATE_PART('year', age(data_nascimento)) as idade, 
data_nascimento 
FROM candidatos
ORDER BY DATE_PART('year', age(data_nascimento));

--LISTAR O NIVEL DE ENSINO DO CANDIDATO
SELECT
FROM candidatos c, ...

--LISTAR A TURMA DA ESCOLA DE ACORCO COM A FAIXA ETÁRIA DO CANDIDATO
SELECT 
FROM candidatos c, 



SELECT * FROM candidatos_escolas

UPDATE candidatos_escolas 
SET id_turma = ???;
