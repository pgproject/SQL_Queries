
	--	z pliku .bak wystawionego na kursie moodle 
	--	odtworzyć bazę danych [SampleDB]
	-------------------------------------------------------
	
		USE [SampleDB]
		GO
		select *
		from [Production].[Product]

		drop schema abc
		drop table abc.ProductType
		drop table abc.Product

		create schema abc
		go

		create table abc.Product
			(ProductID			int primary key  not null,
			 ProductName		nvarchar(15) unique not null,
			 ProductTypeId		int not null,
			
			)
		
		create table abc.ProductType
			 (
			 ProductTypeId		int primary key not null, 
			 ProductTypeName	nvarchar(20) unique not null
			)

	--	01 
	--	w dowolnym schemacie 
	--	utworzyć tabele zgodnie ze specyfikacją z pliku xls. (Product, ProductType)
	----------------------------------------
			alter table		abc.Product
			add constraint	ProductTypeId2
			foreign key		(ProductTypeId)
			references		abc.ProductType(ProductTypeID)

	--	02
	--	w tabeli Product utworzyć klucz obcy na kolumnie ProductTypeID
	--	wskazujący na kolumnę ProductTypeID w tabeli ProductType
	----------------------------------------
	insert into abc.ProductType
	values	(1, 'Typ A'),
			(2, 'Typ B'),
			(3, 'Typ C'),
			(4, 'Typ D'),
			(5, 'Typ E')

	insert into abc.Product
	values  (1, 'Produkt A1', 1),
			(2, 'Produkt B1', 2),
			(3, 'Produkt C1', 3),
			(4, 'Produkt D1', 4),
			(5, 'Produkt E1', 5),
			(6, 'Produkt A2', 1),
			(7, 'Produkt B2', 2),
			(8, 'Produkt C2', 3),
			(9, 'Produkt D2', 4),
			(10, 'Produkt E2', 5),
			(11, 'Produkt A3', 1),
			(12, 'Produkt B3', 2),
			(13, 'Produkt C3', 3),
			(14, 'Produkt D3', 4),
			(15, 'Produkt E3', 5),
			(16, 'Produkt A4', 1),
			(17, 'Produkt B4', 2),
			(18, 'Produkt C4', 3),
			(19, 'Produkt D4', 4),
			(20, 'Produkt E4', 5)

		SELECT *
		FROM abc.Product

		select *
		from abc.ProductType

			
	--	03	--	w odpowiedniej kolejności załadować do tabel dane z zakładki "dane" w pliku xls.
	----------------------------------------
	delete from abc.ProductType
	
	--	04
	--	spróbować skasować wszystkie dane z tabeli ProductType - za pomocą DELETE oraz TRUNCATE 
	----------------------------------------
	alter table [abc].[Product]
	drop constraint [ProductTypeId2]
	
	alter table		abc.Product
	add constraint	ProductTypeId2
	foreign key		(ProductTypeId)
	references		abc.ProductType(ProductTypeID)
	on delete cascade
	on update cascade
	--	05 (*)
	--	usunąć FK oraz utworzyć jeszcze raz z opcją ON DELETE CASCADE oraz ON UPDATE CASCADE
	--	http://stackoverflow.com/questions/13244889/how-to-alter-constraint
	----------------------------------------
	update abc.ProductType
	set ProductTypeId=ProductTypeId*10
	delete abc.ProductType
	select *
	from abc.Product
	--	06 (*)
	--	a) podmienić w tabeli ProductType wartości z ProductTypeID mnożąc je razy 10 (1 -> 10, 2->20 itp...) i sprawdzić co się stanie w tabeli Product
	--	b) skasować wszystko z ProductType i sprawdzić co zostało w Product
	----------------------------------------