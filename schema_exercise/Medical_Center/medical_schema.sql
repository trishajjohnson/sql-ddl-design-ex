DROP DATABASE IF EXISTS medical_ctr_db;

CREATE DATABASE medical_ctr_db;

\c medical_ctr_db


CREATE TABLE depts (

    id SERIAL PRIMARY KEY, name TEXT, NOT NULL
    
);

CREATE TABLE patients (
    
    id SERIAL PRIMARY KEY, 
    first_name TEXT NOT NULL, 
    last_name TEXT NOT NULL
    
);

CREATE TABLE doctors (
    
    id SERIAL PRIMARY KEY, 
    name TEXT NOT NULL, 
    dept INTEGER REFERENCES depts (id) NOT NULL
    
);

CREATE TABLE diagnoses (
    
    id SERIAL PRIMARY KEY, 
    patient INTEGER REFERENCES patients (id) NOT NULL, 
    doctor INTEGER REFERENCES doctors (id) NOT NULL, 
    dept INTEGER REFERENCES depts (id), diagnosis TEXT NOT NULL
    
);


INSERT INTO depts 
(name) 
VALUES 
  ('Oncology'),
  ('Cardiology'),
  ('Obstetrics'),
  ('Urology');

INSERT INTO patients 
(first_name, last_name) 
VALUES 
  ('Bob', 'Turner'),
  ('Leslie', 'Richardson'),
  ('Riley', 'Cooper'),
  ('Virginia', 'Dickenson'),
  ('Edith', 'Monroe'),
  ('Edgar', 'Letcher');

INSERT INTO doctors 
(name, dept) 
VALUES 
  ('Dr. Oerline', 4),
  ('Dr. Gibbs', 2),
  ('Dr. Sunbeam', 3),
  ('Dr. Miller', 1);

INSERT INTO diagnoses 
(patient, doctor, dept, diagnosis) 
VALUES 
  (1, 1, 4, 'Kidney stones'),
  (1, 4, 1, 'Bladder Cancer'),
  (4, 2, 2, 'Heart murmur'),
  (5, 3, 3, 'C-section'),
  (6, 2, 2, 'Heart attack'),
  (2, 1, 4, 'UTI'),
  (3, 4, 1, 'Breast cancer'),
  (3, 2, 2, 'Tachycardia');





