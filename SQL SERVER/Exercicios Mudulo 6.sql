--MÓDULO 6: EXERCÍCIOS--



/*1. a) Faça um resumo da quantidade vendida (SalesQuantity) de acordo com o canal de vendas 
(channelkey).

b) Faça um agrupamento mostrando a quantidade total vendida (SalesQuantity) e quantidade 
total devolvida (Return Quantity) de acordo com o ID das lojas (StoreKey).

c) Faça um resumo do valor total vendido (SalesAmount) para cada canal de venda, mas apenas 
para o ano de 2007.*/

SELECT
   channelKey AS 'Canal de vendas',
   SUM (SalesQuantity) AS 'Total Vendas'
FROM
	FactSales
GROUP BY channelKey
ORDER BY 'Canal de vendas' DESC

SELECT 
	StoreKey AS 'ID loja',
	SUM(SalesQuantity) AS 'Total Vendido',
	SUM(ReturnQuantity) AS 'Total devolvido'
FROM
 FactSales
 GROUP BY StoreKey
 ORDER BY StoreKey

 SELECT 
	channelKey AS 'Canal de Vendas',
	SUM(SalesAmount) AS 'Total'
 FROM
	FactSales
WHERE DateKey BETWEEN '20061231' AND '20071231'
GROUP BY channelKey


/*Você precisa fazer uma análise de vendas por produtos. O objetivo final é descobrir o valor
total vendido (SalesAmount) por produto (ProductKey).

a) A tabela final deverá estar ordenada de acordo com a quantidade vendida e, além disso,
mostrar apenas os produtos que tiveram um resultado final de vendas maior do que
$5.000.000.

b) Faça uma adaptação no exercício anterior e mostre os Top 10 produtos com mais vendas.
Desconsidere o filtro de $5.000.000 aplicado.*/

SELECT
	ProductKey,
	SUM(SalesAmount) AS 'Total Vendido'
FROM
	FactSales
GROUP BY ProductKey
ORDER BY 'Total Vendido' DESC


SELECT
	ProductKey,
	SUM(SalesAmount) AS 'Total Vendido'
FROM
	FactSales
GROUP BY ProductKey
HAVING SUM(SalesAmount) >= 5000000
ORDER BY 'Total Vendido' DESC


SELECT TOP(10)
	ProductKey,
	SUM(SalesAmount) AS 'Total Vendido'
FROM
	FactSales
GROUP BY ProductKey
ORDER BY 'Total Vendido' DESC


/*a) Você deve fazer uma consulta à tabela FactOnlineSales e descobrir qual é o ID
(CustomerKey) do cliente que mais realizou compras online (de acordo com a coluna
SalesQuantity).

b) Feito isso, faça um agrupamento de total vendido (SalesQuantity) por ID do produto
e descubra quais foram os top 3 produtos mais comprados pelo cliente da letra a 1337).*/


SELECT 
	CustomerKey AS 'Codigo Cliente',
	SUM(SalesQuantity) AS 'Total Compras'
FROM 
	FactOnlineSales
GROUP BY CustomerKey
ORDER BY 'Total Compras' DESC

SELECT TOP (3)
		ProductKey AS 'ID Prduto',
	SUM(SalesQuantity) AS 'Total Vendido'
FROM
	FactOnlineSales
WHERE CustomerKey = 19037
GROUP BY ProductKey
ORDER BY 'Total Vendido' desc



/*a) Faça um agrupamento e descubra a quantidade total de produtos por marca.

b) Determine a média do preço unitário (UnitPrice) para cada ClassName.

c) Faça um agrupamento de cores e descubra o peso total que cada cor de produto possui.*/

SELECT
	BrandName as 'Marca',
	COUNT(ProductKey) as 'total produtos'
FROM
	DimProduct
GROUP BY BrandName


SELECT
	ClassName,
	AVG(UniTPrice) AS 'Média Preço'
FROM
	DimProduct
GROUP BY ClassName

SELECT 
	ColorName AS 'Cor',
	SUM(Weight) AS 'Peso Total'
FROM
	DimProduct
GROUP BY ColorName

/*Você deverá descobrir o peso total para cada tipo de produto (StockTypeName).
A tabela final deve considerar apenas a marca ‘Contoso’ e ter os seus valores classificados em
ordem decrescente.*/

SELECT 
	StockTypeName AS 'Tipo',
	SUM(Weight) AS 'Peso Total'
FROM
	DimProduct
WHERE BrandName = 'Contoso'
GROUP BY StockTypeName
ORDER BY SUM(Weight) DESC



/*Você seria capaz de confirmar se todas as marcas dos produtos possuem à disposição todas as 
16 opções de cores?*/

SELECT 
    BrandName AS 'Marca',
	COUNT(distinct ColorName) AS 'Qtd de Cores'
FROM DimProduct
GROUP BY BrandName


/*Faça um agrupamento para saber o total de clientes de acordo com o Sexo e também a média 
salarial de acordo com o Sexo. Corrija qualquer resultado “inesperado” com os seus 
conhecimentos em SQL*/

SELECT 
	 Gender as 'SEXO',
	 COUNT(Gender) AS 'Total',
	 AVG(YearlyIncome) as 'Média Salarial'
FROM 
	DimCustomer
WHERE Gender  IS NOT NULL
GROUP BY Gender


/*Faça um agrupamento para descobrir a quantidade total de clientes e a média salarial de 
acordo com o seu nível escolar. Utilize a coluna Education da tabela DimCustomer para fazer 
esse agrupamento*/


SELECT 
	Education AS 'Educação',
	COUNT (FirstName) AS 'Total Clientes',
	AVG(YearlyIncome) AS 'Média Salarial'
FROM 
	DimCustomer
WHERE  Education IS NOT NULL
GROUP BY Education


/* Faça uma tabela resumo mostrando a quantidade total de funcionários de acordo com o 
Departamento (DepartmentName). Importante: Você deverá considerar apenas os 
funcionários ativos.*/


SELECT 
	DepartmentName AS 'Departamento',
	COUNT(FirstName) AS 'Total'
FROM 
 DimEmployee
 WHERE Status = 'Current'
 GROUP  BY DepartmentName
 ORDER BY Total DESC

 /*Faça uma tabela resumo mostrando o total de VacationHours para cada cargo (Title). Você 
deve considerar apenas as mulheres, dos departamentos de Production, Marketing, 
Engineering e Finance, para os funcionários contratados entre os anos de 1999 e 2000*/

SELECT
	Title AS  'Cargo',
	SUM(VacationHours) AS 'Total Horas'
FROM 
DimEmployee
WHERE HireDate BETWEEN '19981231' AND '20001231' AND  Gender = 'F' AND  DepartmentName in ('Production', 'Marketing','Engineering','Finance')
GROUP BY Title


SELECT
	*
FROM DimEmployee