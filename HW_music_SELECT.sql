--2.1 Название и продолжительность самого длительного трека.
SELECT track_name, duration 
FROM track
ORDER BY duration DESC 
LIMIT 1;

--2.2 Название треков, продолжительность которых не менее 3,5 минут.
SELECT track_name
FROM track
WHERE duration >= 210;

--2.3 Названия сборников, вышедших в период с 2018 по 2020 год включительно.
SELECT collection_name 
FROM collection
WHERE release_year BETWEEN 2018 AND 2020;

--2.4 Исполнители, чьё имя состоит из одного слова.
SELECT artist_name, scenic_name 
FROM artist
WHERE artist_name NOT LIKE '% %';

--2.5 Название треков, которые содержат слово «мой» или «my».
--Вариант 1
SELECT track_name 
FROM track 
WHERE track_name ILIKE '% my %' OR track_name ILIKE '% мой %'
OR track_name ILIKE 'my %' OR track_name ILIKE 'мой %'
OR track_name ILIKE '% my' OR track_name ILIKE '% мой'
OR track_name ILIKE 'my' OR track_name ILIKE 'мой';

--Вариант 2
SELECT track_name 
FROM track 
WHERE string_to_array(lower(track_name), ' ') && ARRAY['my','мой'];

--Вариант 3
SELECT track_name 
FROM track 
WHERE track_name ~* '\mmy\M';


--3.1 Количество исполнителей в каждом жанре
SELECT style_name, COUNT(ars.artist_id)
FROM music_style ms
JOIN artist_style ars ON ars.style_id = ms.style_id
GROUP BY style_name;

--3.2 Количество треков, вошедших в альбомы 2019–2020 годов.
SELECT count(t.track_id)
FROM track t 
JOIN album a ON a.album_id = t.album_id
WHERE a.release_year BETWEEN 2019 AND 2020;

--3.3 Средняя продолжительность треков по каждому альбому.
SELECT a.album_name, AVG(t.duration)
FROM track t 
JOIN album a ON a.album_id = t.album_id
GROUP BY a.album_name;

--3.4 Все исполнители, которые не выпустили альбомы в 2020 году.

SELECT artist_name, scenic_name
FROM artist
WHERE artist_id NOT IN (
	SELECT ar.artist_id FROM artist ar
	JOIN artist_album aa ON aa.artist_id = ar.artist_id
	JOIN album al ON al.album_id  = aa.album_id
	WHERE al.release_year = 2020
	);

--3.5 Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами)
SELECT distinct c.collection_name
FROM collection c 
JOIN collection_track ct ON ct.collection_id = c.collection_id 
JOIN track t ON t.track_id  = ct.track_id 
JOIN album a ON a.album_id = t.album_id 
JOIN artist_album aa ON aa.album_id = a.album_id 
JOIN artist a2 ON a2 .artist_id = aa.artist_id
WHERE a2.artist_name = 'Amy Lynn Lee';

--4.1 Названия альбомов, в которых присутствуют исполнители более чем одного жанра.
SELECT DISTINCT a.album_name 
FROM album a 
JOIN artist_album aa ON aa.album_id = a.album_id
JOIN artist a2 ON a2.artist_id = aa.artist_id
JOIN artist_style ars ON ars.artist_id = a2.artist_id
GROUP BY a.album_name, ars.artist_id 
HAVING count(ars.style_id) > 1;

--4.2 Наименования треков, которые не входят в сборники.
SELECT track_name 
FROM track  
WHERE track_id NOT IN (SELECT track_id FROM collection_track);

--4.3 Исполнитель или исполнители, написавшие самый короткий по продолжительности трек, — теоретически таких треков может быть несколько.
SELECT a.artist_name
FROM artist a
JOIN artist_album aa ON aa.artist_id = a.artist_id 
JOIN track t ON t.album_id = aa.album_id
WHERE t.duration = (SELECT min(duration) FROM track);

--4.4 Названия альбомов, содержащих наименьшее количество треков.
SELECT album_name 
FROM album a 
JOIN track t ON t.album_id = a.album_id 
GROUP BY album_name
HAVING count (*) = (SELECT count(*) AS qty FROM track GROUP BY album_id ORDER BY qty LIMIT 1);

 

