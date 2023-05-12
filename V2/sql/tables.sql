-- Creation of the tables
BEGIN ; 

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

CREATE DOMAIN "birthdate"
    AS text;

ALTER DOMAIN "birthdate"
    ADD CONSTRAINT birthdate CHECK (VALUE~'^([0-2]{1}[0-9]|[3]{1}[0-1]{1})\/([0]{1}[1-9]{1}|[1]{1}[0-2]{1})\/([1]{1}[9]{1}[3-9]{1}[0-9]{1}|[2]{1}[0]{1}[0]{1}[0-9]{1}|[2]{1}[0]{1}[1]{1}[0-5]{1})$');


CREATE TYPE "statusTickets" AS ENUM
    ('true', 'false');

CREATE TYPE "gender" AS ENUM
    ('Male', 'Female');


CREATE TYPE "instruments" AS ENUM
    ('Surdo', 'Repinique', 'Caixa', 'Tamborim', 'Chocalho', 'Agogô', 'Cuica', 'Apito');


CREATE TYPE "pole" AS ENUM
    ('Admin', 'Treasury', 'Event', 'Logistics', 'Secretary', 'Instruments', 'Suits ', 'Communications');

CREATE TYPE "size" AS ENUM
    ('XS', 'S', 'M', 'L', 'XL', 'XXL', 'XXXL');


CREATE TABLE "organization"
(
    id integer NOT NULL,
    pole pole NOT NULL,
    responsible text,
    mail email,
    password text,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS "instrument"
(
    id integer NOT NULL,
    name text COLLATE pg_catalog."default",
    type instruments,
    observation text COLLATE pg_catalog."default",
    rods integer,
    weight integer,
    sticker boolean,
    CONSTRAINT "id_Instrument" PRIMARY KEY (id)
        INCLUDE(id)
);

CREATE TABLE IF NOT EXISTS "member"
(
    id integer NOT NULL,
    name text COLLATE pg_catalog."default",
    firstname text COLLATE pg_catalog."default",
    nickname text COLLATE pg_catalog."default",
    email email COLLATE pg_catalog."default",
    password text COLLATE pg_catalog."default",
    birthdate text COLLATE pg_catalog."default",
    phone "phoneFR" COLLATE pg_catalog."default",
    adress text COLLATE pg_catalog."default",
    zip_code "zip_codeFR" COLLATE pg_catalog."default",
    gender_suits gender,
    size_up size,
    size_bottom size,
    status pole,
    created_at timestamp with time zone NOT NULL DEFAULT now(),
    updated_at timestamp with time zone NOT NULL DEFAULT now(),
    instrument integer,
    CONSTRAINT "id_Member" PRIMARY KEY (id)
        INCLUDE(id),
    CONSTRAINT email UNIQUE (email),
    CONSTRAINT instrument FOREIGN KEY (instrument)
        REFERENCES "instrument" (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);

CREATE TABLE IF NOT EXISTS "suits"
(
    id integer NOT NULL,
    "group" text COLLATE pg_catalog."default",
    gender gender,
    observation text COLLATE pg_catalog."default",
    size size,
    CONSTRAINT "id_Suit" PRIMARY KEY (id)
);

CREATE TABLE "loan_Instrument"
(
    id integer NOT NULL,
    "id_Member" integer,
    "id_Instrument" integer,
    created_at timestamp with time zone DEFAULT NOW(),
    returned_at timestamp with time zone,
    CONSTRAINT "id_LoanInstrument" PRIMARY KEY (id)
        INCLUDE(id),
    CONSTRAINT "id_Member" FOREIGN KEY ("id_Member")
        REFERENCES "member" (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
        NOT VALID,
    CONSTRAINT "id_Instrument" FOREIGN KEY ("id_Instrument")
        REFERENCES "instrument" (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
        NOT VALID
);

CREATE TABLE "loan_Suit"
(
    id integer NOT NULL,
    "id_Member" integer,
    "id_Suit" integer,
    created_at timestamp with time zone DEFAULT NOW(),
    returned_at timestamp with time zone,
    CONSTRAINT "id_LoanSuit" PRIMARY KEY ("id_Member")
        INCLUDE(id),
    CONSTRAINT "id_Member" FOREIGN KEY ("id_Member")
        REFERENCES "member" (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
        NOT VALID,
    CONSTRAINT "id_Suit" FOREIGN KEY ("id_Suit")
        REFERENCES "suits" (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
        NOT VALID
);
CREATE TABLE "treasury"
(
    id integer NOT NULL,
    created_at timestamp with time zone DEFAULT NOW(),
    paid_at timestamp with time zone,
    subject text,
    pole pole,
    CONSTRAINT id_treasury PRIMARY KEY (id)
);
CREATE TABLE "treasury_Member"
(
    id integer NOT NULL,
    "id_Member" integer,
    status_deposit boolean,
    status_cotisation boolean,
    CONSTRAINT "id_TreasuryMember" PRIMARY KEY (id),
    CONSTRAINT "id_Member" FOREIGN KEY ("id_Member")
        REFERENCES "member" (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);
CREATE TABLE "issues"
(
    id integer NOT NULL,
    "id_Member" integer NOT NULL,
    id_organization integer NOT NULL,
    status "statusTickets",
    content text,
    CONSTRAINT id_issue PRIMARY KEY (id),
    CONSTRAINT "id_Member" FOREIGN KEY ("id_Member")
        REFERENCES "member" (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);
CREATE TABLE IF NOT EXISTS "messages"
(
    id integer,
    "id_Member" integer,
    id_organization integer,
    send_at timestamp with time zone DEFAULT now(),
    subject text COLLATE pg_catalog."default",
    content text COLLATE pg_catalog."default",
    status "statusTickets"
);

COMMIT;
