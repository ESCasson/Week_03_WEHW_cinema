DROP TABLE IF EXISTS customers;

CREATE TABLE customers(
id SERIAL PRIMARY KEY,
name VARCHAR,
funds DEC(8,2)  
);
