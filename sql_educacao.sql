--LISTAR idade DO CANDIDATO
SELECT id, DATE_PART('year', age(data_nascimento)) as idade, 
data_nascimento 
FROM candidatos
ORDER BY DATE_PART('year', age(data_nascimento));

--LISTAR O NIVEL DE ENSINO DO CANDIDATO
SELECT c.id, c.data_nascimento, DATE_PART('year', age(data_nascimento)) as idade,
n.nome, n.idade_inicio, n.idade_fim
FROM candidatos c, niveis_ensino n
WHERE DATE_PART('year', age(data_nascimento)) >= idade_inicio 
AND DATE_PART('year', age(data_nascimento)) < idade_fim
