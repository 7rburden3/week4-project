DROP TABLE records;
DROP TABLE genres;
DROP TABLE artists;

CREATE TABLE artists (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE genres (
  id SERIAL4 PRIMARY KEY,
  genre VARCHAR(255)
);

CREATE TABLE records (
  id SERIAL4 PRIMARY KEY,
  title VARCHAR(255),
  quantity INT2,
  genre_id INT4 REFERENCES genres(id) ON DELETE CASCADE,
  artist_id INT4 REFERENCES artists(id) ON DELETE CASCADE
);
