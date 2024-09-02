         --MÓDULO 5: EXERCÍCIOS--



/* O gerente comercial pediu a você uma análise da Quantidade Vendida e Quantidade 
Devolvida para o canal de venda mais importante da empresa: Store.
Utilize uma função SQL para fazer essas consultas no seu banco de dados. Obs: Faça essa 
análise considerando a tabela FactSales */

SELECT  
	SUM(SalesQuantity) AS 'Quantidade Vendida',
	SUM(ReturnQuantity) AS 'Quantidade Devolvida'
FROM 
	FactSales
WHERE channelKey = 1


/*Uma nova ação no setor de Marketing precisará avaliar a média salarial de todos os clientes
da empresa, mas apenas de ocupação Professional. Utilize um comando SQL para atingir esse 
resultado*/

SELECT 
	AVG(YearlyIncome) AS 'Média Salarial'
FROM 
	DimCustomer
WHERE Occupation = 'Professional'


/*Você precisará fazer uma análise da quantidade de funcionários das lojas registradas na 
empresa. O seu gerente te pediu os seguintes números e informações:

a) Quantos funcionários tem a loja com mais funcionários?
b) Qual é o nome dessa loja?
c) Quantos funcionários tem a loja com menos funcionários?
d) Qual é o nome dessa loja?*/

SELECT TOP(1)
	StoreName,
	MAX(EmployeeCount)AS 'Maximo Funcionarios'
FROM DimStore
GROUP BY StoreName


SELECT TOP(1)
	StoreName,
	MIN(EmployeeCount)AS 'Minimo Funcionarios'
FROM DimStore
WHERE EmployeeCount IS NOT NULL
GROUP BY StoreName
ORDER BY 'Minimo Funcionarios' ASC

  
 /*  A área de RH está com uma nova ação para a empresa, e para isso precisa saber a quantidade 
total de funcionários do sexo Masculino e do sexo Feminino. 

a) Descubra essas duas informações utilizando o SQL.

b) O funcionário e a funcionária mais antigos receberão uma homenagem. Descubra as 
seguintes informações de cada um deles: Nome, E-mail, Data de Contratação. */

SELECT 
	MaritalStatus,
	COUNT(MaritalStatus) AS 'Total'
FROM DimEmployee
GROUP BY MaritalStatus

SELECT TOP(1)
	FirstName,
	LastName,
	EmailAddress,
	StartDate
FROM 
	DimEmployee
WHERE Gender = 'M' 
ORDER BY StartDate ASC


SELECT TOP(1)
	FirstName,
	LastName,
	EmailAddress,
	StartDate
FROM 
	DimEmployee
WHERE Gender = 'F' 
ORDER BY StartDate ASC


/*Agora você precisa fazer uma análise dos produtos. Será necessário descobrir as seguintes 
informações:
a) Quantidade distinta de cores de produtos.
b) Quantidade distinta de marcas
c) Quantidade distinta de classes de produto
Para simplificar, você pode fazer isso em uma mesma consulta*/

SELECT
	COUNT(DISTINCT ColorName) AS 'Qtd. Cor',
	COUNT(DISTINCT BrandName) AS 'Qtd. Marca',
	COUNT(DISTINCT ClassName) AS 'Qtd Classe'
FROM
	DimProduct