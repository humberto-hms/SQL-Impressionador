/*1. a) Faça um resumo da quantidade vendida (Sales Quantity) de acordo com o nome do canal
de vendas (ChannelName). Você deve ordenar a tabela final de acordo com SalesQuantity,
em ordem decrescente.*/

SELECT
	channelName,
	SUM(SalesQuantity) as 'Total Vendido'
FROM
	FactSales
INNER JOIN DimChannel
	ON FactSales.channelKey = DimChannel.ChannelKey
GROUP BY ChannelName
ORDER BY [Total Vendido] DESC


/*b) Faça um agrupamento mostrando a quantidade total vendida (Sales Quantity) e
quantidade total devolvida (Return Quantity) de acordo com o nome das lojas
(StoreName).*/

SELECT
	StoreName as 'Nome loja',
	SUM(SalesQuantity) as 'Total Vendido',
	SUM(ReturnQuantity) as 'Total Devolvido'
FROM
	FactSales
INNER JOIN DimStore
	ON FactSales.StoreKey = DimStore.StoreKey
GROUP BY StoreName
ORDER BY [Total Vendido] DESC


/*c) Faça um resumo do valor total vendido (Sales Amount) para cada mês
(CalendarMonthLabel) e ano (CalendarYear).*/SELECT	CalendarYear as 'Ano',	CalendarMonthLabel as 'Mês',	SUM(SalesAmount) as 'Total Valor'	FROM 	FactSalesINNER JOIN DimDate	ON FactSales.DateKey = DimDate.DatekeyGROUP BY CalendarYear, CalendarMonthLabel,CalendarMonthORDER BY CalendarMonth/*2. Você precisa fazer uma análise de vendas por produtos. O objetivo final é descobrir o valor 
total vendido (SalesQuantity) por produto.

a) Descubra qual é a cor de produto que mais é vendida (de acordo com SalesQuantity).*/

SELECT
	ColorName as 'Cor',
	SUM(SalesQuantity) as 'Total Vendido'
FROM
	FactSales
INNER JOIN DimProduct
	ON FactSales.ProductKey = DimProduct.ProductKey
GROUP BY ColorName
ORDER BY [Total Vendido] DESC

/*b) Quantas cores tiveram uma quantidade vendida acima de 3.000.000.*/

SELECT
	ColorName as 'Cor',
	SUM(SalesQuantity) as 'Total Vendido'
FROM
	FactSales
INNER JOIN DimProduct
	ON FactSales.ProductKey = DimProduct.ProductKey
GROUP BY ColorName
HAVING SUM(SalesQuantity) > 3000000
ORDER BY [Total Vendido] DESC


/*3. Crie um agrupamento de quantidade vendida (SalesQuantity) por categoria do produto 
(ProductCategoryName). Obs: Você precisará fazer mais de 1 INNER JOIN, dado que a relação 
entre FactSales e DimProductCategory não é direta*/

SELECT
	ProductCategoryName as 'Categoria',
	SUM(SalesQuantity) as 'Total Vendido'
FROM
	FactSales
INNER JOIN DimProduct
	ON FactSales.ProductKey = DimProduct.ProductKey
INNER JOIN DimProductSubcategory
	ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
INNER JOIN DimProductCategory
	ON DimProductSubcategory.ProductCategoryKey =  DimProductCategory.ProductCategoryKey
GROUP BY ProductCategoryName
ORDER BY [Total Vendido]


 

 /*4. a) Você deve fazer uma consulta à tabela FactOnlineSales e descobrir qual é o nome completo 
do cliente que mais realizou compras online (de acordo com a coluna SalesQuantity).*/

SELECT
	DimCustomer.CustomerKey,
	FirstName as 'Nome',
	LastName as 'Sobrenome',
	SUM(SalesQuantity) as 'Total de Compras'
FROM
  FactOnlineSales
INNER JOIN DimCustomer
	ON FactOnlineSales.CustomerKey = DimCustomer.CustomerKey
WHERE CustomerType = 'Person'
GROUP BY DimCustomer.CustomerKey, FirstName, LastName
ORDER BY [Total de Compras] DESC
	

/*b) Feito isso, faça um agrupamento de produtos e descubra quais foram os top 10 produtos mais 
comprados pelo cliente da letra a, considerando o nome do produto.*/


SELECT TOP(10)
	ProductName AS 'Produto',
	SUM (SalesQuantity) AS 'Qtd Vendida'
FROM
	FactOnlineSales
INNER JOIN DimProduct
	ON FactOnlineSales.ProductKey = DimProduct.ProductKey
WHERE CustomerKey = 7665
GROUP BY ProductName
ORDER BY [Qtd Vendida]

/*5. Faça um resumo mostrando o total de produtos comprados (Sales Quantity) de acordo com o 
sexo dos clientes*/

SELECT  TOP(3)
	Gender AS 'Sexo',
	SUM(SalesQuantity)
FROM	
	FactOnlineSales
INNER JOIN DimCustomer
	ON FactOnlineSales.CustomerKey = DimCustomer.CustomerKey
WHERE Gender IS NOT NULL
GROUP BY Gender


/*6. Faça uma tabela resumo mostrando a taxa de câmbio média de acordo com cada 
CurrencyDescription. A tabela final deve conter apenas taxas entre 10 e 100*/

SELECT
	CurrencyDescription AS 'Moeda',
	AVG(AverageRate)AS 'Média'
FROM
	FactExchangeRate
INNER JOIN DimCurrency
	ON FactExchangeRate.CurrencyKey = DimCurrency.CurrencyKey
GROUP BY CurrencyDescription
HAVING AVG(AverageRate) BETWEEN 10 AND 100

	
/*7. Calcule a SOMA TOTAL de AMOUNT referente à tabela FactStrategyPlan destinado aos 
cenários: Actual e Budget.*/

SELECT
	ScenarioDescription AS 'Cenario',
	SUM(Amount) AS 'Valor Total'
FROM 
	FactStrategyPlan
INNER JOIN DimScenario
	ON FactStrategyPlan.ScenarioKey = DimScenario.ScenarioKey
GROUP BY ScenarioDescription
HAVING ScenarioDescription IN ('Actual', 'Budget')

/*8. Faça uma tabela resumo mostrando o resultado do planejamento estratégico por ano.*/

SELECT 
	CalendarYear AS 'Ano',
	SUM(Amount) AS 'Total'
FROM
	FactStrategyPlan
INNER JOIN DimDate
	ON FactStrategyPlan.Datekey = DimDate.Datekey
GROUP BY CalendarYear

SELECT TOP(3)*
FROM
	DimDate

/*9. Faça um agrupamento de quantidade de produtos por ProductSubcategoryName. Leve em 
consideração em sua análise apenas a marca Contoso e a cor Silver*/

SELECT
	ProductSubcategoryName AS 'Subcategoria',
	COUNT (*) AS 'Total Pordutos'
FROM
	DimProduct
INNER JOIN DimProductSubcategory
	ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
WHERE BrandName = 'Contoso'AND ColorName = 'Silver'
GROUP BY ProductSubcategoryName

	
/* 10. Faça um agrupamento duplo de quantidade de produtos por BrandName e 
ProductSubcategoryName. A tabela final deverá ser ordenada de acordo com a coluna 
BrandName*/


SELECT
	BrandName AS 'Marca',
	ProductSubcategoryName AS 'Subcategoria',
	COUNT(*) AS 'Total Produtos'
FROM
	DimProduct
INNER JOIN DimProductSubcategory
	ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
GROUP BY BrandName, ProductSubcategoryName
ORDER BY BrandName ASC

