/*M�DULO 9: EXERC�CIOS*/


/*1. Declare 4 vari�veis inteiras. Atribua os seguintes valores a elas:
valor1 = 10
valor2 = 5
valor3 = 34
valor4 = 7*/

DECLARE @valor1 INT = 10, @valor2 INT = 5, @valor3 INT = 34, @valor4 INT = 7

SELECT @valor1, @valor2, @valor3, @valor4

DECLARE @soma INT
SET @soma = @valor1 + @valor2
SELECT @soma

/*a) Crie uma nova vari�vel para armazenar o resultado da soma entre valor1 e valor2. Chame
essa vari�vel de soma.*/

DECLARE @valor1 INT = 10, @valor2 INT = 5, @valor3 INT = 34, @valor4 INT = 7

SELECT @valor1, @valor2, @valor3, @valor4

DECLARE @soma INT
SET @soma = @valor1 + @valor2
SELECT @soma



/*b) Crie uma nova vari�vel para armazenar o resultado da subtra��o entre valor3 e valor 4.
Chame essa vari�vel de subtracao.*/

DECLARE @valor1 INT = 10, @valor2 INT = 5, @valor3 INT = 34, @valor4 INT = 7

DECLARE @subtra��o INT
SET @subtra��o = @valor3 - @valor4
SELECT @subtra��o

/*c) Crie uma nova vari�vel para armazenar o resultado da multiplica��o entre o valor 1 e o
valor4. Chame essa vari�vel de multiplicacao.*/

DECLARE @valor1 INT = 10, @valor2 INT = 5, @valor3 INT = 34, @valor4 INT = 7

DECLARE @mutiplica��o FLOAT
SET @mutiplica��o = @valor1 * @valor4
SELECT @mutiplica��o

/*d) Crie uma nova vari�vel para armazenar o resultado da divis�o do valor3 pelo valor4. Chame
essa vari�vel de divisao. Obs: O resultado dever� estar em decimal, e n�o em inteiro.*/
DECLARE @valor1 FLOAT = 10, @valor2 FLOAT = 5, @valor3 FLOAT = 34, @valor4 FLOAT = 7

DECLARE @divids�o FLOAT
SET @divids�o = @valor3 / @valor4
SELECT ROUND (@divids�o,2)

/*e) Arredonde o resultado da letra d) para 2 casas decimais*/

/*Para cada declara��o das vari�veis abaixo, aten��o em rela��o ao tipo de dado que dever� ser 
especificado.
a) Declare uma vari�vel chamada �produto� e atribua o valor de �Celular�.*/

DECLARE @produto VARCHAR (50)


SET @produto ='Celular'

/*b) Declare uma vari�vel chamada �quantidade� e atribua o valor de 12. */
DECLARE @produto VARCHAR (50)
DECLARE @quantidade INT 


SET @produto ='Celular'
SET @quantidade= 12


/*c) Declare uma vari�vel chamada �preco� e atribua o valor 9.99.*/


DECLARE @produto VARCHAR (50)
DECLARE @quantidade INT
DECLARE @preco float


SET @produto ='Celular'
SET @quantidade= 12
SET @preco = 9.99

/*d) Declare uma vari�vel chamada �faturamento� e atribua o resultado da multiplica��o entre 
�quantidade� e �preco�. */

DECLARE @produto VARCHAR (50)
DECLARE @quantidade INT
DECLARE @preco float
DECLARE @faturamento float


SET @produto ='Celular'
SET @quantidade= 12
SET @preco = 9.99
SET @faturamento  =  @quantidade * @preco

/*e) Visualize o resultado dessas 4 vari�veis em uma �nica consulta, por meio do SELECT.*/

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
	@preco AS 'Pre�o',
	@faturamento AS 'Faturamento'


/*3. Voc� � respons�vel por gerenciar um banco de dados onde s�o recebidos dados externos de 
usu�rios. Em resumo, esses dados s�o:
- Nome do usu�rio
- Data de nascimento
- Quantidade de pets que aquele usu�rio possui
Voc� precisar� criar um c�digo em SQL capaz de juntar as informa��es fornecidas por este 
usu�rio. Para simular estes dados, crie 3 vari�veis, chamadas: nome, data_nascimento e 
num_pets. Voc� dever� armazenar os valores �Andr�, �10/02/1998� e 2, respectivamente.
O resultado final a ser alcan�ado � mostrado no print abaixo*/

DECLARE @nome_usuario VARCHAR(50)
DECLARE @data_nacimento DATETIME
DECLARE @total_pets INT

SET @nome_usuario = 'Humberto'
SET @data_nacimento = 23/01/1985
SET @total_pets = 2

SELECT 'Meu nome �' +CAST (@nome_usuario AS VARCHAR(50)) + ',Nasci em' + FORMAT( @data_nacimento, 'dd/mm/yy') +  'Tenho' + CAST( @total_pets AS VARCHAR (50))+ 'Pets'


/*4. Voc� acabou de ser promovido e o seu papel ser� realizar um controle de qualidade sobre as 
lojas da empresa. 
A primeira informa��o que � passada a voc� � que o ano de 2008 foi bem complicado para a 
empresa, pois foi quando duas das principais lojas fecharam. O seu primeiro desafio � descobrir 
o nome dessas lojas que fecharam no ano de 2008, para que voc� possa entender o motivo e 
mapear planos de a��o para evitar que outras lojas importantes tomem o mesmo caminho.
O seu resultado dever� estar estruturado em uma frase, com a seguinte estrutura:
�As lojas fechadas no ano de 2008 foram: � + nome_das_lojas*/


DECLARE @varListaLojas VARCHAR (50)
SET @varListaLojas =''

SELECT 
	@varListaLojas = @varListaLojas + StoreName + ','
FROM DimStore
WHERE format (CloseDate,'yyyy')= 2008

PRINT 'As lojas fechadas no ano de 2008 foram:' + @varListaLojas


/*5. Voc� precisa criar uma consulta para mostrar a lista de produtos da tabela DimProduct para
uma subcategoria espec�fica: �Lamps�.
Utilize o conceito de vari�veis para chegar neste resultado*/

DECLARE @Idsubacategoria INT
DECLARE @Nomesubcategoria VARCHAR (50)

SET @Nomesubcategoria = 'Lamps'
SET @Idsubacategoria = (SELECT ProductSubcategoryKey  FROM DimProductSubcategory WHERE ProductSubcategoryName  = @Nomesubcategoria)

SELECT *
FROM
	DimProduct
WHERE ProductSubcategoryKey = @Idsubacategoria