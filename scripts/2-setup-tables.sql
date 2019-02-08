\connect ecomm;
SET search_path TO graphql;

CREATE TABLE customer (
    id SERIAL PRIMARY KEY NOT NULL,
    email VARCHAR(255) NOT NULL,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    phone CHAR(12),
    street_address VARCHAR(255) NOT NULL,
    city VARCHAR(50) NOT NULL,
    state_abbr CHAR(2) NOT NULL,
    zip_code CHAR(10) NOT NULL,
    created_dtm timestamp with time zone
);

COPY customer (first_name, last_name, email, phone, street_address, city, state_abbr, zip_code, created_dtm)
FROM '/customer.csv' 
WITH (FORMAT csv, HEADER true);