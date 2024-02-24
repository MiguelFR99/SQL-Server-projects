USE AdventureWorks2017

SELECT * FROM SALES.SalesOrderHeader WHERE SalesOrderID = 43659

SELECT * FROM Sales.SalesOrderDetail WHERE SalesOrderID = 43659

SELECT SOH.SalesOrderID
	  ,SOH.OrderDate
	  ,SOH.[Status]
	  ,SOH.CustomerID
	  ,SOH.SalesPersonID
	  --,SOH.TerritoryID
	  ,ST.[Name] AS TerritoryName
	  ,st.[Group] AS TerritoryGroup
	  ,st.CountryRegionCode
	  ,SOH.TotalDue
	  ,SOD.OrderQty
	  --,SOD.ProductID
	  ,SOD.UnitPrice
	  ,P.Name AS ProductName
	  ,P.Class
	  ,P.Color
	  ,p.Size
	  ,p.Style
FROM SALES.SalesOrderHeader AS SOH
INNER JOIN Sales.SalesOrderDetail AS SOD
	ON SOH.SalesOrderId = SOD.SalesOrderID
INNER JOIN  Sales.SalesTerritory AS ST
	ON ST.TerritoryID = SOH.TerritoryID
INNER JOIN Production.Product AS P
	ON P.ProductID = SOD.ProductID
--WHERE SOH.OrderDate BETWEEN '20130101' AND '20131231'
WHERE YEAR(SOH.OrderDate) = 2013


SELECT * FROM Sales.Customer
-- 19820


SELECT CUS.CustomerID
	   ,cus.AccountNumber
	   --,cus.TerritoryID
	   ,st.Name AS TerritoryName
	   ,st.[Group]
	   ,pp.FirstName
	   ,pp.LastName
FROM Sales.Customer AS CUS
INNER JOIN Person.Person  AS PP
	ON PP.BusinessEntityID = CUS.PersonID
INNER JOIN Sales.SalesTerritory AS ST
	ON ST.TerritoryID = CUS.TerritoryID
WHERE CUS.StoreID IS NULL
-- 18484 Clientes Individuos


SELECT CUS.CustomerID
	   ,CUS.AccountNumber
	   ,STO.Name AS StoreName
	   ,STO.SalesPersonID
	   ,ST.Name AS TerritoryName
	   ,ST.[Group]
FROM Sales.Customer AS CUS
INNER JOIN Sales.Store AS STO
	ON STO.BusinessEntityID = cus.StoreID
INNER JOIN SAles.SalesTerritory AS ST
	ON ST.TerritoryID = CUS.TerritoryID
WHERE CUS.PersonID IS NULL
--701 Clientes Empresa


-- Clientes 
SELECT * 
FROM sales.Customer
WHERE PersonID IS NOT NULL AND StoreID IS NOT NULL
-- 635



-- CONSULTA VENTAS 2013
SELECT SOH.SalesOrderID
	  ,SOH.OrderDate
	  ,SOH.[Status]
	  ,SOH.CustomerID
	  ,SOH.SalesPersonID
	  --,SOH.TerritoryID
	  ,ST.[Name] AS TerritoryName
	  ,st.[Group] AS TerritoryGroup
	  ,st.CountryRegionCode
	  ,SOH.TotalDue
	  ,SOD.OrderQty
	  --,SOD.ProductID
	  ,SOD.UnitPrice
	  ,P.Name AS ProductName
	  ,P.Class
	  ,P.Color
	  ,p.Size
	  ,p.Style
	  ,PP.FirstName
	  ,pp.LastName
	  ,st1.Name AS TerritoryName
	  ,st1.[Group]
FROM SALES.SalesOrderHeader AS SOH
INNER JOIN Sales.SalesOrderDetail AS SOD
	ON SOH.SalesOrderId = SOD.SalesOrderID
INNER JOIN  Sales.SalesTerritory AS ST
	ON ST.TerritoryID = SOH.TerritoryID
INNER JOIN Production.Product AS P
	ON P.ProductID = SOD.ProductID
INNER JOIN Sales.Customer AS CUS
	ON CUS.CustomerID = SOH.CustomerID
INNER JOIN Person.Person  AS PP
	ON PP.BusinessEntityID = CUS.PersonID
INNER JOIN Sales.SalesTerritory AS ST1
	ON ST1.TerritoryID = CUS.TerritoryID
--WHERE SOH.OrderDate BETWEEN '20130101' AND '20131231'
WHERE YEAR(SOH.OrderDate) = 2013



SELECT CUS.CustomerID
	   ,cus.AccountNumber
	   --,cus.TerritoryID
	   ,st.Name AS TerritoryName
	   ,st.[Group]
	   ,pp.FirstName
	   ,pp.LastName
FROM Sales.Customer AS CUS
INNER JOIN Person.Person  AS PP
	ON PP.BusinessEntityID = CUS.PersonID
INNER JOIN Sales.SalesTerritory AS ST
	ON ST.TerritoryID = CUS.TerritoryID
WHERE CUS.StoreID IS NULL
-- 18484 Clientes Individuos

-------------------------------------

SELECT SOH.SalesOrderID
	  ,SOH.OrderDate
	  ,SOH.[Status]
	  ,SOH.CustomerID
	  ,SOH.SalesPersonID
	  --,SOH.TerritoryID
	  ,ST.[Name] AS TerritoryName
	  ,st.[Group] AS TerritoryGroup
	  ,st.CountryRegionCode
	  ,SOH.TotalDue
	  ,SOD.OrderQty
	  --,SOD.ProductID
	  ,SOD.UnitPrice
	  ,P.Name AS ProductName
	  ,P.Class
	  ,P.Color
	  ,p.Size
	  ,p.Style
	  ,SC.FirstName
	  ,SC.LastName
	  ,SC.TerritoryName
	  ,SC.[Group]
FROM SALES.SalesOrderHeader AS SOH
INNER JOIN Sales.SalesOrderDetail AS SOD
	ON SOH.SalesOrderId = SOD.SalesOrderID
INNER JOIN  Sales.SalesTerritory AS ST
	ON ST.TerritoryID = SOH.TerritoryID
INNER JOIN Production.Product AS P
	ON P.ProductID = SOD.ProductID
INNER JOIN (

			SELECT CUS.CustomerID
				   ,cus.AccountNumber
				   --,cus.TerritoryID
				   ,st.Name AS TerritoryName
				   ,st.[Group]
				   ,pp.FirstName
				   ,pp.LastName
			FROM Sales.Customer AS CUS
			INNER JOIN Person.Person  AS PP
				ON PP.BusinessEntityID = CUS.PersonID
			INNER JOIN Sales.SalesTerritory AS ST
				ON ST.TerritoryID = CUS.TerritoryID
			WHERE CUS.StoreID IS NULL
			-- 18484 Clientes Individuos
			) AS SC
	ON SC.CustomerID = SOH.CustomerID
--WHERE SOH.OrderDate BETWEEN '20130101' AND '20131231'
WHERE YEAR(SOH.OrderDate) = 2013



SELECT CUS.CustomerID
	   ,cus.AccountNumber
	   --,cus.TerritoryID
	   ,st.Name AS TerritoryName
	   ,st.[Group]
	   ,pp.FirstName
	   ,pp.LastName
FROM Sales.Customer AS CUS
INNER JOIN Person.Person  AS PP
	ON PP.BusinessEntityID = CUS.PersonID
INNER JOIN Sales.SalesTerritory AS ST
	ON ST.TerritoryID = CUS.TerritoryID
WHERE CUS.StoreID IS NULL
-- 18484 Clientes Individuos




SELECT * FROM HumanResources.Employee -- 290
SELECT * FROM HumanResources.Department -- 16

--296
SELECT EDH.BusinessEntityID
	  ,pp.FirstName
	  ,pp.LastName
	  ,EM.LoginID
	  ,EM.JobTitle
	  ,EM.BirthDate
	  ,EM.MaritalStatus
	  ,EM.Gender
	  ,EM.HireDate
	  ,DE.Name AS Deparment
	  ,DE.GroupName
FROM HumanResources.EmployeeDepartmentHistory AS EDH
INNER JOIN HumanResources.Employee AS EM
	ON EM.BusinessEntityID = EDH.BusinessEntityID
INNER JOIN HumanResources.Department AS DE
	ON DE.DepartmentID=EDH.DepartmentID
INNER JOIN Person.Person AS PP
	ON PP.BusinessEntityID = EM.BusinessEntityID
WHERE EDH.EndDate IS NULL

-- 18484
SELECT * 
FROM Sales.vPersonDemographics
WHERE DateFirstPurchase is not null


SELECT CUS.CustomerID
	   ,cus.AccountNumber
	   --,cus.TerritoryID
	   ,st.Name AS TerritoryName
	   ,st.[Group]
	   ,pp.FirstName
	   ,pp.LastName
	   ,vpd.DateFirstPurchase
	   ,vpd.BirthDate
	   ,VPD.MaritalStatus
	   ,vpd.YearlyIncome
	   ,vpd.Gender
	   ,vpd.TotalChildren
	   ,vpd.NumberChildrenAtHome
	   ,vpd.Education
	   ,vpd.Occupation
	   ,vpd.HomeOwnerFlag
	   ,vpd.NumberCarsOwned
FROM Sales.Customer AS CUS
INNER JOIN Person.Person  AS PP
	ON PP.BusinessEntityID = CUS.PersonID
INNER JOIN Sales.SalesTerritory AS ST
	ON ST.TerritoryID = CUS.TerritoryID
INNER JOIN Sales.vPersonDemographics AS VPD
	ON VPD.BusinessEntityID = CUS.PersonID
WHERE CUS.StoreID IS NULL


-- SESION 11:
-- Tablas Temporales
-- CTE
-- Vistas/Views
-- Procedimientos Almacenados / Stored Procedures

-- TABLA TEMPORAL

SELECT 	 PD.BusinessEntityID
     ,PD.DateFirstPurchase
	 ,PD.BirthDate
	 ,PD.MaritalStatus
	 ,PD.YearlyIncome
	 ,PD.Gender
	 ,PD.TotalChildren
	 ,PD.NumberChildrenAtHome
	 ,PD.Education
	 ,PD.Occupation
	 ,PD.HomeOwnerFlag
	 ,PD.NumberCarsOwned
FROM Sales.vPersonDemographics AS PD
WHERE PD.BirthDate IS NOT NULL



SELECT CUS.CustomerID
	 ,CUS.AccountNumber
	 --,CUS.TerritoryID
	 ,PP.FirstName
	 ,PP.LastName
	 ,ST.Name AS Territory
	 ,SB.*
FROM Sales.Customer AS CUS
INNER JOIN Person.Person AS PP
	ON CUS.PersonID = PP.BusinessEntityID
INNER JOIN Sales.SalesTerritory AS ST
	ON ST.TerritoryID = CUS.TerritoryID
INNER JOIN (

		SELECT 	 PD.BusinessEntityID
			 ,PD.DateFirstPurchase
			 ,PD.BirthDate
			 ,PD.MaritalStatus
			 ,PD.YearlyIncome
			 ,PD.Gender
			 ,PD.TotalChildren
			 ,PD.NumberChildrenAtHome
			 ,PD.Education
			 ,PD.Occupation
			 ,PD.HomeOwnerFlag
			 ,PD.NumberCarsOwned
		FROM Sales.vPersonDemographics AS PD
		WHERE PD.BirthDate IS NOT NULL

			) AS SB
	ON SB.BusinessEntityID = PP.BusinessEntityID
WHERE CUS.StoreID IS NULL



		SELECT 	 PD.BusinessEntityID
			 ,PD.DateFirstPurchase
			 ,PD.BirthDate
			 ,PD.MaritalStatus
			 ,PD.YearlyIncome
			 ,PD.Gender
			 ,PD.TotalChildren
			 ,PD.NumberChildrenAtHome
			 ,PD.Education
			 ,PD.Occupation
			 ,PD.HomeOwnerFlag
			 ,PD.NumberCarsOwned
	    INTO #tablatemporal
		FROM Sales.vPersonDemographics AS PD
		WHERE PD.BirthDate IS NOT NULL

		SELECT * FROM #tablatemporal


SELECT CUS.CustomerID
	 ,CUS.AccountNumber
	 --,CUS.TerritoryID
	 ,PP.FirstName
	 ,PP.LastName
	 ,ST.Name AS Territory
	 ,SB.*
FROM Sales.Customer AS CUS
INNER JOIN Person.Person AS PP
	ON CUS.PersonID = PP.BusinessEntityID
INNER JOIN Sales.SalesTerritory AS ST
	ON ST.TerritoryID = CUS.TerritoryID
INNER JOIN #tablatemporal AS SB
	ON SB.BusinessEntityID = PP.BusinessEntityID
WHERE CUS.StoreID IS NULL



SELECT P.ProductID -- 295
       ,P.Name AS ProductName
       ,P.Color
       ,P.ListPrice
       ,PS.Name AS ProductSubCategory
       ,PC.Name AS ProductCategory
INTO #tablaproductos
FROM production.Product AS P
LEFT JOIN Production.ProductSubcategory AS PS
       ON PS.ProductSubcategoryID = P.ProductSubcategoryID
LEFT JOIN Production.ProductCategory AS PC
       ON PC.ProductCategoryID = PS.ProductCategoryID

SELECT * FROM #tablaproductos


	   
SELECT SOH.SalesOrderID 
	  ,SOH.OrderDate
	  ,SOH.Status
	  ,SOH.CustomerID
	  ,SOH.SalesPersonID
	  --,SOH.TerritoryID
	  ,ST.Name AS Territory
	  ,ST.[Group] AS Grupo
	  ,SOH.TotalDue
	  ,SOD.OrderQty
	  --,SOD.ProductID
	  ,P.Name AS ProductName
	  ,p.Class
	  ,p.Color
	  ,p.Size
	  ,p.Style
	  ,SOD.UnitPrice
	  ,TP.*
FROM Sales.SalesOrderHeader AS SOH
INNER JOIN  Sales.SalesOrderDetail AS SOD
	ON SOD.SalesOrderID = SOH.SalesOrderID
INNER JOIN Sales.SalesTerritory AS ST
	ON ST.TerritoryID = SOH.TerritoryID
INNER JOIN Production.Product AS P
	ON P.ProductID = SOD.ProductID
INNER JOIN #tablaproductos as tp
	ON TP.ProductID = P.ProductID
WHERE YEAR(SOH.OrderDate) = 2013


-- CTE (COMMON TABLE EXPRESSION)

WITH tablademografica AS 
(
SELECT 	 PD.BusinessEntityID
			 ,PD.DateFirstPurchase
			 ,PD.BirthDate
			 ,PD.MaritalStatus
			 ,PD.YearlyIncome
			 ,PD.Gender
			 ,PD.TotalChildren
			 ,PD.NumberChildrenAtHome
			 ,PD.Education
			 ,PD.Occupation
			 ,PD.HomeOwnerFlag
			 ,PD.NumberCarsOwned
FROM Sales.vPersonDemographics AS PD
WHERE PD.BirthDate IS NOT NULL
)
--SELECT * FROM tablademografica


SELECT CUS.CustomerID
	 ,CUS.AccountNumber
	 --,CUS.TerritoryID
	 ,PP.FirstName
	 ,PP.LastName
	 ,ST.Name AS Territory
	 ,TD.*
FROM Sales.Customer AS CUS
INNER JOIN Person.Person AS PP
	ON CUS.PersonID = PP.BusinessEntityID
INNER JOIN Sales.SalesTerritory AS ST
	ON ST.TerritoryID = CUS.TerritoryID
INNER JOIN tablademografica as td
	ON td.BusinessEntityID=PP.BusinessEntityID
WHERE CUS.StoreID IS NULL



WITH Productos AS (
SELECT P.ProductID -- 295
       ,P.Name AS ProductName
       ,P.Color
       ,P.ListPrice
       ,PS.Name AS ProductSubCategory
       ,PC.Name AS ProductCategory
FROM production.Product AS P
LEFT JOIN Production.ProductSubcategory AS PS
       ON PS.ProductSubcategoryID = P.ProductSubcategoryID
LEFT JOIN Production.ProductCategory AS PC
       ON PC.ProductCategoryID = PS.ProductCategoryID
)
--SELECT * FROM Productos


SELECT SOH.SalesOrderID 
	  ,SOH.OrderDate
	  ,SOH.Status
	  ,SOH.CustomerID
	  ,SOH.SalesPersonID
	  --,SOH.TerritoryID
	  ,ST.Name AS Territory
	  ,ST.[Group] AS Grupo
	  ,SOH.TotalDue
	  ,SOD.OrderQty
	  --,SOD.ProductID
	  ,P.Name AS ProductName
	  ,p.Class
	  ,p.Color
	  ,p.Size
	  ,p.Style
	  ,SOD.UnitPrice
	  ,TP.*
FROM Sales.SalesOrderHeader AS SOH
INNER JOIN  Sales.SalesOrderDetail AS SOD
	ON SOD.SalesOrderID = SOH.SalesOrderID
INNER JOIN Sales.SalesTerritory AS ST
	ON ST.TerritoryID = SOH.TerritoryID
INNER JOIN Production.Product AS P
	ON P.ProductID = SOD.ProductID
INNER JOIN Productos as tp
	on TP.ProductID = P.ProductID
WHERE YEAR(SOH.OrderDate) = 2013


-- VISTA/VIEW


CREATE VIEW VWDatosDemograficos
AS

WITH tablademografica AS 
(
SELECT 	 PD.BusinessEntityID
			 ,PD.DateFirstPurchase
			 ,PD.BirthDate
			 ,PD.MaritalStatus
			 ,PD.YearlyIncome
			 ,PD.Gender
			 ,PD.TotalChildren
			 ,PD.NumberChildrenAtHome
			 ,PD.Education
			 ,PD.Occupation
			 ,PD.HomeOwnerFlag
			 ,PD.NumberCarsOwned
FROM Sales.vPersonDemographics AS PD
WHERE PD.BirthDate IS NOT NULL
)
--SELECT * FROM tablademografica


SELECT CUS.CustomerID
	 ,CUS.AccountNumber
	 --,CUS.TerritoryID
	 ,PP.FirstName
	 ,PP.LastName
	 ,ST.Name AS Territory
	 ,TD.*
FROM Sales.Customer AS CUS
INNER JOIN Person.Person AS PP
	ON CUS.PersonID = PP.BusinessEntityID
INNER JOIN Sales.SalesTerritory AS ST
	ON ST.TerritoryID = CUS.TerritoryID
INNER JOIN tablademografica as td
	ON td.BusinessEntityID=PP.BusinessEntityID
WHERE CUS.StoreID IS NULL


SELECT * 
FROM VWDatosDemograficos
where Territory = 'Australia'





CREATE VIEW VWVentas
AS

WITH Productos AS (
SELECT P.ProductID -- 295
       ,P.Name AS ProductName
       ,P.Color
       ,P.ListPrice
       ,PS.Name AS ProductSubCategory
       ,PC.Name AS ProductCategory
FROM production.Product AS P
LEFT JOIN Production.ProductSubcategory AS PS
       ON PS.ProductSubcategoryID = P.ProductSubcategoryID
LEFT JOIN Production.ProductCategory AS PC
       ON PC.ProductCategoryID = PS.ProductCategoryID
)
--SELECT * FROM Productos


SELECT SOH.SalesOrderID 
	  ,SOH.OrderDate
	  ,SOH.Status
	  ,SOH.CustomerID
	  ,SOH.SalesPersonID
	  --,SOH.TerritoryID
	  ,ST.Name AS Territory
	  ,ST.[Group] AS Grupo
	  ,SOH.TotalDue
	  ,SOD.OrderQty
	  --,SOD.ProductID
	 -- ,P.Name AS ProductName
	  ,p.Class
	--  ,p.Color
	  ,p.Size
	  ,p.Style
	  ,SOD.UnitPrice
	  ,TP.*
FROM Sales.SalesOrderHeader AS SOH
INNER JOIN  Sales.SalesOrderDetail AS SOD
	ON SOD.SalesOrderID = SOH.SalesOrderID
INNER JOIN Sales.SalesTerritory AS ST
	ON ST.TerritoryID = SOH.TerritoryID
INNER JOIN Production.Product AS P
	ON P.ProductID = SOD.ProductID
INNER JOIN Productos as tp
	on TP.ProductID = P.ProductID
WHERE YEAR(SOH.OrderDate) = 2013


SELECT * 
FROM VWVentas
WHERE YEAR(OrderDate) =  2013


-- STORED PROCEDURE / PROCEDIMIENTOS ALMACENADOS
CREATE OR ALTER PROCEDURE SPVentas0901
	@YEAR INT
AS
SELECT SOH.SalesOrderNumber
         ,SOH.SalesOrderID
         ,SOH.OrderDate
         ,SOH.ShipDate
         ,SOH.CustomerID
         ,SOH.TerritoryID
         ,ST.Name AS Territory
         ,ST.[Group] AS [Group]
         ,SOH.TotalDue
         ,SOD.ProductID
         ,SOD.UnitPrice
FROM SAles.SalesOrderHeader AS SOH
INNER JOIN Sales.SalesOrderDetail AS SOD
       ON SOH.SalesOrderID = SOD.SalesOrderID
INNER JOIN Sales.SalesTerritory AS ST
       ON st.TerritoryID = soh.TerritoryID 
WHERE YEAR(OrderDate) = @YEAR


EXECUTE SPVentas0901 @year = 2014


SELECT SOH.SalesOrderNumber
         ,SOH.SalesOrderID
         ,SOH.OrderDate
         ,SOH.ShipDate
         ,SOH.CustomerID
         ,SOH.TerritoryID
         ,ST.Name AS Territory
         ,ST.[Group] AS [Group]
         ,SOH.TotalDue
         ,SOD.ProductID
         ,SOD.UnitPrice
FROM SAles.SalesOrderHeader AS SOH
INNER JOIN Sales.SalesOrderDetail AS SOD
       ON SOH.SalesOrderID = SOD.SalesOrderID
INNER JOIN Sales.SalesTerritory AS ST
       ON st.TerritoryID = soh.TerritoryID 



