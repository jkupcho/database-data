\connect ecomm;
SET search_path TO ecomm;

CREATE TABLE customer (
    email VARCHAR(255) PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    phone CHAR(12),
    street_address VARCHAR(255),
    city VARCHAR(50),
    state CHAR(2),
    zip_code CHAR(10),
    created_dtm timestamp with time zone
);

/*COPY customer
    FROM '/customer.csv'
    WITH HEADER true*/
