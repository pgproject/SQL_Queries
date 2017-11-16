
	--	z pliku .bak wystawionego na kursie moodle 
	--	odtworzy� baz� danych
	-------------------------------------------------------

		USE [SampleDB]
		GO

	--	01
	--	Dane z tabeli [Production].[Product] pogrupowa� po kolumnie [Color]
	--	wy�wietli� kolumn� kolor [Color] oraz liczb� wierszy w grupie (COUNT)
	select color,
	count (*)
	from [Production].[Product]
	group by 
	Color



	--	02
	--	Dane z tabeli [Sales].[CurrencyRate] pogrupowa� po kolumnach [FromCurrencyCode], [ToCurrencyCode]
	--	wy�wietli� kolumny [FromCurrencyCode], [ToCurrencyCode] oraz dodatkowo
		--	MIN z kolumny [EndOfDayRate]	nada� alias: min_ratio_edr ,
		--	MAX z kolumny [EndOfDayRate]	nada� alias: max_ratio_edr ,
		--	AVG z kolumny [EndOfDayRate]	nada� alias: avg_ratio_edr 
		select
		[FromCurrencyCode], [ToCurrencyCode],
		min([EndOfDayRate]) as min_ratio_edr,
		max([EndOfDayRate]) as max_ratio_edr ,
		avg([EndOfDayRate]) as  avg_ratio_edr 

		from [Sales].[CurrencyRate]
		group by 
		FromCurrencyCode, ToCurrencyCode
		

	--	03
	--	Dane z tabeli [Sales].[SalesOrderDetail] pogrupowa� po kolumnie [SalesOrderID]
	--	wy�wietli� kolumn� [SalesOrderID]oraz dodatkowo
		--	MIN z kolumny [UnitPrice]
		--	MAX z kolumny [UnitPrice]
		--	COUNT	
		select [SalesOrderID],
		min([UnitPrice]),
		max([UnitPrice]),
		count (*)
		from [Sales].[SalesOrderDetail]
		group by 
		[SalesOrderID]