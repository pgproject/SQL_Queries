
	--	z pliku .bak wystawionego na kursie moodle 
	--	odtworzyæ bazê danych
	-------------------------------------------------------

		USE [SampleDB]
		GO

	--	01
	--	Dane z tabeli [Production].[Product] pogrupowaæ po kolumnie [Color]
	--	wyœwietliæ kolumnê kolor [Color] oraz liczbê wierszy w grupie (COUNT)
	select color,
	count (*)
	from [Production].[Product]
	group by 
	Color



	--	02
	--	Dane z tabeli [Sales].[CurrencyRate] pogrupowaæ po kolumnach [FromCurrencyCode], [ToCurrencyCode]
	--	wyœwietliæ kolumny [FromCurrencyCode], [ToCurrencyCode] oraz dodatkowo
		--	MIN z kolumny [EndOfDayRate]	nadaæ alias: min_ratio_edr ,
		--	MAX z kolumny [EndOfDayRate]	nadaæ alias: max_ratio_edr ,
		--	AVG z kolumny [EndOfDayRate]	nadaæ alias: avg_ratio_edr 
		select
		[FromCurrencyCode], [ToCurrencyCode],
		min([EndOfDayRate]) as min_ratio_edr,
		max([EndOfDayRate]) as max_ratio_edr ,
		avg([EndOfDayRate]) as  avg_ratio_edr 

		from [Sales].[CurrencyRate]
		group by 
		FromCurrencyCode, ToCurrencyCode
		

	--	03
	--	Dane z tabeli [Sales].[SalesOrderDetail] pogrupowaæ po kolumnie [SalesOrderID]
	--	wyœwietliæ kolumnê [SalesOrderID]oraz dodatkowo
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