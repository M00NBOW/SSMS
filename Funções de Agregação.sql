/*O gerente comercial pediu a você uma análise da Quantidade Vendida e Quantidade 
Devolvida para o canal de venda mais importante da empresa: Store.
Utilize uma função SQL para fazer essas consultas no seu banco de dados. Obs: Faça essa 
análise considerando a tabela FactSales.*/

SELECT 
	SUM(SalesQuantity) AS 'Qtd Vendida', 
	SUM(ReturnQuantity) AS 'Qtd Devolvida'
FROM 
	FactSales 
WHERE channelKey = 1

/*2. Uma nova ação no setor de Marketing precisará avaliar a média salarial de todos os clientes
da empresa, mas apenas de ocupação Professional. Utilize um comando SQL para atingir esse 
resultado.*/

SELECT 
	AVG(YearlyIncome) AS 'Média Salarial Anual'
FROM 
	DimCustomer 
WHERE Occupation = 'Professional'



*/
/*3. Você precisará fazer uma análise da quantidade de funcionários das lojas registradas na 
empresa. O seu gerente te pediu os seguintes números e informações:
a) Quantos funcionários tem a loja com mais funcionários?
b) Qual é o nome dessa loja?
c) Quantos funcionários tem a loja com menos funcionários?
d) Qual é o nome dessa loja?*/


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
 
	
	




/*4. A área de RH está com uma nova ação para a empresa, e para isso precisa saber a quantidade 
total de funcionários do sexo Masculino e do sexo Feminino. 
a) Descubra essas duas informações utilizando o SQL.
b) O funcionário e a funcionária mais antigos receberão uma homenagem. Descubra as 
seguintes informações de cada um deles: Nome, E-mail, Data de Contratação.*/

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



/*5. Agora você precisa fazer uma análise dos produtos. Será necessário descobrir as seguintes 
informações:
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


