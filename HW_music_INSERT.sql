INSERT INTO music_style (style_name) VALUES ('jazz'),('grunge'),('folk'), ('country music'), ('metal'), ('rock');

INSERT INTO album (album_name, release_year) VALUES
	('Fallen', 2003), 
	('Newermind', 1991),
	('The road of sleep', 2003),
	('The Shape of Jazz to Come', 1959),
	('One Thing at a Time', 2020);

INSERT INTO artist (artist_name , scenic_name) VALUES
	('Kurt Donald Cobain', 'Kurt Cobain'),
	('Natalia O''Shea', 'Helavisa'),
	('Morgan Cole Wallen', 'Morgan Wallen'),
	('Ornette_Coleman', 'Ornette Coleman'),
	('Amy Lynn Lee', 'AmyLee');

INSERT INTO track (track_name , duration, album_id) VALUES
	('Lonely Woman', 300 , 4),
	('My Last Breath', 202 , 1),
	('Smells Like Teen Spirit', 250 , 2),
	('Come As You Are', 300, 2),
	('Me to Me', 500 , 5),
	('Had It', 250, 5),
	('The Winter', 202 ,3),
	('To The North', 350 , 3),
	('The road of sleep', 322, 3),
	('My Immortal', 302, 1);

INSERT INTO collection (collection_name , release_year) VALUES
	('The best of the best', 2018),
	('Gold Album', 2020),
	('Silver Album', 2020),
	('Brilliant Album', 2025);

INSERT INTO artist_style (artist_id, style_id) VALUES
	(1,2), (1,6),
	(2,3), (2,5),
	(3, 4),
	(4, 1),
	(5,5), (5, 6);
	
INSERT INTO artist_album (artist_id, album_id) VALUES
	(1, 2),
	(2, 3),
	(3, 5),
	(4, 4),
	(5, 1);
	
INSERT INTO collection_track (track_id, collection_id) VALUES
	(3,1), (10,1),
	(1,2), (2,2), (3,2), (4,2), (5,2),
	(4,3), (6,3), (7,3), (9,3), (10,3),
	(1,4), (2,4), (4,4);