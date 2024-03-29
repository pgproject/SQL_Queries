
	--	z pliku .bak wystawionego na kursie moodle 
	--	odtworzyć bazę danych [SampleDB]
	-------------------------------------------------------
	
	USE [SampleDB]
	GO
	
	delete 
	from [Person].[Address]
	where City= 'Toronto'

	--	01
	--	z tabeli [Person].[Address] usunąć wszystkie wpisy z miasta Toronto
	----------------------------------------
	update	[Person].[Address]
	set		City='Sydney'
	where	City='Melbourne'

	--	02
	--	tabeli [Person].[Address] podmienić miasto z 'Melbourne' na 'Sydney'
	--	we wszystkich adresach z miasta 'Melbourne'
	----------------------------------------
		SELECT *
		INTO Sales.Customer2
		FROM Sales.Customer

		select *
		from Sales.Customer2

	--	03
	--	skopiować wszystkie dane z tabeli Sales.Customer do Sales.Customer2
	--	za pomocą konstrukcji SELECT ... INTO ... FROM
	----------------------------------------
	insert into Sales.Customer2
	select *
	from Sales.Customer
	

	--	04
	--	jeszcze raz załadować wszystkie wiersze z tabeli Sales.Customer do Sales.Customer2
	--	tabela Sales.Customer2 jest juz utworzona - użyć konstrukcji INSERT INTO ... SELECT ... FROM
	----------------------------------------
	truncate table [Sales].[Customer2]

	--	05
	--	skasować wszystkie wiersze z Sales.Customer2 za pomocą polecenia TRUNCATE TABLE
	----------------------------------------
	update [Sales].[SalesPerson]
	set Bonus=Bonus + 1000
	where [SalesQuota]!= null

	--	06
	--	w tabeli [Sales].[SalesPerson] dodać 1000 do kolumny Bonus 
	--	we wszystkich wierszach, w których [SalesQuota] jest różna od wartości NULL
	----------------------------------------
	alter table Sales.SalesPerson
	add CommissionTarget numeric(10,2) null
	go
	update [Sales].[SalesPerson]
	set CommissionTarget=[SalesQuota]*[CommissionPct]

	--	07 (*)
	--	do tabeli [Sales].[SalesPerson] dodać kolumnę CommissionTarget NUMERIC(10,2) NULL, uzupełnić ją dla wszystkich wierszy
	--	wartością powstałą przez przemnożenie kolumn [SalesQuota] * [CommissionPct]
	----------------------------------------
	
	create table mytable
	(
		col_Id		int identity primary key not null,
		col_GUID	UNIQUEIDENTIFIER unique not null default newid(),
		col_User	varchar(100) default suser_sname(),
		col_Load	datetime default getdate(),
		col_Text	varchar(100)
	)
	
	insert into mytable(col_Text) values('asddaas')
	insert into mytable(col_Text) values('sadasa')
	insert into mytable(col_Text) values('sdasdas')
	insert into mytable(col_Text) values('sddsas')
	insert into mytable(col_Text) values('adsasd')
	insert into mytable(col_Text) values('dsada')
	insert into mytable(col_Text) values('sadasas')
	
	select *
	from mytable 
	

	--	08 (*)
	--	utworzyć tabelę o dowolnej nazwie z poniższymi kolumnami:
	--
	--	1)	nazwa:	col_ID		,	datatype:	INT					,	parametry:	IDENTITY, PRIMARY KEY, NOT NULL
	--	2)	nazwa:	col_GUID	,	datatype:	UNIQUEIDENTIFIER	,	parametry:	UNIQUE, NOT NULL, DEFAULT NEWID()
	--	2)	nazwa:	col_User	,	datatype:	VARCHAR(100)		,	parametry:	DEFAULT SUSER_SNAME()
	--	3)	nazwa:	col_Load	,	datatype:	DATETIME			,	parametry:	DEFAULT GETDATE()
	--	4)	nazwa:	col_Text	,	datatype:	VARCHAR(100)		,	parametry:	-- brak --
	--
	--
	--	następnie do podanej tabeli wstawić kilka wierszy definiując jedynie wartość w kolumnie Text
	--	przykładowo "INSERT INTO dbo.MojaTabelka(col_Text) VALUES('przykładowy tekst')
	--	po wstawieniu wierwszy odpytać tabelę SELECT * FROM  dbo.MojaTabelka i zobaczyć co pojawiło się w pozostałych kolumnach
	----------------------------------------
