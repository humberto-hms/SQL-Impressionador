/*M�DULO 7: EXERC�CIOS 

Os Joins t�m como principal objetivo deixar as tabelas mais informativas, permitindo buscar 
dados de uma tabela para outra, de acordo com uma coluna em comum que permita essa 
rela��o.
Dito isso, fa�a os seguintes exerc�cios*/

/*1. Utilize o INNER JOIN para trazer os nomes das subcategorias dos produtos, da tabela 
DimProductSubcategory para a tabela DimProduct*/

SELECT
	ProductKey,
	ProductName,
	ProductSubcategoryName
FROM
	DimProduct
INNER JOIN DimProductSubcategory   
	ON    DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey

	
	
/*2. Identifique uma coluna em comum entre as tabelas DimProductSubcategory e 
DimProductCategory. Utilize essa coluna para complementar informa��es na tabela 
DimProductSubcategory a partir da DimProductCategory. Utilize o LEFT JOIN.*/

SELECT*FROM DimProductCategory
SELECT*FROM DimProductSubcategory

SELECT
	ProductSubcategoryKey,
	ProductCategoryName,
	ProductSubcategoryName,
	ProductCategoryDescription,
	ProductSubcategoryName
FROM
	DimProductSubcategory
LEFT JOIN DimProductCategory
	ON DimProductSubcategory.ProductCategoryKey = DimProductCategory.ProductCategoryKey
	

/* 3 Para cada loja da tabela DimStore, descubra qual o Continente e o Nome do Pa�s associados
(de acordo com DimGeography). Seu SELECT final deve conter apenas as seguintes colunas: 
StoreKey, StoreName, EmployeeCount, ContinentName e RegionCountryName. Utilize o LEFT 
JOIN neste exerc�cio.*/

SELECT * FROM DimStore
SELECT * FROM DimGeography

SELECT
	StoreKey,
	StoreName,
	EmployeeCount,
	RegionCountryName,
	ContinentName	
FROM 
	DimStore
LEFT JOIN DimGeography
ON
	DimStore.GeographyKey = DimGeography.GeographyKey

/*4. Complementa a tabela DimProduct com a informa��o de ProductCategoryDescription. Utilize 
o LEFT JOIN e retorne em seu SELECT apenas as 5 colunas que considerar mais relevantes.*/

SELECT * FROM DimProduct
SELECT * FROM DimProductCategory
SELECT * FROM DimProductSubcategory


SELECT 
	ProductKey,
	ProductName,
	ProductDescription,
	ProductCategoryDescription,
	BrandName
FROM 
	DimProduct
LEFT JOIN DimProductSubcategory
	ON	DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
	LEFT JOIN DimProductCategory
			ON  DimProductSubcategory.ProductCategoryKey = DimProductCategory.ProductCategoryKey


/*5. A tabela FactStrategyPlan resume o planejamento estrat�gico da empresa. Cada linha 
representa um montante destinado a uma determinada AccountKey.

a) Fa�a um SELECT das 100 primeiras linhas de FactStrategyPlan para reconhecer a tabela.

b) Fa�a um INNER JOIN para criar uma tabela contendo o AccountName para cada 

AccountKey da tabela FactStrategyPlan. O seu SELECT final deve conter as colunas:
� StrategyPlanKey
� DateKey
� AccountName
� Amount*/

SELECT TOP 100 * FROM FactStrategyPlan

SELECT TOP 100 * FROM  DimAccount

SELECT 
	StrategyPlanKey,
	Datekey,
	AccountName,
	Amount
 FROM FactStrategyPlan 
 INNER JOIN DimAccount
		ON FactStrategyPlan.AccountKey = DimAccount.AccountKey
ORDER BY Amount 


/*6. Vamos continuar analisando a tabela FactStrategyPlan. Al�m da coluna AccountKey que 
identifica o tipo de conta, h� tamb�m uma outra coluna chamada ScenarioKey. Essa coluna 
possui a numera��o que identifica o tipo de cen�rio: Real, Or�ado e Previs�o.
Fa�a um INNER JOIN para criar uma tabela contendo o ScenarioName para cada ScenarioKey
da tabela FactStrategyPlan. O seu SELECT final deve conter as colunas:

� StrategyPlanKey
� DateKey
� ScenarioName 
� Amount*/		


SELECT 
	StrategyPlanKey,
	Datekey,
	ScenarioName,
	Amount
 FROM 
	FactStrategyPlan
INNER JOIN DimScenario
	ON FactStrategyPlan.ScenarioKey = DimScenario.ScenarioKey


/*Algumas subcategorias n�o possuem nenhum exemplar de produto. Identifique que 
subcategorias s�o essas.*/

SELECT
	ProductName,
	ProductSubcategoryName
FROM
	DimProduct
RIGHT JOIN DimProductSubcategory
	ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductCategoryKey
WHERE ProductName IS NULL



/*8. A tabela abaixo mostra a combina��o entre Marca e Canal de Venda, para as marcas Contoso, 
Fabrikam e Litware. Crie um c�digo SQL para chegar no mesmo resultado.*/


/* COMO EU FIZ */
SELECT
	DISTINCT BrandName,
	ChannelName
FROM
	DimProduct
RIGHT JOIN FactSales
		ON FactSales.ProductKey = DimProduct.ProductKey
RIGHT JOIN DimChannel
		ON FactSales.channelKey = DimChannel.ChannelKey
WHERE BrandName IN ('Contoso', 'Fabrikan', 'Litware') 

 /* MODO  CORRETO*/

SELECT
	DISTINCT BrandName,
	ChannelName
FROM
	DimProduct CROSS JOIN DimChannel
WHERE BrandName IN ('Contoso', 'Fabrikan', 'Litware')



/*9. Neste exerc�cio, voc� dever� relacionar as tabelas FactOnlineSales com DimPromotion. 
Identifique a coluna que as duas tabelas t�m em comum e utilize-a para criar esse 
relacionamento.

Retorne uma tabela contendo as seguintes colunas:
� OnlineSalesKey
� DateKey
� PromotionName
� SalesAmount

A sua consulta deve considerar apenas as linhas de vendas referentes a produtos com 
desconto (PromotionName <> �No Discount�). Al�m disso, voc� dever� ordenar essa tabela de 
acordo com a coluna DateKey, em ordem crescente*/


SELECT TOP (1000)
	OnlineSalesKey,
	DateKey,
	PromotionName,
	SalesAmount
FROM
	FactOnlineSales
INNER JOIN DimPromotion
	ON FactOnlineSales.PromotionKey  =DimPromotion.PromotionKey
WHERE  PromotionName <> 'No Discount'
ORDER BY DateKey asc


/*10. A tabela abaixo � resultado de um Join entre a tabela FactSales e as tabelas: DimChannel, 
DimStore e DimProduct.
Recrie esta consulta e classifique em ordem crescente de acordo com SalesAmount.*/

SELECT
	SalesKey,
	ChannelName,
	StoreName,
	ProductName,
	SalesAmount
FROM 
	FactSales
INNER JOIN DimChannel
	ON FactSales.channelKey = DimChannel.ChannelKey
INNER JOIN DimStore
	ON FactSales.StoreKey = DimStore.StoreKey
INNER JOIN DimProduct
	ON FactSales.ProductKey = DimProduct.ProductKey
ORDER BY SalesAmount ASC