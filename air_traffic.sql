-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE airlines (

  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL

);

CREATE TABLE countries (

  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL

);

CREATE TABLE cities (

  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  country INTEGER REFERENCES countries

);

CREATE TABLE passengers (

  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL

);

CREATE TABLE flights (

  id SERIAL PRIMARY KEY,
  departure TIMESTAMP,
  arrival TIMESTAMP,
  airline INTEGER REFERENCES airlines NOT NULL,
  from_city INTEGER REFERENCES cities NOT NULL,
  from_country INTEGER REFERENCES countries NOT NULL,
  to_city INTEGER REFERENCES cities NOT NULL,
  to_country INTEGER REFERENCES countries NOT NULL

);

CREATE TABLE tickets (

  id SERIAL PRIMARY KEY,
  passenger INTEGER REFERENCES passengers NOT NULL,
  seat TEXT NOT NULL,
  flight INTEGER REFERENCES flights NOT NULL

);


INSERT INTO airlines
  (name)
VALUES
  ('Air China'),
  ('American Airlines'),
  ('Avianca Brasil'),
  ('British Airways'),
  ('Delta'),
  ('TUI Fly Belgium'),
  ('United');

INSERT INTO countries
  (name)
VALUES
  ('Brasil'),
  ('Chile'),
  ('China'),
  ('France'),
  ('Japan'),
  ('Mexico'),
  ('Morocco'),
  ('UAE'),
  ('United Kingdom'),
  ('United States');

INSERT INTO cities
  (name, country)
VALUES
  ('Beijing', 3),
  ('Casablanca', 7),
  ('Cedar Rapids', 10),
  ('Charlotte', 10),
  ('Chicago', 10),
  ('Dubai', 8),
  ('Las Vegas', 10),
  ('London', 9),
  ('Los Angeles', 10),
  ('Mexico City', 6),
  ('New Orleans', 10),
  ('New York City', 10),
  ('Paris', 4),
  ('Santiago', 2),
  ('Sao Paolo', 1),
  ('Seattle', 10),
  ('Tokyo', 5),
  ('Washington DC', 10);

INSERT INTO passengers
  (first_name, last_name)
VALUES
  ('Alvin', 'Leathes'),
  ('Berkie', 'Wycliff'),
  ('Cory', 'Squibbes'),
  ('Jennifer', 'Finch'),
  ('Sonja', 'Pauley'),
  ('Thadeus', 'Gathercoal'),
  ('Waneta', 'Skeleton');

INSERT INTO flights
  (departure, from_city, from_country, arrival, to_city, to_country, airline)
VALUES
  ('2018-04-08 09:00:00', 18, 10, '2018-04-08 12:00:00', 16, 10, 7),
  ('2018-12-19 12:45:00', 17, 5, '2018-12-19 16:15:00', 8, 9, 4),
  ('2018-01-02 07:00:00', 9, 10, '2018-01-02 08:03:00', 7, 10, 5),
  ('2018-04-15 16:50:00', 16, 10, '2018-04-15 21:00:00', 10, 6, 5),
  ('2018-08-01 18:30:00', 13, 4, '2018-08-01 21:50:00', 2, 7, 6),
  ('2018-10-31 01:15:00', 6, 8, '2018-10-31 12:55:00', 1, 3, 1),
  ('2019-02-06 06:00:00', 12, 10, '2019-02-06 07:47:00', 4, 10, 7),
  ('2018-12-22 14:42:00', 3, 10, '2018-12-22 15:56:00', 5, 10, 2),
  ('2019-02-06 16:28:00', 4, 10, '2019-02-06 19:18:00', 11, 10, 2),
  ('2019-01-20 19:30:00', 15, 1, '2019-01-20 22:45:00', 14, 2, 3);

INSERT INTO tickets
  (passenger, seat, flight)
VALUES
  (4, '33B', 1),
  (6, '8A', 2),
  (5, '12F', 3),
  (4, '20A', 4),
  (7, '23D', 5),
  (6, '18C', 6),
  (2, '9E', 7),
  (1, '1A', 8),
  (2, '32B', 9),
  (3, '10D', 10);