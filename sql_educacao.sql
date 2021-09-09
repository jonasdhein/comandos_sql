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

--LISTAR A TURMA DA ESCOLA DE ACORCO COM A FAIXA ETÁRIA DO CANDIDATO
SELECT c.nome, c.data_nascimento, t.id as turma, n.idade_inicio, n.idade_fim
FROM candidatos_escolas ce, candidatos c, niveis_ensino n, turmas t
WHERE DATE_PART('year', age(data_nascimento)) >= idade_inicio 
AND DATE_PART('year', age(data_nascimento)) < idade_fim
AND c.id = ce.id_candidato AND n.id = t.id_nivel_ensino 
AND t.id_escola = ce.id_escola
ORDER BY c.id

--ATUALIZAR A TURMA DENTRO DE CANDIDATOS_ESCOLAS
UPDATE candidatos_escolas ce1
SET id_turma = (SELECT t.id
FROM candidatos_escolas ce, candidatos c, niveis_ensino n, turmas t
WHERE DATE_PART('year', age(data_nascimento)) >= idade_inicio 
AND DATE_PART('year', age(data_nascimento)) < idade_fim
AND c.id = ce.id_candidato AND n.id = t.id_nivel_ensino 
AND t.id_escola = ce.id_escola
AND ce1.id_candidato = c.id)
