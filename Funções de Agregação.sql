/*O gerente comercial pediu a voc� uma an�lise da Quantidade Vendida e Quantidade 
Devolvida para o canal de venda mais importante da empresa: Store.
Utilize uma fun��o SQL para fazer essas consultas no seu banco de dados. Obs: Fa�a essa 
an�lise considerando a tabela FactSales.*/

SELECT 
	SUM(SalesQuantity) AS 'Qtd Vendida', 
	SUM(ReturnQuantity) AS 'Qtd Devolvida'
FROM 
	FactSales 
WHERE channelKey = 1

/*2. Uma nova a��o no setor de Marketing precisar� avaliar a m�dia salarial de todos os clientes
da empresa, mas apenas de ocupa��o Professional. Utilize um comando SQL para atingir esse 
resultado.*/

SELECT 
	AVG(YearlyIncome) AS 'M�dia Salarial Anual'
FROM 
	DimCustomer 
WHERE Occupation = 'Professional'



*/
/*3. Voc� precisar� fazer uma an�lise da quantidade de funcion�rios das lojas registradas na 
empresa. O seu gerente te pediu os seguintes n�meros e informa��es:
a) Quantos funcion�rios tem a loja com mais funcion�rios?
b) Qual � o nome dessa loja?
c) Quantos funcion�rios tem a loja com menos funcion�rios?
d) Qual � o nome dessa loja?*/


SELECT TOP(1) 
	StoreName,
	EmployeeCount
FROM 
	DimStore 
ORDER BY EmployeeCount DESC

SELECT TOP(1)
	StoreName,
	EmployeeCount
FROM
	DimStore
WHERE EmployeeCount IS NOT NULL
ORDER BY EmployeeCount 
 
	
	




/*4. A �rea de RH est� com uma nova a��o para a empresa, e para isso precisa saber a quantidade 
total de funcion�rios do sexo Masculino e do sexo Feminino. 
a) Descubra essas duas informa��es utilizando o SQL.
b) O funcion�rio e a funcion�ria mais antigos receber�o uma homenagem. Descubra as 
seguintes informa��es de cada um deles: Nome, E-mail, Data de Contrata��o.*/

--SELECT * FROM DimEmployee
--A
SELECT 
	COUNT (EmployeeKey) AS 'Empregados Homens',
	MIN(HireDate) AS 'Primeiro Empregado'
FROM 
	DimEmployee
WHERE Gender = 'M'

SELECT 
	COUNT (EmployeeKey) AS 'Empregadas Mulheres',
	MIN(HireDate) AS 'Primeira Empregada'
FROM
	DimEmployee
WHERE Gender = 'F'

--B
SELECT 
	TOP(1) FirstName,
	HireDate,
	EmailAddress
FROM 
	DimEmployee
WHERE Gender = 'M'
ORDER BY HireDate

SELECT 
	TOP(1) FirstName,
	HireDate,
	EmailAddress
FROM 
	DimEmployee
WHERE Gender = 'F'
ORDER BY HireDate



/*5. Agora voc� precisa fazer uma an�lise dos produtos. Ser� necess�rio descobrir as seguintes 
informa��es:
a) Quantidade distinta de cores de produtos.
b) Quantidade distinta de marcas
c) Quantidade distinta de classes de produto*/

--SELECT * FROM DimProduct

SELECT

	COUNT (DISTINCT ColorName) AS 'Cores',
	COUNT (DISTINCT BrandName) AS 'Marcas', 
	COUNT (DISTINCT ClassName) AS 'Classes'
	
FROM 
	DimProduct


