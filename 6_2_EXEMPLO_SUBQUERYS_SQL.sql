-- EXEMPLOS ########################################################################

-- (Exemplo 1) Análise de recorrência dos leads
-- Calcule o volume de visitas por dia ao site separado por 1ª visita e demais visitas

WITH primeira_visita AS (
	
	SELECT customer_id,
		   MIN(visit_page_date) as visita_1
	FROM sales.funnel
	GROUP BY customer_id
)

SELECT fun.visit_page_date,
	   (fun.visit_page_date <> primeira_visita.visita_1) AS lead_recorrente,
	   COUNT(*)
FROM sales.funnel AS fun
LEFT JOIN primeira_visita
	ON fun.customer_id = primeira_visita.customer_id
GROUP BY fun.visit_page_date, 
		 lead_recorrente
ORDER BY fun.visit_page_date DESC, 
		 lead_recorrente;



-- (Exemplo 2) Análise do preço versus o preço médio
-- Calcule, para cada visita ao site, quanto o preço do um veículo visitado pelo cliente
-- estava acima ou abaixo do preço médio dos veículos daquela marca 
-- (levar em consideração o desconto dado no veículo)

SELECT * FROM sales.products;
SELECT * FROM sales.funnel;

WITH preco_medio AS (
	SELECT brand,
		   AVG(price) AS preco_medio_M
	FROM sales.products
	GROUP BY brand
)

SELECT fun.visit_id,
	   fun.visit_page_date,
	   prod.brand,
	   (prod.price * (1+fun.discount)) AS preco_final,
	   pm.preco_medio_M AS preco_medio_marca,
	   ((prod.price * (1+fun.discount)) - pm.preco_medio_M) AS precoFinal_VS_precoMedioMarca
FROM sales.funnel AS fun
LEFT JOIN sales.products AS prod
	ON fun.product_id = prod.product_id
LEFT JOIN preco_medio AS pm
	ON prod.brand = pm.brand;

