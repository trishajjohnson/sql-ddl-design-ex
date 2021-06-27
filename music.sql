-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music


CREATE TABLE artists (

  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  is_producer BOOLEAN NOT NULL
  
);

CREATE TABLE albums (

  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  artist INTEGER REFERENCES artists NOT NULL,
  release_date DATE

);

CREATE TABLE songs (

  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  album INTEGER REFERENCES albums NOT NULL,
  artist INTEGER REFERENCES artists NOT NULL

);

CREATE TABLE roles (

  id SERIAL PRIMARY KEY,
  song INTEGER REFERENCES songs NOT NULL,
  album INTEGER REFERENCES albums NOT NULL,
  artist INTEGER REFERENCES artists NOT NULL,
  role TEXT NOT NULL

);

INSERT INTO artists
  (name, is_producer)
VALUES
  ('Hanson', false),
  ('Queen', false),
  ('Mariah Carey', false),
  ('Boyz II Men', false),
  ('Lady Gaga', false),
  ('Bradley Cooper', false),
  ('Nickelback', false),
  ('Jay Z', false),
  ('Alicia Keys', false),
  ('Katy Perry', false),
  ('Juicy J', false),
  ('Maroon 5', false),
  ('Christina Aguilera', false),
  ('Avril Lavigne', false),
  ('Destiny''s Child', false),
  ('Dust Brothers', true),
  ('Stephen Lironi', true),
  ('Roy Thomas Baker', true),
  ('Walter Afanasieff', true),
  ('Benjamin Rice', true),
  ('Rick Parashar', true),
  ('Al Shux', true),
  ('Max Martin', true),
  ('Cirkut', true),
  ('Shellback', true),
  ('Benny Blanco', true),
  ('The Matrix', true),
  ('Darkchild', true);
  
INSERT INTO albums
  (name, release_date)
VALUES
  ('Middle of Nowhere', 1997-04-15),
  ('A Night at the Opera', 1975-10-31),
  ('Daydream', 1995-11-14),
  ('A Star Is Born', 2018-09-27),
  ('Silver Side Up', 1997-04-15),
  ('The Blueprint 3', 2009-10-20),
  ('Prism', 2013-12-17),
  ('Hands All Over', 2011-06-21),
  ('Let Go', 2002-05-14),
  ('The Writing''s on the Wall', 1999-11-07),

INSERT INTO songs
  (title, duration_in_seconds, artists, album, producers)
VALUES
  ('MMMBop', 238, 1, 1),
  ('Bohemian Rhapsody', 355, 2, 2),
  ('One Sweet Day', 282, 3, 3),
  ('Shallow', 216, 5, 4),
  ('How You Remind Me', 223, 7, 5),
  ('New York State of Mind', 276, 8, 6),
  ('Dark Horse', 215, 10, 7),
  ('Moves Like Jagger', 201, 12, 8),
  ('Complicated', 244, 14, 9),
  ('Say My Name', 240, 15, 10);

INSERT INTO roles
  (song, album, artist, role)
VALUES
  (1, 1, 1, 'Lead Artist'),
  (1, 1, 16, 'Producer'),
  (1, 1, 17, 'Producer'),
  (2, 2, 2, 'Lead Artist'),
  (2, 2, 18, 'Producer'),
  (3, 3, 3, 'Lead Artist'),
  (3, 3, 4, 'Featured Artist'),
  (3, 3, 19, 'Producer'),
  (4, 4, 5, 'Lead Artist'),
  (4, 4, 6, 'Lead Artist'),
  (4, 4, 20, 'Producer'),
  (5, 5, 7, 'Lead Artist'),
  (5, 5, 21, 'Producer'),
  (6, 6, 8, 'Lead Artist'),
  (6, 6, 9, 'Featured Artist'),
  (6, 6, 22, 'Producer'),
  (7, 7, 10, 'Lead Artist'),
  (7, 7, 11, 'Featured Artist'),
  (7, 7, 23, 'Producer'),
  (7, 7, 24, 'Producer'),
  (8, 8, 12, 'Lead Artist'),
  (8, 8, 13, 'Featured Artist'),
  (8, 8, 25, 'Producer'),
  (8, 8, 26, 'Producer'),
  (9, 9, 14, 'Lead Artist'),
  (9, 9, 27, 'Producer'),
  (10, 10, 15, 'Lead Artist'),
  (10, 10, 28, 'Producer');