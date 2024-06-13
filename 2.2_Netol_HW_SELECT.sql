-- Количество исполнителей в каждом жанре.
SELECT t.name, COUNT(ts.singer_id)
FROM type_ t
JOIN type_singer ts ON t.id_type = ts.type_id
GROUP BY t.name;

-- Количество треков, вошедших в альбомы 2019–2020 годов.
select count(s.id_song)
from song_ s 
join album_ a on a.id_album = s.album_id 
where a.album_year between 2019 and 2020;

-- Средняя продолжительность треков по каждому альбому.
select avg(s.song_time)
from song_ s
join album_ a on a.id_album = s.album_id 
group by a.album_name ;

-- Все исполнители, которые не выпустили альбомы в 2020 году.
select s.name
from singer_album sa
join album_ a on sa.album_id  = a.id_album  
join singer_ s on sa.singer_id = s.id_singer 
where album_year != 2020;

-- Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами). */
SELECT s.name_sbornik 
FROM sbornik_ s 
JOIN sbornik_song ss ON s.id_sbornik = ss.sbornik_id
JOIN song_ song ON ss.song_id = song.id_song
JOIN singer_song ss2 ON song.id_song = ss2.song_id 
JOIN singer_ s2 ON s2.id_singer = ss2.singer_id 
WHERE s2.name = 'Queen';

-- Название и продолжительность самого длительного трека.
select max(song_time)
from song_ ;
 
-- Название треков, продолжительность которых не менее 3,5 минут.
select song_name
from song_ 
where song_time >= 210 ;

-- Названия сборников, вышедших в период с 2018 по 2020 год включительно.
select name_sbornik
from sbornik_ s 
where year_sbornik between 2018 and 2020;

-- Исполнители, чьё имя состоит из одного слова.
select s.name
from singer_ s 
where s.name not like '% %';

-- Название треков, которые содержат слово «мой» или «my».
select song_name
from song_ 
where song_name like '% my %' or song_name like '% мой %';


