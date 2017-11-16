
	--	z pliku .bak wystawionego na kursie moodle 
	--	odtworzyæ bazê danych
	-------------------------------------------------------

		USE [SampleDB]
		GO

	--	01
	--	Dane z tabeli [Production].[Product] pogrupowaæ po kolumnie [Color]
	--	wyœwietliæ kolumnê kolor [Color] oraz liczbê wierszy w grupie (COUNT)
	--	wyœwietliæ jedynie grupy w których iloœæ wierszy przekracza 100
	select [color],
	count (*)
	from [Production].[Product] 
	group by
	[Color]
	HAVING
	COUNT(*) > 100

	--	02
	--	Dane z tabeli [Sales].[CurrencyRate] pogrupowaæ po kolumnach [FromCurrencyCode], [ToCurrencyCode]
	--	wyœwietliæ kolumny [FromCurrencyCode], [ToCurrencyCode] oraz dodatkowo
		--	MIN z kolumny [EndOfDayRate]	nadaæ alias: min_ratio_edr ,
		--	MAX z kolumny [EndOfDayRate]	nadaæ alias: max_ratio_edr ,
		--	AVG z kolumny [EndOfDayRate]	nadaæ alias: avg_ratio_edr 

		-- wyœwietliæ jedynie grupy dla których ró¿nica MAX - MIN jest wiêksza ni¿ 0.1

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