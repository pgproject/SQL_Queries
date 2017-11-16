		USE [SampleDB]
		GO

	--	z pliku .bak wystawionego na kursie moodle 
	--	odtworzyæ bazê danych i nazwaæ [SampleDB]
	-------------------------------------------------------
	SELECT
			[h].[SalesOrderID] ,
			[d].[SalesOrderDetailID] ,
			[d].[ProductID] ,
			[p].[Name] ,
			[p].[ProductNumber] ,
			[d].[UnitPrice] ,
			[p].[ListPrice]	,
			([p].[ListPrice]-[d].[UnitPrice])/[p].[ListPrice] AS [rabat]
		FROM
					[Sales].[SalesOrderHeader]	AS [h]
		INNER JOIN	[Sales].[SalesOrderDetail]	AS [d] ON [d].[SalesOrderID] = [h].[SalesOrderID]
		INNER JOIN	[Production].[Product]		AS [p] ON [p].[ProductID] = [d].[ProductID]
		


	--	u¿ywaj¹c powy¿szej kwerendy utworzyæ:
	--		a) widok zwracaj¹cy wszystkie dane
	--		b) widok zwracaj¹cy TOP 100 wierszy
	--		c) funkcjê Table-Valued z parametrem @ProductID oraz warunkiem [ProductID] < @ProductID
	--		d) procedurê która tworzy tabelê i odk³ada do tej tabeli dane z zapytania
	-------------------------------------------------------
	create view z1_a
	as
	SELECT
			[h].[SalesOrderID] ,
			[d].[SalesOrderDetailID] ,
			[d].[ProductID] ,
			[p].[Name] ,
			[p].[ProductNumber] ,
			[d].[UnitPrice] ,
			[p].[ListPrice]	,
			([p].[ListPrice]-[d].[UnitPrice])/[p].[ListPrice] AS [rabat]
		FROM		[Sales].[SalesOrderHeader]	AS [h]
		INNER JOIN	[Sales].[SalesOrderDetail]	AS [d] ON [d].[SalesOrderID] = [h].[SalesOrderID]
		INNER JOIN	[Production].[Product]		AS [p] ON [p].[ProductID] = [d].[ProductID]
		GO

		select *
		from z1_a

		create view z2_a
	as
	SELECT top 100
			[h].[SalesOrderID] ,
			[d].[SalesOrderDetailID] ,
			[d].[ProductID] ,
			[p].[Name] ,
			[p].[ProductNumber] ,
			[d].[UnitPrice] ,
			[p].[ListPrice]	,
			([p].[ListPrice]-[d].[UnitPrice])/[p].[ListPrice] AS [rabat]
		FROM		[Sales].[SalesOrderHeader]	AS [h]
		INNER JOIN	[Sales].[SalesOrderDetail]	AS [d] ON [d].[SalesOrderID] = [h].[SalesOrderID]
		INNER JOIN	[Production].[Product]		AS [p] ON [p].[ProductID] = [d].[ProductID]
		GO

		select *
		from z2_a

		create function z3_a(@ProductID int= null)
		returns table
		as 
		return 
		select top 100
		[h].[SalesOrderID] ,
			[d].[SalesOrderDetailID] ,
			[d].[ProductID] ,
			[p].[Name] ,
			[p].[ProductNumber] ,
			[d].[UnitPrice] ,
			[p].[ListPrice]	,
			([p].[ListPrice]-[d].[UnitPrice])/[p].[ListPrice] AS [rabat]
		FROM		[Sales].[SalesOrderHeader]	AS [h]
		INNER JOIN	[Sales].[SalesOrderDetail]	AS [d] ON [d].[SalesOrderID] = [h].[SalesOrderID]
		INNER JOIN	[Production].[Product]		AS [p] ON [p].[ProductID] = [d].[ProductID]
		where p.ProductID<@ProductID
		GO
		
		select *
		from z3_a(750)


	--	po utworzeniu obiektów napipsaæ zapytania sprawdzaj¹ce
	--	w widoku sys.objects czy obiekty istniej¹
	-------------------------------------------------------





