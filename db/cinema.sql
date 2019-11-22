DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS films;

CREATE TABLE customers(
id SERIAL PRIMARY KEY,
name VARCHAR,
funds DEC(8, 2)
);

CREATE TABLE films(
  id SERIAL PRIMARY KEY,
  title VARCHAR,
  price DEC(8, 2)
);
