-- Создание таблицы музыкальных жанров
CREATE table IF NOT EXISTS type_ (
    id_type INTEGER PRIMARY key,
    name VARCHAR(40) NOT null
);


-- Создание таблицы исполнителей
CREATE TABLE IF NOT EXISTS singer_ (
    id_singer INTEGER PRIMARY KEY,
    name VARCHAR(40) NOT null
);


-- Создание таблицы связи исполнителей и жанров
CREATE TABLE IF NOT EXISTS type_singer (
    type_id INTEGER REFERENCES type_(id_type),
    singer_id INTEGER REFERENCES singer_(id_singer),
    PRIMARY KEY(type_id, singer_id)
);


-- Создание таблицы альбомов
CREATE TABLE IF NOT EXISTS album_ (
    id_album INTEGER PRIMARY KEY,
    album_name VARCHAR(40) NOT NULL,
    album_year INTEGER NOT null
);


-- Создание таблицы связи исполнителей и альбомов
CREATE TABLE IF NOT EXISTS singer_album (
    singer_id INTEGER REFERENCES singer_(id_singer),
    album_id INTEGER REFERENCES album_(id_album),
    PRIMARY KEY(album_id, singer_id)
);


-- Создание таблицы треков
CREATE TABLE IF NOT EXISTS song_ (
    id_song INTEGER PRIMARY KEY,
    song_name VARCHAR(60) NOT NULL,
    song_time INTEGER NOT NULL,
    album_id INTEGER REFERENCES album_(id_album)
);


-- Создание таблицы сборников
CREATE TABLE IF NOT EXISTS sbornik_ (
    id_sbornik INTEGER PRIMARY KEY,
    name_sbornik VARCHAR(40) NOT NULL,
    year_sbornik INTEGER NOT null
);


-- Создание таблицы связи треков и сборников
CREATE TABLE IF NOT EXISTS sbornik_song (
    sbornik_id INTEGER REFERENCES sbornik_(id_sbornik),
    song_id INTEGER REFERENCES song_(id_song),
    PRIMARY KEY(sbornik_id, song_id)
);

create table if not exists singer_song (
	singer_id INTEGER references singer_(id_singer),
	song_id integer references song_(id_song),
	primary key(singer_id, song_id)
);


