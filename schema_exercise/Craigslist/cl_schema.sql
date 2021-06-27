DROP DATABASE IF EXISTS craigslist_db; 

CREATE DATABASE craigslist_db;

\c craigslist_db

CREATE TABLE regions (

    id SERIAL PRIMARY KEY, 
    region_name TEXT NOT NULL

);

CREATE TABLE neighborhoods (
    
    id SERIAL PRIMARY KEY, 
    name TEXT NOT NULL, 
    region INTEGER REFERENCES regions (id) NOT NULL

);

CREATE TABLE categories (

    id SERIAL PRIMARY KEY, 
    name TEXT NOT NULL

);

CREATE TABLE users (

    id SERIAL PRIMARY KEY, 
    username TEXT NOT NULL, 
    region INTEGER REFERENCES regions (id)

);

CREATE TABLE posts (

    id SERIAL PRIMARY KEY, 
    title TEXT NOT NULL, 
    text TEXT NOT NULL, 
    username INTEGER REFERENCES users (id) NOT NULL, 
    category INTEGER REFERENCES categories (id) NOT NULL, 
    region INTEGER REFERENCES regions (id) NOT NULL, 
    location INTEGER REFERENCES neighborhoods (id)

);


INSERT INTO regions 
(name) 
VALUES 
  ('Dallas/Fort Worth'),
  ('SF bay area'),
  ('Seattle-Tacoma'),
  ('Portland, OR');

INSERT INTO neighborhoods
(name, region) 
VALUES 
  ('Dallas', 1),
  ('Fort Worth', 1),
  ('Mid Cities', 1),
  ('City of SF', 2),
  ('East Bay', 2),
  ('Santa Cruz County', 2),
  ('Seattle', 3),
  ('Eastside', 3),
  ('Tacoma', 3),
  ('Multnomah County', 4),
  ('Washington County', 4),
  ('Columbia Gorge', 4);

INSERT INTO categories 
(name) 
VALUES 
  ('Housing'),
  ('For Sale'),
  ('Jobs');

INSERT INTO users 
(username, region) 
VALUES 
  ('BobDaCat54', 1),
  ('DeathB4Decaf111', 2),
  ('Blaze4Dayz420', 3),
  ('Sk8rL8r96', 4);

INSERT INTO posts 
(title, text, username, region, location, category) 
VALUES 
  ('Bookshelf 4 sale', 'I have a bookshelf for sale.  5 shelves, 6ft tall.  Asking $50 obo.', 1, 1, 3, 2),
  ('Apt for sublet', 'Im subletting my apartment. Lease ends in Novemeber. Rent is $600/mo.', 2, 2, 5, 1),
  ('Front desk clerk', 'I am hiring a front desk clerk to greet customers at my dispensary Blaze 4 Dayz. Pays $15/hr.  If interested, please drop off resume.', 3, 3, 7, 3),
  ('2001 Chevy S-10', 'I have a 2001 Chevy truck for sale.  150k miles. Brand new tires.  Asking $3k obo.', 4, 4, 12, 2);







