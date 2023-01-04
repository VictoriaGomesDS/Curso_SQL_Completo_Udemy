-- EXERCÍCIOS ########################################################################

-- (Exemplo 1) Identifique qual é o status profissional mais frequente nos clientes 
-- que compraram automóveis no site

SELECT cus.professional_status AS Status_Profissional,
	   COUNT(fun.paid_date) AS Contagem
FROM sales.funnel AS fun
LEFT JOIN sales.customers AS cus
ON fun.customer_id = cus.customer_id
GROUP BY cus.professional_status
ORDER BY COUNT(fun.paid_date) DESC;



-- (Exemplo 2) Identifique qual é o gênero mais frequente nos clientes que compraram
-- automóveis no site. Obs: Utilizar a tabela temp_tables.ibge_genders

SELECT ibge.gender AS Genero,
	   COUNT(fun.paid_date) AS Contagem
FROM sales.funnel AS fun
LEFT JOIN sales.customers AS cus 
	ON fun.customer_id = cus.customer_id
LEFT JOIN temp_tables.ibge_genders AS ibge 
	ON LOWER(cus.first_name) = ibge.first_name
GROUP BY ibge.gender
ORDER BY COUNT(fun.paid_date) DESC;



-- (Exemplo 3) Identifique de quais regiões são os clientes que mais visitam o site
-- Obs: Utilizar a tabela temp_tables.regions

SELECT regioes.region AS regiao,
	   COUNT(fun.visit_page_date) AS numero_visitas
FROM sales.funnel AS fun
LEFT JOIN sales.customers AS cus 
	ON fun.customer_id = cus.customer_id
LEFT JOIN temp_tables.regions AS regioes
	ON cus.state = regioes.state
GROUP BY regioes.region
ORDER BY COUNT(fun.visit_page_date) DESC;




