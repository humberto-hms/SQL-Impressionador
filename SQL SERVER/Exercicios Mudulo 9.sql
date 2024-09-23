/*MÓDULO 9: EXERCÍCIOS*/


/*1. Declare 4 variáveis inteiras. Atribua os seguintes valores a elas:
valor1 = 10
valor2 = 5
valor3 = 34
valor4 = 7*/

DECLARE @valor1 INT = 10, @valor2 INT = 5, @valor3 INT = 34, @valor4 INT = 7

SELECT @valor1, @valor2, @valor3, @valor4

DECLARE @soma INT
SET @soma = @valor1 + @valor2
SELECT @soma

/*a) Crie uma nova variável para armazenar o resultado da soma entre valor1 e valor2. Chame
essa variável de soma.*/

DECLARE @valor1 INT = 10, @valor2 INT = 5, @valor3 INT = 34, @valor4 INT = 7

SELECT @valor1, @valor2, @valor3, @valor4

DECLARE @soma INT
SET @soma = @valor1 + @valor2
SELECT @soma



/*b) Crie uma nova variável para armazenar o resultado da subtração entre valor3 e valor 4.
Chame essa variável de subtracao.*/

DECLARE @valor1 INT = 10, @valor2 INT = 5, @valor3 INT = 34, @valor4 INT = 7

DECLARE @subtração INT
SET @subtração = @valor3 - @valor4
SELECT @subtração

/*c) Crie uma nova variável para armazenar o resultado da multiplicação entre o valor 1 e o
valor4. Chame essa variável de multiplicacao.*/

DECLARE @valor1 INT = 10, @valor2 INT = 5, @valor3 INT = 34, @valor4 INT = 7

DECLARE @mutiplicação FLOAT
SET @mutiplicação = @valor1 * @valor4
SELECT @mutiplicação

/*d) Crie uma nova variável para armazenar o resultado da divisão do valor3 pelo valor4. Chame
essa variável de divisao. Obs: O resultado deverá estar em decimal, e não em inteiro.*/
DECLARE @valor1 FLOAT = 10, @valor2 FLOAT = 5, @valor3 FLOAT = 34, @valor4 FLOAT = 7

DECLARE @dividsão FLOAT
SET @dividsão = @valor3 / @valor4
SELECT ROUND (@dividsão,2)

/*e) Arredonde o resultado da letra d) para 2 casas decimais*/

/*Para cada declaração das variáveis abaixo, atenção em relação ao tipo de dado que deverá ser 
especificado.
a) Declare uma variável chamada ‘produto’ e atribua o valor de ‘Celular’.*/

DECLARE @produto VARCHAR (50)


SET @produto ='Celular'

/*b) Declare uma variável chamada ‘quantidade’ e atribua o valor de 12. */
DECLARE @produto VARCHAR (50)
DECLARE @quantidade INT 


SET @produto ='Celular'
SET @quantidade= 12


/*c) Declare uma variável chamada ‘preco’ e atribua o valor 9.99.*/


DECLARE @produto VARCHAR (50)
DECLARE @quantidade INT
DECLARE @preco float


SET @produto ='Celular'
SET @quantidade= 12
SET @preco = 9.99

/*d) Declare uma variável chamada ‘faturamento’ e atribua o resultado da multiplicação entre 
‘quantidade’ e ‘preco’. */

DECLARE @produto VARCHAR (50)
DECLARE @quantidade INT
DECLARE @preco float
DECLARE @faturamento float


SET @produto ='Celular'
SET @quantidade= 12
SET @preco = 9.99
SET @faturamento  =  @quantidade * @preco

/*e) Visualize o resultado dessas 4 variáveis em uma única consulta, por meio do SELECT.*/

DECLARE @produto VARCHAR (50)
DECLARE @quantidade INT
DECLARE @preco float
DECLARE @faturamento float


SET @produto ='Celular'
SET @quantidade= 12
SET @preco = 9.99
SET @faturamento  =  @quantidade * @preco

SELECT
	@produto AS 'produto',
	@quantidade as 'quantidade',
	@preco AS 'Preço',
	@faturamento AS 'Faturamento'


/*3. Você é responsável por gerenciar um banco de dados onde são recebidos dados externos de 
usuários. Em resumo, esses dados são:
- Nome do usuário
- Data de nascimento
- Quantidade de pets que aquele usuário possui
Você precisará criar um código em SQL capaz de juntar as informações fornecidas por este 
usuário. Para simular estes dados, crie 3 variáveis, chamadas: nome, data_nascimento e 
num_pets. Você deverá armazenar os valores ‘André’, ‘10/02/1998’ e 2, respectivamente.
O resultado final a ser alcançado é mostrado no print abaixo*/

DECLARE @nome_usuario VARCHAR(50)
DECLARE @data_nacimento DATETIME
DECLARE @total_pets INT

SET @nome_usuario = 'Humberto'
SET @data_nacimento = 23/01/1985
SET @total_pets = 2

SELECT 'Meu nome é' +CAST (@nome_usuario AS VARCHAR(50)) + ',Nasci em' + FORMAT( @data_nacimento, 'dd/mm/yy') +  'Tenho' + CAST( @total_pets AS VARCHAR (50))+ 'Pets'


/*4. Você acabou de ser promovido e o seu papel será realizar um controle de qualidade sobre as 
lojas da empresa. 
A primeira informação que é passada a você é que o ano de 2008 foi bem complicado para a 
empresa, pois foi quando duas das principais lojas fecharam. O seu primeiro desafio é descobrir 
o nome dessas lojas que fecharam no ano de 2008, para que você possa entender o motivo e 
mapear planos de ação para evitar que outras lojas importantes tomem o mesmo caminho.
O seu resultado deverá estar estruturado em uma frase, com a seguinte estrutura:
‘As lojas fechadas no ano de 2008 foram: ’ + nome_das_lojas*/


DECLARE @varListaLojas VARCHAR (50)
SET @varListaLojas =''

SELECT 
	@varListaLojas = @varListaLojas + StoreName + ','
FROM DimStore
WHERE format (CloseDate,'yyyy')= 2008

PRINT 'As lojas fechadas no ano de 2008 foram:' + @varListaLojas


/*5. Você precisa criar uma consulta para mostrar a lista de produtos da tabela DimProduct para
uma subcategoria específica: ‘Lamps’.
Utilize o conceito de variáveis para chegar neste resultado*/

DECLARE @Idsubacategoria INT
DECLARE @Nomesubcategoria VARCHAR (50)

SET @Nomesubcategoria = 'Lamps'
SET @Idsubacategoria = (SELECT ProductSubcategoryKey  FROM DimProductSubcategory WHERE ProductSubcategoryName  = @Nomesubcategoria)

SELECT *
FROM
	DimProduct
WHERE ProductSubcategoryKey = @Idsubacategoria