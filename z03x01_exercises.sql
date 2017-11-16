
	--	z pliku .bak wystawionego na kursie moodle 
	--	odtworzy� baz� danych [SampleDB]
	-------------------------------------------------------
	use SampleDB
	go

	--	01
	--	liczba wszystkich faktur oraz suma podatku ([TaxAmt]) w tabeli [Sales].[SalesOrderHeader] w podziale na terytorium [Sales].[SalesTerritory]
	--
	--	po��czy� ze sob� tabele [Sales].[SalesOrderHeader] oraz [Sales].[SalesTerritory] (inner join po [TerritoryID])
	--	podrupowa� dane wg terytorium ([TerritoryID], [Name])
	--	pozostawi� w cz�ci SELECT nast�puj�ce kolumny:
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
	


