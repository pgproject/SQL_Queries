
	--	z pliku .bak wystawionego na kursie moodle 
	--	odtworzyć bazę danych
	-------------------------------------------------------
	
	--	01
	--	sprawdzić czy na serwerze istnieje baza danych 'ExcDB'
		--	a) za pomocą widoku systemowego sys.databases 
		--	b) za pomocą funkcji DB_ID()

		select *
		from sys.databases 
		where name= 'ExcDB'

		SELECT DB_ID('ExcDB')

		IF DB_ID('ExcDB') is not null drop database ExcDB
		go
		--	jeżeli baza istnieje to ją usunąć
	----------------------------------------
	create database ExcDB
	go

	--	02
	--	utworzyć bazę danych 'ExcDB'
	----------------------------------------
		use ExcDB
		go

		select *
		from sys.schemas
		where name in('dbo', 'sys', 'tst')

		select SCHEMA_ID('dbo')
		select SCHEMA_ID('sys')
		select SCHEMA_ID('tst')
		
	--	03
	--	sprawdzić czy w bazie 'ExcDB' istnieją schematy: dbo, sys, tst
		--	a) za pomocą widoku systemowego sys.schemas
		--	b) za pomocą funkcji SCHEMA_ID()
	----------------------------------------
	use ExcDB
	go

	select *
	from sys.tables
	where name in('test1', 'test2')
	go

	select OBJECT_ID('test1')
	select OBJECT_ID('test2')
	--	04
	--	sprawdzić czy w bazie 'ExcDB' istnieją tabele: test1, test2 (w dowolnym schemacie)
		--	a) za pomocą widoku systemowego sys.tables
		--	b) za pomocą funkcji OBJECT_ID()
	----------------------------------------
	create schema tst
	go

	--	05
	--	utworzyć w bazie 'ExcDB' schemat 'tst'
	----------------------------------------
	create table tst.product
	(
	[ProductID]				int,
	[Name]					nvarchar(50),
	[ReorderPoint]			smallint,
	[StandardCost]			money,
	[ListPrice]				money,
	[Size]					nvarchar(5),
	[SizeUnitMeasureCode]	nchar(3),
	[WeightUnitMeasureCode] nchar(3),
	[Weight]				decimal(8,2)
	)
	go
	create table tst.Customer
	(
	[CustomerID]			int,
	[Person]				int,
	[StoreId]				int,
	[TerritoryId]			int,
	[AccountNumber]			varchar(10)
	)
	go

	create table tst.Terittory
	(
	[TerritoryId]			int,
	[Name]					nvarchar(50),
	[CountryRegionCode]		nvarchar(3),
	[Group]					nvarchar(50)
	)
	
	


	--	06
	--	w schemacie 'tst'
	--	utworzyć trzy tabele zgodnie ze specyfikacją z załączonego na moodle pliku XLS
	----------------------------------------
	alter table tst.product		add [CREATE_DATE] datetime not null default getdate()
	alter table tst.Customer	add [CREATE_DATE] datetime not null default getdate()
	alter table tst.Terittory	add [CREATE_DATE] datetime not null default getdate()

	--	07
	--	do każdej z tabel z punktu 06 dodać kolumnę o nazwie [CREATE_DATE] typu DATETIME 
	--	z ograniczeniem NOT NULL oraz wartością domyślną GETDATE()
	----------------------------------------
	alter table tst.product add [unikalne_id] UNIQUEIDENTIFIER UNIQUE default newid()

