-- PARA QUE SERVE ##################################################################
-- Servem para combinar colunas de uma ou mais tabelas


-- SINTAXE #########################################################################
select t1.coluna_1, t1.coluna_1, t2.coluna_1, t2.coluna_2
from schema.tabela_1 as t1
ALGUM join schema.tabela_2 as t2
    on condição_de_join


-- EXEMPLOS ########################################################################

-- (Exemplo 1) Utilize o LEFT JOIN para fazer join entre as tabelas
-- temp_tables.tabela_1 e temp_tables.tabela_2
--> Podemos encontrar nulos, pois trazem todos os dados da coluna a direita mesmo que seja nulo
--> Carregam os dados da t2 para t1 mesmo que algum campo seja nulo,
	-- mas não todos os dados da t2.

select * from temp_tables.tabela_1;
select * from temp_tables.tabela_2;

SELECT t1.cpf,
	   t1.name,
	   t2.state
FROM temp_tables.tabela_1 AS t1
LEFT JOIN temp_tables.tabela_2 AS t2
ON t1.cpf = t2.cpf;



-- (Exemplo 2) Utilize o INNER JOIN para fazer join entre as tabelas
-- temp_tables.tabela_1 e temp_tables.tabela_2
--> Só trás os que os ID's batem, não apresenta campos nulos

select * from temp_tables.tabela_1;
select * from temp_tables.tabela_2;

SELECT t1.cpf,
	   t1.name,
	   t2.state
FROM temp_tables.tabela_1 AS t1
INNER JOIN temp_tables.tabela_2 AS t2
ON t1.cpf = t2.cpf;



-- (Exemplo 3) Utilize o RIGHT JOIN para fazer join entre as tabelas
-- temp_tables.tabela_1 e temp_tables.tabela_2
--> Carregam os dados da t1 para t2 mesmo que algum campo seja nulo,
	-- mas não todos os dados da t1.

SELECT t2.cpf,
	   t2.state,
	   t1.name
FROM temp_tables.tabela_1 AS t1
RIGHT JOIN temp_tables.tabela_2 AS t2
ON t1.cpf = t2.cpf;



-- (Exemplo 4) Utilize o FULL JOIN para fazer join entre as tabelas
-- temp_tables.tabela_1 e temp_tables.tabela_2

SELECT t2.cpf,
	   t2.state,
	   t1.name
FROM temp_tables.tabela_1 AS t1
FULL JOIN temp_tables.tabela_2 AS t2
ON t1.cpf = t2.cpf;





-- RESUMO ##########################################################################
-- (1) Servem para combinar colunas de uma ou mais tabelas
-- (2) Pode-se chamar todas as colunas com o asterisco (*), mas não é recomendado
-- (3) É uma boa prática criar aliases para nomear as tabelas utilizadas 
-- (4) O JOIN sozinho funciona como INNER JOIN
