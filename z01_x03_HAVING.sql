
	--	z pliku .bak wystawionego na kursie moodle 
	--	odtworzy� baz� danych
	-------------------------------------------------------

		USE [SampleDB]
		GO

	--	01
	--	Dane z tabeli [Production].[Product] pogrupowa� po kolumnie [Color]
	--	wy�wietli� kolumn� kolor [Color] oraz liczb� wierszy w grupie (COUNT)
	--	wy�wietli� jedynie grupy w kt�rych ilo�� wierszy przekracza 100
	select [color],
	count (*)
	from [Production].[Product] 
	group by
	[Color]
	HAVING
	COUNT(*) > 100

	--	02
	--	Dane z tabeli [Sales].[CurrencyRate] pogrupowa� po kolumnach [FromCurrencyCode], [ToCurrencyCode]
	--	wy�wietli� kolumny [FromCurrencyCode], [ToCurrencyCode] oraz dodatkowo
		--	MIN z kolumny [EndOfDayRate]	nada� alias: min_ratio_edr ,
		--	MAX z kolumny [EndOfDayRate]	nada� alias: max_ratio_edr ,
		--	AVG z kolumny [EndOfDayRate]	nada� alias: avg_ratio_edr 

		-- wy�wietli� jedynie grupy dla kt�rych r�nica MAX - MIN jest wi�ksza ni� 0.1

		select 
		[FromCurrencyCode], 
		[ToCurrencyCode],
		min([EndOfDayRate]) as min_ratio_edr ,
		max([EndOfDayRate]) as max_ratio_edr ,
		avg([EndOfDayRate]) as avg_ratio_edr 
		from [Sales].[CurrencyRate]
		group by
		[FromCurrencyCode], 
		[ToCurrencyCode]
		having max([EndOfDayRate])-min([EndOfDayRate])>0.1