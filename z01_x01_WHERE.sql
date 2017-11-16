
	--	z pliku .bak wystawionego na kursie moodle 
	--	odtworzyæ bazê danych [SampleDB]
	-------------------------------------------------------

		USE [SampleDB]
		GO

	--	01
	--	Wyœwietliæ wszystkie wiersze z tabeli [Production].[Product]
	--	Wyœwietliæ jedynie kolumny:
		--	[ProductID]
		--	[Name]
		--	[ProductNumber]
		select 
	[ProductID],
		[Name],
		[ProductNumber]
		from [Production].[Product]

	--	02
	--	Wyœwietliæ wiersze z tabeli [Sales].[CurrencyRate] gdzie kolumna [ToCurrencyCode] ma wartoœæ 'AUD'
	--	Wyœwietliæ jedynie kolumny:
		--	[CurrencyRateID] ,
		--	[CurrencyRateDate] ,
		--	[FromCurrencyCode] ,
		--	[ToCurrencyCode] ,
		--	[AverageRate] ,
		--	[EndOfDayRate]

		select [CurrencyRateID] ,
		[CurrencyRateDate] ,
		[FromCurrencyCode] ,
		[ToCurrencyCode] ,
		[AverageRate] ,
		[EndOfDayRate]
		from 
		[Sales].[CurrencyRate]
		where 
		[ToCurrencyCode]='aud'
	
	--	03
	--	Wyœwietliæ wiersze z tabeli [Sales].[CurrencyRate] gdzie kolumna [ToCurrencyCode] ma wartoœæ 'AUD' lub 'CAD' (sk³adnia IN)
	--	Wyœwietliæ jedynie kolumny:
		--	[CurrencyRateID] ,
		--	[CurrencyRateDate] ,
		--	[FromCurrencyCode] ,
		--	[ToCurrencyCode] ,
		--	[AverageRate] ,
		--	[EndOfDayRate]
		select 
		[CurrencyRateID] ,
		[CurrencyRateDate] ,
		[FromCurrencyCode] ,
		[ToCurrencyCode] ,
		[AverageRate] ,
		[EndOfDayRate]
		from 
		[Sales].[CurrencyRate]
		where 
		[ToCurrencyCode] in ('aud', 'cad')
	--	04
	--	Wyœwietliæ wiersze z tabeli [Sales].[CurrencyRate] gdzie kolumna [ToCurrencyCode] ma wartoœæ 'AUD'
	--	a kolumna [CurrencyRateDate] wartoœci pomiêdzy '20110101' oraz '20120101' (sk³adnia BETWEEN)
	--	Wyœwietliæ jedynie kolumny:
		--	[CurrencyRateID] ,
		--	[CurrencyRateDate] ,
		--	[FromCurrencyCode] ,
		--	[ToCurrencyCode] ,
		--	[AverageRate] ,
		--	[EndOfDayRate]
		select 
			[CurrencyRateID] ,
			[CurrencyRateDate] ,
			[FromCurrencyCode] ,
			[ToCurrencyCode] ,
			[AverageRate] ,
			[EndOfDayRate]
			from 
			[Sales].[CurrencyRate]
			where [ToCurrencyCode]='aud' and
			[CurrencyRateDate] between '20110101' and '20120101' 
	--	05
	--	Wyœwietliæ wiersze z tabeli [Sales].[SalesPerson] gdzie kolumna [Bonus] wiêksza od 5000 lub mniejsza od 1000
	--	Wyœwietliæ jedynie kolumny:
		--	[BusinessEntityID] ,
		--	[TerritoryID] ,
		--	[SalesQuota] ,
		--	[Bonus] ,
		--	[CommissionPct]
		select 
			[BusinessEntityID] ,
			[TerritoryID] ,
			[SalesQuota] ,
			[Bonus] ,
			[CommissionPct]
			from [Sales].[SalesPerson]
			where [Bonus] >5000 or [Bonus]<1000

	--	06
	--	Wyœwietliæ wiersze z tabeli [Sales].[SalesPerson] gdzie kolumna [SalesQuota] ma wartoœæ NULL
	--	Wyœwietliæ jedynie kolumny:
		--	[BusinessEntityID] ,
		--	[TerritoryID] ,
		--	[SalesQuota] ,
		--	[Bonus] ,
		--	[CommissionPct]
		select 
			[BusinessEntityID] ,
			[TerritoryID] ,
			[SalesQuota] ,
			[Bonus] ,
			[CommissionPct]
			from [Sales].[SalesPerson]
			where [SalesQuota]is NULL
