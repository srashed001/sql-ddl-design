DROP DATABASE IF EXISTS medical_center_db; 

CREATE DATABASE medical_center_db;

\c medical_center_db; 

CREATE TABLE doctors (
    id SERIAL PRIMARY KEY, 
    first_name TEXT NOT NULL, 
    last_name TEXT NOT NULL, 
    phone_number TEXT NOT NULL, 
    specialty TEXT NOT NULL 
);

CREATE TABLE patients (
    id SERIAL PRIMARY KEY, 
    first_name TEXT NOT NULL, 
    last_name TEXT NOT NULL, 
    address TEXT NOT NULL, 
    phone_number TEXT NOT NULL
);

CREATE TABLE patient_visits (
    id SERIAL PRIMARY KEY, 
    date DATE NOT NULL, 
    doctor_id INTEGER REFERENCES doctors ON DELETE SET NULL,
    patient_id INTEGER REFERENCES patients ON DELETE SET NULL

);

CREATE TABLE diseases (
    id SERIAL PRIMARY KEY,  
    disease_name TEXT NOT NULL,
    description TEXT
);

CREATE TABLE diagnosis (
    id SERIAL PRIMARY KEY, 
    visit_id INTEGER REFERENCES patient_visits ON DELETE CASCADE, 
    disease_id INTEGER REFERENCES diseases ON DELETE CASCADE
);
