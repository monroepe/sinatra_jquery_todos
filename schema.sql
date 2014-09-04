CREATE TABLE todos(
  id serial PRIMARY KEY,
  body varchar(255) NOT NULL,
  complete boolean DEFAULT FALSE NOT NULL
);
