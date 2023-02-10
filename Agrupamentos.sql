/*FACTSALES
1. a) Fa�a um resumo da quantidade vendida (SalesQuantity) de acordo com o canal de vendas
(channelkey).*/
--SELECT * FROM FACTSALES

SELECT 
	channelKey as 'Canal',
	SUM(SalesQuantity) AS 'Quantidade Vendida'
FROM
	FactSales
GROUP BY channelKey

/*b) Fa�a um agrupamento mostrando a quantidade total vendida (SalesQuantity) e quantidade
total devolvida (Return Quantity) de acordo com o ID das lojas (StoreKey).*/

SELECT
	StoreKey,
	SUM(SalesQuantity) AS 'Qtd Total Vendida',
	SUM(ReturnQuantity) AS 'Qtd Total Devolvida'
FROM
	FactSales

GROUP BY StoreKey

/*c) Fa�a um resumo do valor total vendido (SalesAmount) para cada canal de venda, mas apenas
para o ano de 2007.*/

SELECT
	channelkey,
	SUM(SalesAmount) AS 'Valor Total Vendido em 2007'
FROM
	FactSales
WHERE DateKey BETWEEN '20070101' AND '20071231'
GROUP BY channelKey

/*2. Voc� precisa fazer uma an�lise de vendas por produtos. O objetivo final � descobrir o valor
total vendido (SalesAmount) por produto (ProductKey).
a) A tabela final dever� estar ordenada de acordo com a quantidade vendida e, al�m disso,
mostrar apenas os produtos que tiveram um resultado final de vendas maior do que
$5.000.000.*/

SELECT 
	ProductKey,
	SUM(SalesAmount)
FROM
	FactSales

GROUP BY ProductKey
HAVING SUM(SalesAmount)>=5000000
ORDER BY SUM(SalesAmount) DESC

/*b) Fa�a uma adapta��o no exerc�cio anterior e mostre os Top 10 produtos com mais vendas.
Desconsidere o filtro de $5.000.000 aplicado.*/

SELECT TOP(10)
	ProductKey,
	SUM(SalesAmount)
FROM
	FactSales

GROUP BY ProductKey

ORDER BY SUM(SalesAmount) DESC



/*FACTONLINESALES

3. a) Voc� deve fazer uma consulta � tabela FactOnlineSales e descobrir qual � o ID
(CustomerKey) do cliente que mais realizou compras online (de acordo com a coluna
SalesQuantity).*/

--SELECT * FROM FactOnlineSales

SELECT TOP (1)
	CustomerKey,
	SUM(SalesQuantity) AS 'MAIS REALIZOU COMPAS ONLINE'
FROM
	FactOnlineSales
GROUP BY CustomerKey
ORDER BY SUM(SalesQuantity) DESC


/*b) Feito isso, fa�a um agrupamento de total vendido (SalesQuantity) por ID do produto
e descubra quais foram os top 3 produtos mais comprados pelo cliente da letra a)*/

SELECT TOP (3)
	ProductKey AS 'ID Do Produto',
	SUM(SalesQuantity) AS 'Qtd Comprada'
FROM
	FactOnlineSales
WHERE CustomerKey = 19037
GROUP BY ProductKey
ORDER BY SUM(SalesQuantity) DESC



/*DIMPRODUCT
4. a) Fa�a um agrupamento e descubra a quantidade total de produtos por marca.*/
--SELECT * FROM DimProduct

SELECT 
	BrandName AS 'Marca',
	COUNT (BrandName) AS 'Produtos'
FROM
	DimProduct
GROUP BY (BrandName)

--b) Determine a m�dia do pre�o unit�rio (UnitPrice) para cada ClassName.

SELECT 
	ClassName AS 'Classe',
	AVG (UnitPrice) AS 'M�dia de Pre�o'
FROM
	DimProduct
GROUP BY ClassName
--c) Fa�a um agrupamento de cores e descubra o peso total que cada cor de produto possui.

SELECT 
	SUM(Weight) AS 'PESO',
	ColorName AS 'COR'
FROM
	DimProduct
GROUP BY ColorName

/*5. Voc� dever� descobrir o peso total para cada tipo de produto (StockTypeName).
A tabela final deve considerar apenas a marca �Contoso� e ter os seus valores classificados em
ordem decrescente.*/

SELECT 
	StocktypeName,
	SUM(Weight)
FROM
	DimProduct
WHERE BrandName = 'Contoso'
GROUP BY StockTypeName
ORDER BY SUM(Weight) DESC

/*6. Voc� seria capaz de confirmar se todas as marcas dos produtos possuem � disposi��o todas as
16 op��es de cores?*/
--SELECT * FROM DimProduct

SELECT
	BrandName AS 'Marca',
	COUNT(DISTINCT ColorName) AS 'Cor'
FROM 
	DimProduct
GROUP BY BrandName

/*DIMCUSTOMER
7. Fa�a um agrupamento para saber o total de clientes de acordo com o Sexo e tamb�m a m�dia
salarial de acordo com o Sexo. Corrija qualquer resultado �inesperado� com os seus
conhecimentos em SQL.*/
--SELECT * FROM DimCustomer

SELECT 
	Gender AS 'Sexo',
	COUNT (Gender) AS 'Total de Clientes',
	AVG(YearlyIncome) AS 'Salario Homens (Anual)'
FROM 
	DimCustomer
WHERE Gender IS NOT NULL
GROUP BY Gender

/*8. Fa�a um agrupamento para descobrir a quantidade total de clientes e a m�dia salarial de
acordo com o seu n�vel escolar. Utilize a coluna Education da tabela DimCustomer para fazer
esse agrupamento.*/

SELECT 
	COUNT (CustomerKey) AS 'Total de Clientes',
	AVG(YearlyIncome) AS 'Salario Anual',
	Education AS 'Escolaridade'
FROM 
	DimCustomer
WHERE Gender IS NOT NULL
GROUP BY Education

/*DIMEMPLOYEE
9. Fa�a uma tabela resumo mostrando a quantidade total de funcion�rios de acordo com o
Departamento (DepartmentName). Importante: Voc� dever� considerar apenas os
funcion�rios ativos.*/
--SELECT * FROM DimEmployee

SELECT 
	COUNT(DepartmentName) AS 'Qtde Funcion�rios',
	DepartmentName AS 'Departamento'
FROM 
	DimEmployee
WHERE Status = 'Current'
GROUP BY DepartmentName


/*10. Fa�a uma tabela resumo mostrando o total de VacationHours para cada cargo (Title). Voc�
deve considerar apenas as mulheres, dos departamentos de Production, Marketing,
Engineering e Finance, para os funcion�rios contratados entre os anos de 1999 e 2000.*/

--SELECT * FROM DimEmployee

SELECT 
	SUM(VacationHours) AS 'Total de Horas',
	Title AS 'Cargo'
FROM
	DimEmployee
WHERE Gender = 'F'
AND DepartmentName IN ('Production', 'Marketing', 'Engineering', 'Finance')
AND HireDate BETWEEN '1999-01-01' and '2000-12-31'

GROUP BY Title

