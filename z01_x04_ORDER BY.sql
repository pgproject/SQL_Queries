
	--	z pliku .bak wystawionego na kursie moodle 
	--	odtworzy� baz� danych
	-------------------------------------------------------

		USE [SampleDB]
		GO

	--	01
	--	Dane z tabeli [Production].[Product] pogrupowa� po kolumnie [Color]
	--	wy�wietli� kolumn� kolor [Color] oraz liczb� wierszy w grupie (COUNT)
	--	wy�wietli� jedynie grupy w kt�rych ilo�� wierszy przekracza 100

	--	kolumnie z ilo�ci� wierszy nada� alias [cnt], posortowa� wyniki po [cnt] rosn�co

	select
	[color],
	count(*) as [cnt]
	from [Production].[Product]
	group by [color]
	having count(*)>100
	order by [cnt] asc


	--	02
	--	Dane z tabeli [Sales].[CurrencyRate] pogrupowa� po kolumnach [FromCurrencyCode], [ToCurrencyCode]
	--	wy�wietli� kolumny [FromCurrencyCode], [ToCurrencyCode] oraz dodatkowo
		--	MIN z kolumny [EndOfDayRate]	nada� alias: min_ratio_edr ,
		--	MAX z kolumny [EndOfDayRate]	nada� alias: max_ratio_edr ,
		--	AVG z kolumny [EndOfDayRate]	nada� alias: avg_ratio_edr 

		-- posortowa� po kolumnie avg_ratio_edr malej�co

		select 
		[FromCurrencyCode], 
		[ToCurrencyCode],
		min([EndOfDayRate]) as min_ratio_edr ,
		max([EndOfDayRate])as max_ratio_edr ,
		avg([EndOfDayRate])as avg_ratio_edr 
		from 	[Sales].[CurrencyRate]
		group by [FromCurrencyCode], [ToCurrencyCode]
		order by [avg_ratio_edr] desc	