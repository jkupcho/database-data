CREATE DATABASE ecomm;
\connect ecomm;

CREATE SCHEMA graphql;

CREATE USER ecomm;
GRANT ALL PRIVILEGES ON DATABASE ecomm TO ecomm;