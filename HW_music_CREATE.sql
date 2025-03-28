CREATE TABLE IF NOT EXISTS music_style (
	style_id SERIAL PRIMARY KEY,
	style_name VARCHAR(40) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS album (
	album_id SERIAL PRIMARY KEY,
	album_name VARCHAR(40) NOT NULL UNIQUE,
	release_year INT2 NOT NULL CHECK(release_year BETWEEN 1950 AND EXTRACT (YEAR from now()))
);

CREATE TABLE IF NOT EXISTS artist (
	artist_id SERIAL PRIMARY KEY,
	artist_name VARCHAR(40) NOT NULL,
	scenic_name VARCHAR(40) NOT NULL UNIQUE
);

 
CREATE TABLE IF NOT EXISTS track (
	track_id SERIAL PRIMARY KEY,
	track_name VARCHAR(40) NOT NULL,
	duration INT NOT NULL CHECK(duration BETWEEN 30 AND 1200),
	album_id INT  REFERENCES  Album (album_id)
);

CREATE TABLE IF NOT EXISTS collection (
	collection_id SERIAL PRIMARY KEY,
	collection_name VARCHAR(40) UNIQUE NOT NULL,
	release_year INT2 NOT NULL CHECK(release_year BETWEEN 1950 AND EXTRACT (YEAR from now()))
);

CREATE TABLE IF NOT EXISTS artist_style (
	artist_id INT NOT NULL REFERENCES artist (artist_id),
	style_id INT NOT NULL REFERENCES music_style (style_id),
	CONSTRAINT pk_as PRIMARY KEY (artist_id, style_id)
);

CREATE TABLE IF NOT EXISTS artist_album (
	artist_id INT NOT NULL REFERENCES artist (artist_id),
	album_id INT NOT NULL REFERENCES album (album_id),
	CONSTRAINT pk_aa PRIMARY KEY (artist_id, album_id)
);

CREATE TABLE IF NOT EXISTS collection_track (
	collection_id INT NOT NULL REFERENCES collection (collection_id),
	track_id INT NOT NULL REFERENCES track (track_id),
	CONSTRAINT pk_ct PRIMARY KEY (collection_id, track_id)
);