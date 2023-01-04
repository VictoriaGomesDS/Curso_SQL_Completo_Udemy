-- EXERCÍCIOS ########################################################################

-- (Exercício 1) Identifique quais as marcas de veículo mais visitada na tabela sales.funnel

SELECT prod.brand AS marca,
	   COUNT(fun.visit_page_date) AS contagem_de_visitas
FROM sales.funnel AS fun
LEFT JOIN sales.products AS prod
	ON fun.product_id = prod.product_id
GROUP BY prod.brand
ORDER BY COUNT(fun.visit_page_date) DESC;



-- (Exercício 2) Identifique quais as lojas de veículo mais visitadas na tabela sales.funnel

SELECT store.store_id AS id_loja,
	   store.store_name AS nome_loja,
	   COUNT(fun.visit_page_date) AS contagem
FROM sales.funnel AS fun
LEFT JOIN sales.stores AS store
	ON fun.store_id = store.store_id
GROUP BY store.store_id
ORDER BY COUNT(fun.visit_page_date) DESC;



-- (Exercício 3) Identifique quantos clientes moram em cada tamanho de cidade (o porte da cidade
-- consta na coluna "size" da tabela temp_tables.regions)

SELECT
	reg.size AS tamanho_regiao,
	COUNT(*) AS contagem
FROM sales.customers AS cus
LEFT JOIN temp_tables.regions AS reg
	ON LOWER(cus.city) = LOWER(reg.city)
	AND LOWER(cus.state) = LOWER(reg.state)
GROUP BY reg.size
ORDER BY contagem;



