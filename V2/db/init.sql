
CREATE ROLE "admin-LassO" WITH
  LOGIN
  SUPERUSER
  INHERIT
  CREATEDB
  CREATEROLE
  REPLICATION
  ENCRYPTED PASSWORD 'SCRAM-SHA-256$4096:h0Jv2VDcQDfHnRPJxMX13g==$nJ329oSlzrwNl6ZsBcOhsiLKviQhJtpUYcC8TrDPMVQ=:iZmKPKVIlwcPM90JTd8RIeYaD34cr3omom6XaOobKZc=';

COMMENT ON ROLE "admin-LassO" IS 'Main administrateur for LassO project';

CREATE DATABASE "LassO"
    WITH
    OWNER = "admin-LassO"
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

COMMENT ON DATABASE "LassO"
    IS 'Database of Lasso project V1';

CREATE DOMAIN "email"
    AS text;

ALTER DOMAIN "email"
    ADD CONSTRAINT "email-validator" CHECK (VALUE ~ '([-!#-''*+/-9=?A-Z^-~]+(\.[-!#-''*+/-9=?A-Z^-~]+)*|"([]!#-[^-~ \t]|(\\[\t -~]))+")@([-!#-''*+/-9=?A-Z^-~]+(\.[-!#-''*+/-9=?A-Z^-~]+)*|\[[\t -Z^-~]*])'::text);

CREATE DOMAIN "zip_codeFR"
    AS text;

ALTER DOMAIN "zip_codeFR"
    ADD CONSTRAINT zip_code CHECK (VALUE ~'/^[0-9]{1}[1-9]{1}[0-999]{3}$/gm');

CREATE DOMAIN "phoneFR"
    AS text;

ALTER DOMAIN "phoneFR"
    ADD CONSTRAINT "phoneFR" CHECK (VALUE~'^[0]{1}[1-7]{1}[0-9]{8}$');

CREATE TYPE "statusTickets" AS ENUM
    ('true', 'false');



CREATE TYPE "gender" AS ENUM
    ('Male', 'Female');



CREATE TYPE "instruments" AS ENUM
    ('Surdo', 'Repinique', 'Caixa', 'Tamborim', 'Chocalho', 'Agogô', 'Cuica', 'Apito');


CREATE TYPE "pole" AS ENUM
    ('Admin', 'Treasury', 'Event', 'Logistics', 'Secretary', 'Instruments', 'Suits ', 'Communications');



CREATE TABLE "organization"
(
    id integer NOT NULL,
    pole pole NOT NULL,
    responsible text,
    mail email,
    password text,
    PRIMARY KEY (id)
);

