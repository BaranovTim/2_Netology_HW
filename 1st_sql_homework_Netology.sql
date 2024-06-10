-- Создание таблицы музыкальных жанров
CREATE table IF NOT EXISTS type_ (
    id_type INTEGER PRIMARY key,
    type_name VARCHAR(40) NOT null
);

-- Вставка данных в таблицу музыкальных жанров
INSERT INTO type_ (id_type, type_name) VALUES
(1, 'Rock'),
(2, 'Pop'),
(3, 'Jazz');

-- Создание таблицы исполнителей
CREATE TABLE IF NOT EXISTS singer_ (
    id_singer INTEGER PRIMARY KEY,
    singer_name VARCHAR(40) NOT null
);

-- Вставка данных в таблицу исполнителей
INSERT INTO singer_ (id_singer, singer_name) VALUES
(1, 'Queen'),
(2, 'Adele'),
(3, 'Miles Davis');

-- Создание таблицы связи исполнителей и жанров
CREATE TABLE IF NOT EXISTS type_singer (
    type_id INTEGER REFERENCES type_(id_type),
    singer_id INTEGER REFERENCES singer_(id_singer),
    PRIMARY KEY(type_id, singer_id)
);

-- Вставка данных в таблицу связи исполнителей и жанров
INSERT INTO type_singer (type_id, singer_id) VALUES
(1, 1), -- Queen исполняет Rock
(2, 2), -- Adele исполняет Pop
(3, 3), -- Miles Davis исполняет Jazz
(1, 3); -- Miles Davis также исполняет Rock

-- Создание таблицы альбомов
CREATE TABLE IF NOT EXISTS album_ (
    id_album INTEGER PRIMARY KEY,
    album_name VARCHAR(40) NOT NULL,
    album_year INTEGER NOT null
);

-- Вставка данных в таблицу альбомов
INSERT INTO album_ (id_album, album_name, album_year) VALUES
(1, 'A Night at the Opera', 1975),
(2, '21', 2011),
(3, 'Kind of Blue', 1959);

-- Создание таблицы связи исполнителей и альбомов
CREATE TABLE IF NOT EXISTS singer_album (
    singer_id INTEGER REFERENCES singer_(id_singer),
    album_id INTEGER REFERENCES album_(id_album),
    PRIMARY KEY(album_id, singer_id)
);

-- Вставка данных в таблицу связи исполнителей и альбомов
INSERT INTO singer_album (singer_id, album_id) VALUES
(1, 1), -- Queen выпустили альбом "A Night at the Opera"
(2, 2), -- Adele выпустила альбом "21"
(3, 3); -- Miles Davis выпустил альбом "Kind of Blue"

-- Создание таблицы треков
CREATE TABLE IF NOT EXISTS song_ (
    id_song INTEGER PRIMARY KEY,
    song_name VARCHAR(60) NOT NULL,
    song_time REAL NOT NULL,
    album_id INTEGER REFERENCES album_(id_album)
);

-- Вставка данных в таблицу треков
INSERT INTO song_ (id_song, song_name, song_time, album_id) VALUES
(1, 'Bohemian Rhapsody', 5.55, 1),
(2, 'Someone Like You', 4.45, 2),
(3, 'So What', 9.22, 3);

-- Создание таблицы сборников
CREATE TABLE IF NOT EXISTS sbornik_ (
    id_sbornik INTEGER PRIMARY KEY,
    name_sbornik VARCHAR(40) NOT NULL,
    year_sbornik INTEGER NOT null
);

-- Вставка данных в таблицу сборников
INSERT INTO sbornik_ (id_sbornik, name_sbornik, year_sbornik) VALUES
(1, 'Greatest Hits', 2020),
(2, 'Jazz Classics', 2021);

-- Создание таблицы связи треков и сборников
CREATE TABLE IF NOT EXISTS sbornik_song (
    sbornik_id INTEGER REFERENCES sbornik_(id_sbornik),
    song_id INTEGER REFERENCES song_(id_song),
    PRIMARY KEY(sbornik_id, song_id)
);

-- Вставка данных в таблицу связи треков и сборников
INSERT INTO sbornik_song (sbornik_id, song_id) VALUES
(1, 1), -- "Bohemian Rhapsody" включен в сборник "Greatest Hits"
(1, 2), -- "Someone Like You" включен в сборник "Greatest Hits"
(2, 3), -- "So What" включен в сборник "Jazz Classics"
(2, 1); -- "Bohemian Rhapsody" также включен в сборник "Jazz Classics"

