-- EXERCÍCIOS ######################################################################

-- (Exercício 1) Selecione os nomes de cidade distintas que existem no estado de
-- Minas Gerais em ordem alfabética (dados da tabela sales.customers)

SELECT DISTINCT state,
	   city
FROM sales.customers
WHERE state = 'MG'
ORDER BY city;


-- (Exercício 2) Selecione o visit_id das 10 compras mais recentes efetuadas
-- (dados da tabela sales.funnel)

SELECT visit_id
FROM sales.funnel
LIMIT 10;


-- (Exercício 3) Selecione todos os dados dos 10 clientes com maior score nascidos
-- após 01/01/2000 (dados da tabela sales.customers)

SELECT *
FROM sales.customers
WHERE birth_date > '20000101'
ORDER BY score DESC
LIMIT 10;




