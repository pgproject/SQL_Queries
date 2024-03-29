
	--	z pliku .bak wystawionego na kursie moodle 
	--	odtworzyć bazę danych
	-------------------------------------------------------

		USE [SampleDB]
		GO

		

	--	01
	--	Wszystkie Adresy z [Person].[Address] z miastem Toronto ([City])
	select *
		from [Person].[Address]
	
	select AddressID, AddressLine1, AddressLine2, City, StateProvinceID,PostalCode
	from [Person].[Address]
	where city = 'toronto'


	--	02
	--	Produkty ([Production].[Product]) z niepustym polem [Color]. jedynie kolumny ([ProductID],[Name],[ProductNumber])
	select *
	from [Production].[Product]
	
	select [ProductID],
	[Name],
	[ProductNumber]
	from [Production].[Product]
	where [color] <> ' '


	--	03
	--	Produkty ([Production].[Product]) z numerem ([ProductNumber]) zaczynającym się na literę A, B lub C. 
	--	jedynie kolumny ([ProductID],[Name],[ProductNumber])
	select 
	[ProductID],
	[Name],
	[ProductNumber]
	from
	[Production].[Product]
	where [ProductNumber] like '[ABC]%'
	--	04
	--	Wszystkie Adresy z [Person].[Address] z prowincją ([StateProvinceID]) pomiędzy 50 a 55
	--	Posortowane wg prowincji malejąco
	select *
		from [Person].[Address]

	select AddressID, AddressLine1, AddressLine2, City, StateProvinceID, PostalCode
	from [Person].[Address]
	where [StateProvinceID] between 50 and 55
	order by [StateProvinceID] desc


	--	05
	--	Liczba produktów ([Production].[Product]) z niepustym polem [Color]. Kolumnę nazwać aliasem [ilosc_kolor].
	select *
	from [Production].[Product]
	
	select COUNT(*) as ilosc_kolor
	from Production.Product
	where color <> ' '



	--	06
	--	Minimalna, Maksymalna oraz Średnia wartość kolumny [SafetyStockLevel] dla tabeli [Production].[Product] 
	--	Dla produktów o kolorze ze zbioru: Black, Silver oraz White. Kolumny zaaliasować: ssl_min, ssl_max, ssl_avg.
	select *
	from [Production].[Product]

	select 
	min([SafetyStockLevel])as ssl_min,
	max([SafetyStockLevel])as ssl_max,
	avg([SafetyStockLevel]) as ssl_avg
	from [Production].[Product]
	where color in ('black' , 'silver' , 'white')

	--	07
	--	(to co w 06)
	--	Minimalna, Maksymalna oraz Średnia wartość kolumny [SafetyStockLevel] dla tabeli [Production].[Product] 
	--	Dla produktów o kolorze ze zbioru: Black, Silver oraz White. Kolumny zaaliasować: ssl_min, ssl_max, ssl_avg.
	--	(dodatkowo)
	--	pogrupowane oraz posortowane po kolumnie [Color] (dodać tą kolumnę do selecta)

	select 
	color,
	min([SafetyStockLevel])as ssl_min,
	max([SafetyStockLevel])as ssl_max,
	avg([SafetyStockLevel]) as ssl_avg
	from [Production].[Product]
	where color in ('black' , 'silver' , 'white')
	group by color
	order by color

	--	08
	--	Ilość adresów z [Person].[Address] pogrupowanych wg prowincji ([StateProvinceID])
	--	Posortowane wg kolumny zliczającej adresy rosnąco - kolumnę nazwac [liczba]
	select *
		from [Person].[Address]

	select  StateProvinceID,
	count (*) as liczba 
	from [Person].[Address]
	group by [StateProvinceID]
	order by liczba asc 
		


	--	09
	--	Lista prowincji ([StateProvinceID]) z [Person].[Address], dla których istnieje więcej niż 100 Adresów w Tabeli
	select [StateProvinceID],
	count (*) as [liczbapro]
	from [Person].[Address]
	group by StateProvinceID
	having count(*)>100



	--	10
	--	Lista regionów z [Sales].[SalesTerritory], dla których nazwa ([Name]) zawiera "west" lub zaczyna się od "North" (zawiera a nie jest równa)
	select* from [Sales].[SalesTerritory]

	select TerritoryID, Name, CountryRegionCode, [Group]
	from [Sales].[SalesTerritory]
	where name like '%west%' or name like  'north%'



	--	11
	--	Lista klientów z [Sales].[Customer], dla których ID sklepu ([StoreID]) zawiera się w zbiorze ( 872, 1356, 878, 580 )
	select * from [Sales].[Customer]

	select CustomerID, PersonID, StoreID, TerritoryID, AccountNumber 
	from [Sales].[Customer]
	where StoreID in (872 , 1356,  878, 580) 

	--	12
	--	ograniczyć kursy z [Sales].[CurrencyRate] do tych z USD na GBP ([FromCurrencyCode]/[ToCurrencyCode])
	--	ograniczyć kursy do dat od 2012-01-01 do 2013-01-01
	--	policzyć średnią, minimum, maksimum (AVG/MIN/MAX) dla kolumn [AverageRate] oraz [EndOfDayRate]

	select * from [Sales].[CurrencyRate]
	
	select  FromCurrencyCode, ToCurrencyCode,
	avg([AverageRate]) as avgrate,
	min([AverageRate]) as minrate,
	max([AverageRate]) as maxrate,
	avg([EndOfDayRate]) as avgend,
	min([EndOfDayRate]) as minend,
	max([EndOfDayRate]) as maxend
	from [Sales].[CurrencyRate]
	where FromCurrencyCode='usd'
	and ToCurrencyCode='gbp'
	and CurrencyRateDate between '2012-01-01' and '2013-01-01'
	group by 
	[FromCurrencyCode],[ToCurrencyCode]