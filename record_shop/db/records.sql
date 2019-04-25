DROP TABLE records;
DROP TABLE artists;

CREATE TABLE artists (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE records (
  id SERIAL4 PRIMARY KEY,
  title VARCHAR(255)
  quantity INT2,
  artist_id INT4 REFERENCES artists(id) ON DELETE CASCADE
)
