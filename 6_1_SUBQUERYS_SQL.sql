-- PARA QUE SERVE ##################################################################
-- Servem para consultar dados de outras consultas.


-- TIPOS ###########################################################################
-- Subquery no WHERE
-- Subquery com WITH
-- Subquery no FROM
-- Subquery no SELECT


-- EXEMPLOS ########################################################################

-- (Exemplo 1) Subquery no WHERE
-- Informe qual é o veículo mais barato da tabela products
--> Retorna apenas um valor

SELECT *
FROM sales.products
WHERE price = menor_preco;

SELECT *
FROM sales.products
WHERE price = (SELECT MIN(price) 
			   FROM sales.products);



-- (Exemplo 2) Subquery com WITH
-- Calcule a idade média dos clientes por status profissional

WITH alguma_tabela AS (
SELECT professional_status,
	   (current_date - birth_date)/365 as idade
FROM sales.customers
)

SELECT professional_status,
	   AVG(idade) AS idade_media
FROM alguma_tabela
GROUP BY professional_status;



-- (Exemplo 3) Subquery no FROM
-- Calcule a média de idades dos clientes por status profissional

WITH alguma_tabela AS (
SELECT professional_status,
	   (current_date - birth_date)/365 as idade
FROM sales.customers
)

SELECT professional_status,
	   AVG(idade) AS idade_media
FROM (
	   SELECT professional_status,
	   		  (current_date - birth_date)/365 as idade
	   FROM sales.customers
	 ) AS alguma_tabela
GROUP BY professional_status;



-- (Exemplo 4) Subquery no SELECT
-- Na tabela sales.funnel crie uma coluna que informe o nº de visitas acumuladas 
-- que a loja visitada recebeu até o momento

SELECT fun.visit_id,
	   fun.visit_page_date,
	   sto.store_name,
	   (
		   SELECT COUNT(*)
		   FROM sales.funnel AS fun2
		   WHERE fun2.visit_page_date <= fun.visit_page_date
		   AND fun2.store_id = fun.store_id
	   ) AS visitas_acumuladas
FROM sales.funnel AS fun
LEFT JOIN sales.stores AS sto
	ON fun.store_id = sto.store_id
ORDER BY sto.store_name, fun.visit_page_date;



-- RESUMO ##########################################################################
-- (1) Servem para consultar dados de outras consultas.
-- (2) Para que as subqueries no WHERE e no SELECT funcionem, elas devem retornar 
-- apenas um único valor
-- (3) Não é recomendado utilizar subqueries diretamente dentro do FROM pois isso 
-- dificulta a legibilidade da query. 
-- (4) Subquery no SELECT demoram bastante kkk e ela só retorna um dado por linha e coluna
-- então nao sei se da pra usar o group by nela
