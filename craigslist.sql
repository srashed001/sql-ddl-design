DROP DATABASE IF EXISTS craigslist_db; 

CREATE DATABASE craigslist_db;

\c craigslist_db; 

CREATE TABLE regions (
    id SERIAL PRIMARY KEY, 
    name TEXT NOT NULL
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY, 
    email TEXT NOT NULL, 
    username TEXT NOT NULL, 
    password TEXT NOT NULL, 
    preferred_region INTEGER REFERENCES regions ON DELETE SET NULL
); 

CREATE TABLE categories (
    id SERIAL PRIMARY KEY, 
    category TEXT NOT NULL
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY, 
    title TEXT NOT NULL, 
    post_text TEXT,
    post_location TEXT NOT NULL, 
    user_id INTEGER REFERENCES users ON DELETE SET NULL, 
    post_region INTEGER REFERENCES regions ON DELETE SET NULL
);

CREATE TABLE posts_categories (
    id SERIAL PRIMARY KEY, 
    post_id INTEGER REFERENCES posts ON DELETE CASCADE,
    category_id INTEGER REFERENCES categories ON DELETE SET NULL
); 
