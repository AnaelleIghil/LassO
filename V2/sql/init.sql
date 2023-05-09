-- Initialisation of the database

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
