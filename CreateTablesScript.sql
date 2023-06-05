-- Жанры
create table if not exists genre (
	id serial primary key,
	name varchar(60) unique not null
);

-- Исполнители
create table if not exists artist (
	id serial primary key,
	name varchar(60) not null
);

-- Кросс-таблица жанры-исполнители
create table if not exists genre_artist (
	genre_id integer not null references genre(id),
	artist_id integer not null references artist(id),
	constraint genre_artist_pk primary key (genre_id, artist_id)
);

-- Альбомы
create table if not exists album (
	id serial primary key,
	name varchar(60) not null,
	release_year integer not null,
		check (release_year between 1900 and 2023)
);

-- Кросс-таблица исполнители-альбомы
create table if not exists artist_album (
	album_id integer not null references album(id),
	artist_id integer not null references artist(id),
	constraint artist_album_pk primary key (album_id, artist_id)
);

-- Треки
create table if not exists track (
	id serial primary key,
	name varchar(60) not null,
	duration integer,
	album_id integer not null references album(id)
);

-- Сборники
create table if not exists collection (
	id serial primary key,
	name varchar(60) not null,
	release_year integer
);

-- Кросс-таблица треки-сборники
create table if not exists track_collection (
	track_id integer not null references track(id),
	collection_id integer not null references collection(id),
	constraint track_collection_pk primary key (track_id, collection_id)
);