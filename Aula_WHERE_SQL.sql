-- PARA QUE SERVE ##################################################################
-- Serve para filtrar linhas de acordo com uma condição


-- SINTAXE #########################################################################
select coluna_1, coluna_2, coluna_3
from schema_1.tabela_1
where condição_x=true


-- EXEMPLOS ########################################################################

-- (Exemplo 1) Filtro com condição única
-- Liste os emails dos clientes da nossa base que moram no estado de Santa Catarina

SELECT DISTINCT state
FROM sales.customers; -- vemos que é em sigla!

SELECT state, 
	   email
FROM sales.customers
WHERE state = 'SC'; -- string com aspas simples

-- (Exemplo 2) Filtro com mais de uma condição
-- Liste os emails dos clientes da nossa base que moram no estado de Santa Catarina
-- ou Mato Grosso do Sul

SELECT state, 
	   email
FROM sales.customers
WHERE state = 'SC' 
OR 	  state = 'MS'
ORDER BY state;

-- (Exemplo 3) Filtro de condição com data
-- Liste os emails dos clientes da nossa base que moram no estado de Santa Catarina 
-- ou Mato Grosso do Sul e que tem mais de 30 anos

SELECT DISTINCT birth_date
FROM sales.customers;

SELECT state, 
	   email,
	   birth_date
FROM sales.customers
WHERE state = 'SC' 
OR 	  state = 'MS'
AND   birth_date <= '1992-11-09'
ORDER BY state;

-- TAMBEM PODE SER FEITO DESTA FORMA:
SELECT state, 
	   email,
	   birth_date
FROM sales.customers
WHERE state = 'SC' 
OR 	  state = 'MS'
AND   birth_date <= '19921109' -- SEM OS TRAÇOS
ORDER BY state;



-- RESUMO ##########################################################################
-- (1) Comando utilizado para filtrar linhas de acordo com uma condição
-- (2) No PostgreSQL são utilizadas aspas simples para delimitar strings 
-- (3) string = sequência de caracteres = texto
-- (4) Pode-se combinar mais de uma condição utilizando os operadores lógicos
-- (5) No PostgreSQL as datas são escritas no formato 'YYYY-MM-DD' ou 'YYYYMMDD'
