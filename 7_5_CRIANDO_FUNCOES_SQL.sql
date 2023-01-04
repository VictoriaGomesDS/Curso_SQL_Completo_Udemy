-- PARA QUE SERVEM #################################################################
-- Servem para criar comandos personalizados de scripts usados recorrentemente.


-- EXEMPLOS ########################################################################

-- (Exemplo 1) Crie uma função chamada DATEDIFF para calcular a diferença entre
-- duas datas em dias, semanas, meses, anos

SELECT (CURRENT_DATE - '2018-06-01'); -- diferença em dias
SELECT (CURRENT_DATE - '2018-06-01')/7; -- diferença em semanas
SELECT (CURRENT_DATE - '2018-06-01')/30; -- diferença em meses
SELECT (CURRENT_DATE - '2018-06-01')/365; -- diferença em anos

SELECT datediff('weeks', '2018-06-01', CURRENT_DATE); -- aqui vamos criar essa função ainda

CREATE FUNCTION DATEDIFF(unidade varchar, data_inicial date, data_final date)
RETURNS integer
LANGUAGE sql
AS
$$

	SELECT 
	CASE
		WHEN unidade in ('d', 'days', 'day') THEN (data_final - data_inicial)
		WHEN unidade in ('w', 'week', 'weeks') THEN (data_final - data_inicial)/7
		WHEN unidade in ('m', 'month', 'months') THEN (data_final - data_inicial)/30
		WHEN unidade in ('y', 'year', 'years') THEN (data_final - data_inicial)/365
	END AS diferenca

$$

SELECT datediff('weeks', '2018-06-01', CURRENT_DATE); -- agora funciona



-- (Exemplo 2) Delete a função DATEDIFF criada no exercício anterior

DROP FUNCTION DATEDIFF;

SELECT datediff('weeks', '2018-06-01', CURRENT_DATE); -- nao funciona mais


-- RESUMO ##########################################################################
-- (1) Para criar funções, utiliza-se o comando CREATE FUNCTION
-- (2) Para que o comando funcione é obrigatório informar (a) quais as unidades dos 
-- INPUTS (b) quais as unidades dos OUTPUTS e (c) em qual linguagem a função será escrita
-- (3) O script da função deve estar delimitado por $$
-- (4) Para deletar uma função utiliza-se o comando DROP FUNCTION




