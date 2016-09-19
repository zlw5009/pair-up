--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.3
-- Dumped by pg_dump version 9.5.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

ALTER TABLE ONLY public.teams DROP CONSTRAINT teams_team_leader_fkey;
ALTER TABLE ONLY public.teams DROP CONSTRAINT teams_challenge_id_fkey;
ALTER TABLE ONLY public.skillset DROP CONSTRAINT skillset_user_id_fkey;
ALTER TABLE ONLY public.leader_boards DROP CONSTRAINT leader_board_challenge_id_fkey;
ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
ALTER TABLE ONLY public.teams DROP CONSTRAINT teams_pkey;
ALTER TABLE ONLY public.skillset DROP CONSTRAINT skillset_pkey;
ALTER TABLE ONLY public.leader_boards DROP CONSTRAINT leader_boards_pkey;
ALTER TABLE ONLY public.challenges DROP CONSTRAINT challenges_pkey;
ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.teams ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.skillset ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.leader_boards ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.challenges ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public.users_id_seq;
DROP TABLE public.users;
DROP SEQUENCE public.teams_id_seq;
DROP TABLE public.teams;
DROP SEQUENCE public.skillset_id_seq;
DROP TABLE public.skillset;
DROP SEQUENCE public.leader_board_id_seq;
DROP TABLE public.leader_boards;
DROP SEQUENCE public.challenges_id_seq;
DROP TABLE public.challenges;
DROP EXTENSION plpgsql;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: Zach
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO "Zach";

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: Zach
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: challenges; Type: TABLE; Schema: public; Owner: Zach
--

CREATE TABLE challenges (
    id integer NOT NULL,
    title text NOT NULL,
    difficulty integer NOT NULL,
    description text NOT NULL,
    stub_link text,
    overview_link text,
    start_date timestamp without time zone,
    end_date timestamp without time zone
);


ALTER TABLE challenges OWNER TO "Zach";

--
-- Name: challenges_id_seq; Type: SEQUENCE; Schema: public; Owner: Zach
--

CREATE SEQUENCE challenges_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE challenges_id_seq OWNER TO "Zach";

--
-- Name: challenges_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Zach
--

ALTER SEQUENCE challenges_id_seq OWNED BY challenges.id;


--
-- Name: leader_boards; Type: TABLE; Schema: public; Owner: Zach
--

CREATE TABLE leader_boards (
    id integer NOT NULL,
    rank integer,
    challenge_id integer NOT NULL
);


ALTER TABLE leader_boards OWNER TO "Zach";

--
-- Name: leader_board_id_seq; Type: SEQUENCE; Schema: public; Owner: Zach
--

CREATE SEQUENCE leader_board_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE leader_board_id_seq OWNER TO "Zach";

--
-- Name: leader_board_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Zach
--

ALTER SEQUENCE leader_board_id_seq OWNED BY leader_boards.id;


--
-- Name: skillset; Type: TABLE; Schema: public; Owner: Zach
--

CREATE TABLE skillset (
    id integer NOT NULL,
    ruby integer DEFAULT 0 NOT NULL,
    javascript integer DEFAULT 0 NOT NULL,
    html integer DEFAULT 0 NOT NULL,
    sql integer DEFAULT 0 NOT NULL,
    github integer DEFAULT 0 NOT NULL,
    heroku integer DEFAULT 0 NOT NULL,
    rails integer DEFAULT 0 NOT NULL,
    sinatra integer DEFAULT 0 NOT NULL,
    css integer DEFAULT 0 NOT NULL,
    jquery integer DEFAULT 0 NOT NULL,
    user_id integer
);


ALTER TABLE skillset OWNER TO "Zach";

--
-- Name: skillset_id_seq; Type: SEQUENCE; Schema: public; Owner: Zach
--

CREATE SEQUENCE skillset_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE skillset_id_seq OWNER TO "Zach";

--
-- Name: skillset_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Zach
--

ALTER SEQUENCE skillset_id_seq OWNED BY skillset.id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: Zach
--

CREATE TABLE teams (
    id integer NOT NULL,
    name text NOT NULL,
    team_leader integer,
    submission_link text,
    challenge_id integer
);


ALTER TABLE teams OWNER TO "Zach";

--
-- Name: teams_id_seq; Type: SEQUENCE; Schema: public; Owner: Zach
--

CREATE SEQUENCE teams_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE teams_id_seq OWNER TO "Zach";

--
-- Name: teams_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Zach
--

ALTER SEQUENCE teams_id_seq OWNED BY teams.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: Zach
--

CREATE TABLE users (
    id integer NOT NULL,
    name text NOT NULL,
    password text NOT NULL,
    email text NOT NULL,
    current_team_id integer,
    current_challenge_id integer
);


ALTER TABLE users OWNER TO "Zach";

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: Zach
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO "Zach";

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Zach
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Zach
--

ALTER TABLE ONLY challenges ALTER COLUMN id SET DEFAULT nextval('challenges_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Zach
--

ALTER TABLE ONLY leader_boards ALTER COLUMN id SET DEFAULT nextval('leader_board_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Zach
--

ALTER TABLE ONLY skillset ALTER COLUMN id SET DEFAULT nextval('skillset_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Zach
--

ALTER TABLE ONLY teams ALTER COLUMN id SET DEFAULT nextval('teams_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Zach
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: challenges; Type: TABLE DATA; Schema: public; Owner: Zach
--

INSERT INTO challenges VALUES (1, 'this challenge', 2, 'some description', NULL, NULL, NULL, NULL);
INSERT INTO challenges VALUES (2, 'this challenge', 2, 'some description', NULL, NULL, NULL, NULL);


--
-- Name: challenges_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Zach
--

SELECT pg_catalog.setval('challenges_id_seq', 2, true);


--
-- Name: leader_board_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Zach
--

SELECT pg_catalog.setval('leader_board_id_seq', 1, false);


--
-- Data for Name: leader_boards; Type: TABLE DATA; Schema: public; Owner: Zach
--



--
-- Data for Name: skillset; Type: TABLE DATA; Schema: public; Owner: Zach
--

INSERT INTO skillset VALUES (2, 2, 2, 2, 0, 0, 0, 0, 0, 2, 0, NULL);


--
-- Name: skillset_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Zach
--

SELECT pg_catalog.setval('skillset_id_seq', 2, true);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: Zach
--



--
-- Name: teams_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Zach
--

SELECT pg_catalog.setval('teams_id_seq', 1, false);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: Zach
--

INSERT INTO users VALUES (2, 'Zach', 'admin', 'zlw5009@gmail.com', NULL, 1);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Zach
--

SELECT pg_catalog.setval('users_id_seq', 3, true);


--
-- Name: challenges_pkey; Type: CONSTRAINT; Schema: public; Owner: Zach
--

ALTER TABLE ONLY challenges
    ADD CONSTRAINT challenges_pkey PRIMARY KEY (id);


--
-- Name: leader_boards_pkey; Type: CONSTRAINT; Schema: public; Owner: Zach
--

ALTER TABLE ONLY leader_boards
    ADD CONSTRAINT leader_boards_pkey PRIMARY KEY (id);


--
-- Name: skillset_pkey; Type: CONSTRAINT; Schema: public; Owner: Zach
--

ALTER TABLE ONLY skillset
    ADD CONSTRAINT skillset_pkey PRIMARY KEY (id);


--
-- Name: teams_pkey; Type: CONSTRAINT; Schema: public; Owner: Zach
--

ALTER TABLE ONLY teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: Zach
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: leader_board_challenge_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Zach
--

ALTER TABLE ONLY leader_boards
    ADD CONSTRAINT leader_board_challenge_id_fkey FOREIGN KEY (challenge_id) REFERENCES challenges(id);


--
-- Name: skillset_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Zach
--

ALTER TABLE ONLY skillset
    ADD CONSTRAINT skillset_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: teams_challenge_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Zach
--

ALTER TABLE ONLY teams
    ADD CONSTRAINT teams_challenge_id_fkey FOREIGN KEY (challenge_id) REFERENCES challenges(id);


--
-- Name: teams_team_leader_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Zach
--

ALTER TABLE ONLY teams
    ADD CONSTRAINT teams_team_leader_fkey FOREIGN KEY (team_leader) REFERENCES users(id);


--
-- PostgreSQL database dump complete
--

