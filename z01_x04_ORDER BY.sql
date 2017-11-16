
	--	z pliku .bak wystawionego na kursie moodle 
	--	odtworzyæ bazê danych
	-------------------------------------------------------

		USE [SampleDB]
		GO

	--	01
	--	Dane z tabeli [Production].[Product] pogrupowaæ po kolumnie [Color]
	--	wyœwietliæ kolumnê kolor [Color] oraz liczbê wierszy w grupie (COUNT)
	--	wyœwietliæ jedynie grupy w których iloœæ wierszy przekracza 100

	--	kolumnie z iloœci¹ wierszy nadaæ alias [cnt], posortowaæ wyniki po [cnt] rosn¹co

	select
	[color],
	count(*) as [cnt]
	from [Production].[Product]
	group by [color]
	having count(*)>100
	order by [cnt] asc


	--	02
	--	Dane z tabeli [Sales].[CurrencyRate] pogrupowaæ po kolumnach [FromCurrencyCode], [ToCurrencyCode]
	--	wyœwietliæ kolumny [FromCurrencyCode], [ToCurrencyCode] oraz dodatkowo
		--	MIN z kolumny [EndOfDayRate]	nadaæ alias: min_ratio_edr ,
		--	MAX z kolumny [EndOfDayRate]	nadaæ alias: max_ratio_edr ,
		--	AVG z kolumny [EndOfDayRate]	nadaæ alias: avg_ratio_edr 

		-- posortowaæ po kolumnie avg_ratio_edr malej¹co

		select 
		[FromCurrencyCode], 
		[ToCurrencyCode],
		min([EndOfDayRate]) as min_ratio_edr ,
		max([EndOfDayRate])as max_ratio_edr ,
		avg([EndOfDayRate])as avg_ratio_edr 
		from 	[Sales].[CurrencyRate]
		group by [FromCurrencyCode], [ToCurrencyCode]
		order by [avg_ratio_edr] desc	