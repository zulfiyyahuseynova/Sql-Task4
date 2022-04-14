CREATE DATABASE Cinema

CREATE TABLE Genres
(
	Id int identity(1,1) PRIMARY KEY,
	Name nvarchar(255)
)

CREATE TABLE Actors
(
	Id int identity(1,1) PRIMARY KEY,
	Name nvarchar(50),
	Surname nvarchar(50),
	Age int
)

CREATE TABLE Films
(
	Id int identity(1,1) PRIMARY KEY,
	Name nvarchar(255),
	ReleaseDate date
)

CREATE TABLE FilmGenres
(
	Id int identity(1,1) PRIMARY KEY,
	FilmId int references Films(Id),
	GenreId int references Genres(Id)
)

CREATE TABLE FilmActors
(
	Id int identity(1,1) PRIMARY KEY,
	FilmId int references Films(Id),
	ActorId int references Actors(Id)
)

CREATE TABLE Halls
(
	Id int identity(1,1) PRIMARY KEY,
	SeatCount int
)

CREATE TABLE Customers
(
	Id int identity(1,1) PRIMARY KEY,
	Name nvarchar(50),
	Surname nvarchar(50)
)

CREATE TABLE Sessionss
(
	Id int identity(1,1) PRIMARY KEY,
	[Time] time
)

CREATE TABLE Tickets
(
	Id int identity(1,1) PRIMARY KEY,
	SalesDate datetime,
	Price decimal,
	Place int,
	CustomerId int references Customers(Id),
	HallId int references Halls(Id),
	FilmId int references Films(Id),
	SessionId int references Sessionss(Id)
)
CREATE TABLE InsertTickets
(
	Id int identity(1,1) PRIMARY KEY,
	CustomerId int references Customers(Id),
	HallId int references Halls(Id),
	FilmId int references Films(Id),
	SessionId int references Sessionss(Id),
)

select * from Actors
select * from Customers
select * from FilmActors
select * from FilmGenres
select * from Films
select * from Genres
select * from Halls
select * from Sessionss
select * from Tickets
