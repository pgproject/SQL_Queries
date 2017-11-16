
	--	z pliku .bak wystawionego na kursie moodle 
	--	odtworzy� baz� danych [SampleDB]
	-------------------------------------------------------

		USE [SampleDB]
		GO

	--	01
	--	Wy�wietli� wszystkie wiersze z tabeli [Production].[Product]
	--	Wy�wietli� jedynie kolumny:
		--	[ProductID]
		--	[Name]
		--	[ProductNumber]
		select 
	[ProductID],
		[Name],
		[ProductNumber]
		from [Production].[Product]

	--	02
	--	Wy�wietli� wiersze z tabeli [Sales].[CurrencyRate] gdzie kolumna [ToCurrencyCode] ma warto�� 'AUD'
	--	Wy�wietli� jedynie kolumny:
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
	--	Wy�wietli� wiersze z tabeli [Sales].[CurrencyRate] gdzie kolumna [ToCurrencyCode] ma warto�� 'AUD' lub 'CAD' (sk�adnia IN)
	--	Wy�wietli� jedynie kolumny:
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
	--	Wy�wietli� wiersze z tabeli [Sales].[CurrencyRate] gdzie kolumna [ToCurrencyCode] ma warto�� 'AUD'
	--	a kolumna [CurrencyRateDate] warto�ci pomi�dzy '20110101' oraz '20120101' (sk�adnia BETWEEN)
	--	Wy�wietli� jedynie kolumny:
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
	--	Wy�wietli� wiersze z tabeli [Sales].[SalesPerson] gdzie kolumna [Bonus] wi�ksza od 5000 lub mniejsza od 1000
	--	Wy�wietli� jedynie kolumny:
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
	--	Wy�wietli� wiersze z tabeli [Sales].[SalesPerson] gdzie kolumna [SalesQuota] ma warto�� NULL
	--	Wy�wietli� jedynie kolumny:
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
