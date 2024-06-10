-- Вставка данных в таблицу музыкальных жанров
INSERT INTO type_ (id_type, name ) VALUES
(1, 'Rock'),
(2, 'Pop'),
(3, 'Jazz');


-- Вставка данных в таблицу исполнителей
INSERT INTO singer_ (id_singer, name) VALUES
(1, 'Queen'),
(2, 'Adele'),
(3, 'Miles Davis'),
(4, 'Tomas Shelby'); 


-- Вставка данных в таблицу связи исполнителей и жанров
INSERT INTO type_singer (type_id, singer_id) VALUES
(1, 1), -- Queen исполняет Rock
(2, 2), -- Adele исполняет Pop
(3, 3), -- Miles Davis исполняет Jazz
(1, 3), -- Miles Davis также исполняет Rock
(4, 2); -- Tomas Shelby исполняет Pop


-- Вставка данных в таблицу альбомов
INSERT INTO album_ (id_album, album_name, album_year) VALUES
(1, 'A Night at the Opera', 1975),
(2, '21', 2020),
(3, 'Kind of Blue', 1959);


-- Вставка данных в таблицу связи исполнителей и альбомов
INSERT INTO singer_album (singer_id, album_id) VALUES
(1, 1), -- Queen выпустили альбом "A Night at the Opera"
(2, 2), -- Adele выпустила альбом "21"
(3, 3), -- Miles Davis выпустил альбом "Kind of Blue"
(4, 2); -- Tomas Shelby выпустил альбом '21'


-- Вставка данных в таблицу треков
INSERT INTO song_ (id_song, song_name, song_time, album_id) VALUES
(1, 'Bohemian Rhapsody', 5.55, 1),
(2, 'Someone Like You', 4.45, 2),
(3, 'So What', 9.22, 3),
(4, 'Netology', 3.16, 1),
(5, 'Lol', 2.55, 2),
(6, 'Why', 7.52, 3);


-- Вставка данных в таблицу сборников
INSERT INTO sbornik_ (id_sbornik, name_sbornik, year_sbornik) VALUES
(1, 'Greatest Hits', 2020),
(2, 'Jazz Classics', 2021),
(3, 'Love', 2022),
(4, 'High', 2023);


-- Вставка данных в таблицу связи треков и сборников
INSERT INTO sbornik_song (sbornik_id, song_id) VALUES
(1, 1), -- "Bohemian Rhapsody" включен в сборник "Greatest Hits"
(1, 2), -- "Someone Like You" включен в сборник "Greatest Hits"
(2, 3), -- "So What" включен в сборник "Jazz Classics"
(2, 1), -- "Bohemian Rhapsody" также включен в сборник "Jazz Classics"
(4, 6), -- 'Why' включен в сборник "High"
(3, 4); -- 'Netology' включен в сборник "Love"

