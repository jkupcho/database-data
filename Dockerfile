FROM node:lts-alpine as generate_data
COPY ./generate_data/package.json /app/package.json
WORKDIR /app
RUN npm install
COPY ./generate_data/index.js /app/index.js
RUN node index.js

FROM postgres:11-alpine
COPY --from=generate_data /app/customer.csv .
COPY ./scripts/*.sql /docker-entrypoint-initdb.d/