-- TIPOS ###########################################################################
-- INTERVAL
-- DATE_TRUNC
-- EXTRACT
-- DATEDIFF


-- EXEMPLOS ########################################################################

-- (Exemplo 1) Soma de datas utilizando INTERVAL -> ele retorna em data e hora, mas é só tratar
-- Calcule a data de hoje mais 10 unidades (dias, semanas, meses, horas)
-- Podemos abordar mais unidades de data e hora

select current_date + 10; -- dias

SELECT (CURRENT_DATE + INTERVAL '10 weeks')::DATE; -- semanas

SELECT (CURRENT_DATE + INTERVAL '10 months')::DATE; -- meses

SELECT CURRENT_DATE + INTERVAL '10 hours'; -- meses



-- (Exemplo 2) Truncagem de datas utilizando DATE_TRUNC
-- Calcule quantas visitas ocorreram por mês no site da empresa

select visit_page_date, count(*)
from sales.funnel
group by visit_page_date
order by visit_page_date desc


SELECT date_trunc('month', visit_page_date)::date AS visit_page_month,
	   COUNT(*) AS contagem
FROM sales.funnel
GROUP BY visit_page_month
ORDER BY visit_page_month DESC;



-- (Exemplo 3) Extração de unidades de uma data utilizando EXTRACT
-- Calcule qual é o dia da semana que mais recebe visitas ao site

SELECT
	'2022-01-30'::DATE, 
	EXTRACT('dow' FROM '2022-01-30'::DATE);
-- 'dow' é day of week
-- 0 é domingo, 1 é segunda, ...



SELECT EXTRACT('dow' FROM visit_page_date) AS dia_semana,
	   COUNT(*) AS contagem
FROM sales.funnel
GROUP BY dia_semana
ORDER BY contagem DESC;



-- (Exemplo 4) Diferença entre datas com operador de subtração (-) 
-- Calcule a diferença entre hoje e '2018-06-01', em dias, semanas, meses e anos.

SELECT (CURRENT_DATE - '2018-06-01'); -- diferença em dias
SELECT (CURRENT_DATE - '2018-06-01')/7; -- diferença em semanas
SELECT (CURRENT_DATE - '2018-06-01')/30; -- diferença em meses
SELECT (CURRENT_DATE - '2018-06-01')/365; -- diferença em anos

SELECT datediff('weeks', '2018-06-01', CURRENT_DATE); -- aqui vamos criar essa função ainda


-- RESUMO --------------------------------------------------------------------------
-- (1) O comando INTERVAL é utilizado para somar datas na unidade desejada. Caso a 
-- unidade não seja informada, o SQL irá entender que a soma foi feita em dias.
-- (2) O comando DATE_TRUNC é utilizado para truncar uma data no início do período
-- (3) O comando EXTRACT é utilizado para extrair unidades de uma data/timestamp
-- (4) O cálculo da diferença entre datas com o operador de subtração (-) retorna  
-- valores em dias. Para calcular a diferença entre datas em outra unidade é necessário
-- fazer uma transformação de unidades (ou criar uma função para isso)
-- (5) Utilize o Guia de comandos para consultar as unidades de data e hora utilizadas 
-- no SQL

