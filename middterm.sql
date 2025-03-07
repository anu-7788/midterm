-- This script was generated by the ERD tool in pgAdmin 4.
-- Please log an issue at https://github.com/pgadmin-org/pgadmin4/issues/new/choose if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE IF NOT EXISTS public.contract
(
    contract_id "char" NOT NULL,
    union_id "char",
    movie_id "char",
    salary numeric,
    CONSTRAINT contract_pkey PRIMARY KEY (contract_id)
);

CREATE TABLE IF NOT EXISTS public.movies
(
    movies_id "char" NOT NULL,
    title text COLLATE pg_catalog."default",
    release_date date,
    awards_won numeric,
    CONSTRAINT movies_pkey PRIMARY KEY (movies_id)
);

CREATE TABLE IF NOT EXISTS public.people
(
    union_id character(1)[] COLLATE pg_catalog."default" NOT NULL,
    name text COLLATE pg_catalog."default",
    "DOB" date,
    "nationality " text COLLATE pg_catalog."default",
    biography text COLLATE pg_catalog."default",
    contact_info text COLLATE pg_catalog."default",
    CONSTRAINT people_pkey PRIMARY KEY (union_id)
);

CREATE TABLE IF NOT EXISTS public."production staff"
(
    union_id "char",
    role text
);

CREATE TABLE IF NOT EXISTS public.people_contract
(
    people_union_id character(1)[] COLLATE pg_catalog."default" NOT NULL,
    contract_contract_id "char" NOT NULL
);

CREATE TABLE IF NOT EXISTS public.movies_contract
(
    movies_movies_id "char" NOT NULL,
    contract_contract_id "char" NOT NULL
);

CREATE TABLE IF NOT EXISTS public."people_production staff"
(
    people_union_id character(1)[] COLLATE pg_catalog."default" NOT NULL,
    "production staff_union_id" "char"
);

ALTER TABLE IF EXISTS public.people
    ADD FOREIGN KEY (union_id)
    REFERENCES public.movies (movies_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.people_contract
    ADD FOREIGN KEY (people_union_id)
    REFERENCES public.people (union_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.people_contract
    ADD FOREIGN KEY (contract_contract_id)
    REFERENCES public.contract (contract_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.movies_contract
    ADD FOREIGN KEY (movies_movies_id)
    REFERENCES public.movies (movies_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.movies_contract
    ADD FOREIGN KEY (contract_contract_id)
    REFERENCES public.contract (contract_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."people_production staff"
    ADD FOREIGN KEY (people_union_id)
    REFERENCES public.people (union_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."people_production staff"
    ADD FOREIGN KEY ("production staff_union_id")
    REFERENCES public."production staff" (union_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

END;