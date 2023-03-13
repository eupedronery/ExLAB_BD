--a) Fazer um algoritmo que leia 1 número e mostre se são múltiplos de 2,3,5 ou nenhum deles
  DECLARE @numero INT = 15

SELECT 
    CASE 
        WHEN @numero % 2 = 0 THEN 'Múltiplo de 2'
        WHEN @numero % 3 = 0 THEN 'Múltiplo de 3'
        WHEN @numero % 5 = 0 THEN 'Múltiplo de 5'
        ELSE 'Não é múltiplo de 2, 3 ou 5'
    END AS 'Resultado'

 
 
-- b)  Fazer um algoritmo que leia 3 números e mostre o maior e o menor
  DECLARE @numero1 INT = 10
DECLARE @numero2 INT = 20
DECLARE @numero3 INT = 15

SELECT 
    MAX(numero) AS 'Maior',
    MIN(numero) AS 'Menor'
FROM 
    (VALUES (@numero1), (@numero2), (@numero3)) AS Numeros(numero)




--c) Fazer um algoritmo que calcule os 15 primeiros termos da série
--1,1,2,3,5,8,13,21,...
--E calcule a soma dos 15 termos
  
  WITH Fibonacci AS (
    SELECT 
        1 AS n,
        CAST(1 AS BIGINT) AS valor1,
        CAST(1 AS BIGINT) AS valor2
    UNION ALL
    SELECT 
        n + 1 AS n,
        valor2 AS valor1,
        valor1 + valor2 AS valor2
    FROM 
        Fibonacci
    WHERE 
        n < 15
)
SELECT 
    valor1 AS 'Termo',
    SUM(valor1) OVER() AS 'Soma'
FROM 
    Fibonacci



--d) Fazer um algoritmo que separa uma frase, colocando todas as letras em maiúsculo e em minúsculo (Usar funções UPPER e LOWER)
  DECLARE @frase VARCHAR(MAX) = 'Exemplo de Frase Para Ser Transformada'

SELECT 
    UPPER(letra) AS 'Maiúsculo',
    LOWER(letra) AS 'Minúsculo'
FROM 
    (SELECT SUBSTRING(@frase, number, 1) AS letra FROM master.dbo.spt_values WHERE type = 'P' AND number BETWEEN 1 AND LEN(@frase)) AS letras



--e) Fazer um algoritmo que inverta uma palavra (Usar a função SUBSTRING)
DECLARE @palavra VARCHAR(50) = 'Exemplo'

SELECT 
    SUBSTRING(@palavra, number, 1) AS 'Letra'
FROM 
    master.dbo.spt_values
WHERE 
    type = 'P' AND number BETWEEN LEN(@palavra) AND 1

