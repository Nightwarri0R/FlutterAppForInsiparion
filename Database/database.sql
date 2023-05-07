CREATE DATABASE myQuotesDatabase;


CREATE TABLE mytable (
   id SERIAL PRIMARY KEY,
   quotes TEXT NOT NULL,
   author TEXT NOT NULL,
   lastUpdated TIMESTAMP NOT NULL
);