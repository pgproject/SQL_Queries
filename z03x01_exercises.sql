
	--	z pliku .bak wystawionego na kursie moodle 
	--	odtworzyæ bazê danych [SampleDB]
	-------------------------------------------------------
	use SampleDB
	go

	--	01
	--	liczba wszystkich faktur oraz suma podatku ([TaxAmt]) w tabeli [Sales].[SalesOrderHeader] w podziale na terytorium [Sales].[SalesTerritory]
	--
	--	po³¹czyæ ze sob¹ tabele [Sales].[SalesOrderHeader] oraz [Sales].[SalesTerritory] (inner join po [TerritoryID])
	--	podrupowaæ dane wg terytorium ([TerritoryID], [Name])
	--	pozostawiæ w czêœci SELECT nastêpuj¹ce kolumny:
		--	[TerritoryID]
		--	[Name]
		--	liczba wierszy (COUNT)
		--	suma (SUM) kolumny [TaxAmt]
		select [st].[TerritoryID],
		[st].[Name],
		count (*) as [cnt],
		sum([soh].[TaxAmt]) AS [TaxAmt]
		from Sales.SalesOrderHeader as [soh]
		INNER JOIN [Sales].[SalesTerritory] AS [st] ON [st].[TerritoryID] = [soh].[TerritoryID]
		group by [st].[TerritoryID], [st].[Name]
		order by [st].[TerritoryID]
	


