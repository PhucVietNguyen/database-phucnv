-- Table: netflix_db.oauth_access_token

-- DROP TABLE netflix_db.oauth_access_token;

CREATE TABLE netflix_db.oauth_access_token
(
    token_id character varying(256) COLLATE pg_catalog."default",
    authentication_id character varying(256) COLLATE pg_catalog."default" NOT NULL,
    user_name character varying(256) COLLATE pg_catalog."default",
    client_id character varying(256) COLLATE pg_catalog."default",
    authentication bytea,
    refresh_token character varying(256) COLLATE pg_catalog."default",
    token bytea,
    CONSTRAINT oauth_access_token_pkey PRIMARY KEY (authentication_id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE netflix_db.oauth_access_token
    OWNER to postgres;

-- Table: netflix_db.oauth_approvals

-- DROP TABLE netflix_db.oauth_approvals;

CREATE TABLE netflix_db.oauth_approvals
(
    userid character varying(256) COLLATE pg_catalog."default",
    clientid character varying(256) COLLATE pg_catalog."default",
    scope character varying(256) COLLATE pg_catalog."default",
    status character varying(10) COLLATE pg_catalog."default",
    expiresat timestamp without time zone,
    lastmodifiedat timestamp without time zone
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE netflix_db.oauth_approvals
    OWNER to postgres;

-- Table: netflix_db.oauth_client_details

-- DROP TABLE netflix_db.oauth_client_details;

CREATE TABLE netflix_db.oauth_client_details
(
    client_id character varying(255) COLLATE pg_catalog."default" NOT NULL,
    client_secret character varying(255) COLLATE pg_catalog."default" NOT NULL,
    web_server_redirect_uri character varying(2048) COLLATE pg_catalog."default" DEFAULT NULL::character varying,
    scope character varying(255) COLLATE pg_catalog."default" DEFAULT NULL::character varying,
    access_token_validity integer,
    refresh_token_validity integer,
    resource_ids character varying(1024) COLLATE pg_catalog."default" DEFAULT NULL::character varying,
    authorized_grant_types character varying(1024) COLLATE pg_catalog."default" DEFAULT NULL::character varying,
    authorities character varying(1024) COLLATE pg_catalog."default" DEFAULT NULL::character varying,
    additional_information character varying(4096) COLLATE pg_catalog."default" DEFAULT NULL::character varying,
    autoapprove character varying(255) COLLATE pg_catalog."default" DEFAULT NULL::character varying,
    CONSTRAINT oauth_client_details_pkey PRIMARY KEY (client_id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE netflix_db.oauth_client_details
    OWNER to postgres;

-- Table: netflix_db.oauth_client_token

-- DROP TABLE netflix_db.oauth_client_token;

CREATE TABLE netflix_db.oauth_client_token
(
    token_id character varying(256) COLLATE pg_catalog."default",
    token bytea,
    authentication_id character varying(256) COLLATE pg_catalog."default" NOT NULL,
    user_name character varying(256) COLLATE pg_catalog."default",
    client_id character varying(256) COLLATE pg_catalog."default",
    CONSTRAINT oauth_client_token_pkey PRIMARY KEY (authentication_id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE netflix_db.oauth_client_token
    OWNER to postgres;

-- Table: netflix_db.oauth_code

-- DROP TABLE netflix_db.oauth_code;

CREATE TABLE netflix_db.oauth_code
(
    code character varying(256) COLLATE pg_catalog."default",
    authentication bytea
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE netflix_db.oauth_code
    OWNER to postgres;

-- Table: netflix_db.oauth_refresh_token

-- DROP TABLE netflix_db.oauth_refresh_token;

CREATE TABLE netflix_db.oauth_refresh_token
(
    token_id character varying(256) COLLATE pg_catalog."default",
    token bytea,
    authentication bytea
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE netflix_db.oauth_refresh_token
    OWNER to postgres;

-- Table: netflix_db.permission

-- DROP TABLE netflix_db.permission;

CREATE TABLE netflix_db.permission
(
    id integer NOT NULL,
    name character varying(512) COLLATE pg_catalog."default" DEFAULT NULL::character varying,
    CONSTRAINT permission_pkey PRIMARY KEY (id),
    CONSTRAINT permission_name_key UNIQUE (name)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE netflix_db.permission
    OWNER to postgres;

-- Table: netflix_db.permission_role

-- DROP TABLE netflix_db.permission_role;

CREATE TABLE netflix_db.permission_role
(
    permission_id integer NOT NULL,
    role_id integer NOT NULL,
    CONSTRAINT permission_role_pkey PRIMARY KEY (permission_id, role_id),
    CONSTRAINT permission_role_ibfk_1 FOREIGN KEY (permission_id)
        REFERENCES netflix_db.permission (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT permission_role_ibfk_2 FOREIGN KEY (role_id)
        REFERENCES netflix_db.role (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE netflix_db.permission_role
    OWNER to postgres;

-- Table: netflix_db.role

-- DROP TABLE netflix_db.role;

CREATE TABLE netflix_db.role
(
    id integer NOT NULL,
    name character varying(255) COLLATE pg_catalog."default" DEFAULT NULL::character varying,
    CONSTRAINT role_pkey PRIMARY KEY (id),
    CONSTRAINT role_name_key UNIQUE (name)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE netflix_db.role
    OWNER to postgres;

-- Table: netflix_db.role_user

-- DROP TABLE netflix_db.role_user;

CREATE TABLE netflix_db.role_user
(
    role_id integer NOT NULL,
    user_id integer NOT NULL,
    CONSTRAINT role_user_pkey PRIMARY KEY (role_id, user_id),
    CONSTRAINT role_user_ibfk_1 FOREIGN KEY (role_id)
        REFERENCES netflix_db.role (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT role_user_ibfk_2 FOREIGN KEY (user_id)
        REFERENCES netflix_db."user" (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE netflix_db.role_user
    OWNER to postgres;

-- Table: netflix_db.user

-- DROP TABLE netflix_db."user";

CREATE TABLE netflix_db."user"
(
    id integer NOT NULL,
    username character varying(100) COLLATE pg_catalog."default" NOT NULL,
    password character varying(1024) COLLATE pg_catalog."default" NOT NULL,
    email character varying(1024) COLLATE pg_catalog."default" NOT NULL,
    enabled boolean NOT NULL,
    accountnonexpired boolean NOT NULL,
    credentialsnonexpired boolean NOT NULL,
    accountnonlocked boolean NOT NULL,
    CONSTRAINT user_pkey PRIMARY KEY (id),
    CONSTRAINT user_username_key UNIQUE (username)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE netflix_db."user"
    OWNER to postgres;


