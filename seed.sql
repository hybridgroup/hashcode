--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

ALTER TABLE ONLY public.tweets DROP CONSTRAINT tweets_pkey;
ALTER TABLE ONLY public.stats DROP CONSTRAINT stats_pkey;
ALTER TABLE public.tweets ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.stats ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public.tweets_id_seq;
DROP TABLE public.tweets;
DROP SEQUENCE public.stats_id_seq;
DROP TABLE public.stats;
DROP EXTENSION plpgsql;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: mario
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO mario;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: mario
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
-- Name: stats; Type: TABLE; Schema: public; Owner: code2014; Tablespace: 
--

CREATE TABLE stats (
    id integer NOT NULL,
    stats text,
    created_at timestamp without time zone
);


ALTER TABLE public.stats OWNER TO code2014;

--
-- Name: stats_id_seq; Type: SEQUENCE; Schema: public; Owner: code2014
--

CREATE SEQUENCE stats_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stats_id_seq OWNER TO code2014;

--
-- Name: stats_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: code2014
--

ALTER SEQUENCE stats_id_seq OWNED BY stats.id;


--
-- Name: tweets; Type: TABLE; Schema: public; Owner: code2014; Tablespace: 
--

CREATE TABLE tweets (
    id integer NOT NULL,
    tweet_id character varying(50),
    attrs text,
    created_at timestamp without time zone
);


ALTER TABLE public.tweets OWNER TO code2014;

--
-- Name: tweets_id_seq; Type: SEQUENCE; Schema: public; Owner: code2014
--

CREATE SEQUENCE tweets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tweets_id_seq OWNER TO code2014;

--
-- Name: tweets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: code2014
--

ALTER SEQUENCE tweets_id_seq OWNED BY tweets.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: code2014
--

ALTER TABLE ONLY stats ALTER COLUMN id SET DEFAULT nextval('stats_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: code2014
--

ALTER TABLE ONLY tweets ALTER COLUMN id SET DEFAULT nextval('tweets_id_seq'::regclass);


--
-- Data for Name: stats; Type: TABLE DATA; Schema: public; Owner: code2014
--

INSERT INTO stats VALUES (1, '{"Ruby":1, "Abap":0,"Ada":0,"Apl":0,"Assembly":0,"Awk":0,"Basic":0,"C":1,"C#":0,"C++":1,"Clojure":1,"Cobol":0,"CoffeeScript":1,"D":0,"Delphi":0,"Erlang":0,"F#":0,"Forth":0,"Fortran":0,"Go":1,"Haskell":0,"Java":0,"JavaScript":1,"Lisp":0,"Logo":0,"Lua":0,"ML":0,"Matlab":0,"Objective-C":0,"Octave":0,"PHP":0,"Pascal":0,"Perl":0,"Prolog":0}', '2014-12-28 20:02:04.272895');


--
-- Name: stats_id_seq; Type: SEQUENCE SET; Schema: public; Owner: code2014
--

SELECT pg_catalog.setval('stats_id_seq', 1, true);


--
-- Data for Name: tweets; Type: TABLE DATA; Schema: public; Owner: code2014
--



--
-- Name: tweets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: code2014
--

SELECT pg_catalog.setval('tweets_id_seq', 1, true);


--
-- Name: stats_pkey; Type: CONSTRAINT; Schema: public; Owner: code2014; Tablespace: 
--

ALTER TABLE ONLY stats
    ADD CONSTRAINT stats_pkey PRIMARY KEY (id);


--
-- Name: tweets_pkey; Type: CONSTRAINT; Schema: public; Owner: code2014; Tablespace: 
--

ALTER TABLE ONLY tweets
    ADD CONSTRAINT tweets_pkey PRIMARY KEY (id);


--
-- Name: public; Type: ACL; Schema: -; Owner: mario
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM mario;
GRANT ALL ON SCHEMA public TO mario;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

