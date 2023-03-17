--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    constellation character varying(40),
    name_origin text,
    has_life boolean NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    diameter integer,
    planet_id integer NOT NULL,
    description text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: more_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.more_info (
    more_info_id integer NOT NULL,
    distancetoearth bigint NOT NULL,
    expectral text,
    magnitude character varying(30) NOT NULL,
    bayer character varying(50),
    name character varying(30)
);


ALTER TABLE public.more_info OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    diameter integer,
    has_life boolean NOT NULL,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance_from_earth numeric,
    age numeric NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Via Lactea', 'Sagittarius', 'porque parece leite', true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Andromeda', 'area do ceu que aparece', false);
INSERT INTO public.galaxy VALUES (3, 'Olho Negro', 'Coma Berenices', 'parece olho negro', false);
INSERT INTO public.galaxy VALUES (4, 'Bode', 'Ursa Maior', 'nomeado pelo Johann Elert', false);
INSERT INTO public.galaxy VALUES (5, 'Cartwheel', 'Sculptor', 'aparencia semelhante a roda', false);
INSERT INTO public.galaxy VALUES (6, 'Charuto', 'Ursa Major', 'parece um charuto', false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 3474, 3, 'Luna is the Earth''s only natural satellite.');
INSERT INTO public.moon VALUES (2, 'Phobos', 22, 4, 'Phobos is the larger and innermost of the two natural satellites of Mars.');
INSERT INTO public.moon VALUES (3, 'Deimos', 12, 4, 'Deimos is the smaller and outermost of the two natural satellites of Mars.');
INSERT INTO public.moon VALUES (4, 'Ganymede', 5268, 5, 'Ganymede is the largest moon of Jupiter and also the largest moon in the solar system.');
INSERT INTO public.moon VALUES (5, 'Europa', 3122, 5, 'Europa is one of the four Galilean moons of Jupiter and is known for its icy surface.');
INSERT INTO public.moon VALUES (6, 'Callisto', 4820, 5, 'Callisto is the second largest moon of Jupiter and the third largest moon in the solar system.');
INSERT INTO public.moon VALUES (7, 'Io', 3642, 5, 'Io is the innermost of the four Galilean moons of Jupiter and is known for its volcanic activity.');
INSERT INTO public.moon VALUES (8, 'Titan', 5151, 6, 'Titan is the largest moon of Saturn and is known for its dense atmosphere.');
INSERT INTO public.moon VALUES (9, 'Mimas', 396, 6, 'Mimas is a small moon of Saturn and is known for its distinctive crater.');
INSERT INTO public.moon VALUES (10, 'Enceladus', 504, 6, 'Enceladus is a small moon of Saturn and is known for its geysers of water ice.');
INSERT INTO public.moon VALUES (11, 'Rhea', 1527, 6, 'Rhea is the second largest moon of Saturn and has a heavily cratered surface.');
INSERT INTO public.moon VALUES (12, 'Tethys', 1066, 6, 'Tethys is a mid-sized moon of Saturn and has a heavily cratered surface.');
INSERT INTO public.moon VALUES (13, 'Dione', 1123, 6, 'Dione is a mid-sized moon of Saturn and has a heavily cratered surface.');
INSERT INTO public.moon VALUES (14, 'Hyperion', 266, 6, 'Hyperion is an irregularly shaped moon of Saturn and has a heavily cratered surface.');
INSERT INTO public.moon VALUES (15, 'Iapetus', 1469, 6, 'Iapetus is a large moon of Saturn and has a heavily cratered surface.');
INSERT INTO public.moon VALUES (16, 'Miranda', 472, 7, 'Miranda is a small moon of Uranus and is known for its unique surface features.');
INSERT INTO public.moon VALUES (17, 'Ariel', 1158, 7, 'Ariel is a mid-sized moon of Uranus and has a heavily cratered surface.');
INSERT INTO public.moon VALUES (18, 'Umbriel', 1169, 7, 'Umbriel is a mid-sized moon of Uranus and has a heavily cratered surface.');
INSERT INTO public.moon VALUES (19, 'Titania', 1578, 7, 'Titania is the largest moon of Uranus and has a heavily cratered surface.');
INSERT INTO public.moon VALUES (20, 'Oberon', 1523, 7, 'Oberon is the second largest moon of Uranus and has a heavily cratered surface.');


--
-- Data for Name: more_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.more_info VALUES (1, 92, 'A', '-0.42', 'β', 'Mercúrio');
INSERT INTO public.more_info VALUES (2, 41, 'G', '-4.4', 'α', 'Vênus');
INSERT INTO public.more_info VALUES (3, 0, 'G', '-3.0', NULL, 'Terra');
INSERT INTO public.more_info VALUES (4, 78, 'A', '-2.9', NULL, 'Marte');
INSERT INTO public.more_info VALUES (5, 629, 'A', '-2.6', NULL, 'Júpiter');
INSERT INTO public.more_info VALUES (6, 1275, 'G', '-0.5', NULL, 'Saturno');
INSERT INTO public.more_info VALUES (7, 2724, 'A', '5.6', NULL, 'Urano');
INSERT INTO public.more_info VALUES (8, 4350, 'A', '7.8', NULL, 'Netuno');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercurio', 4879, false, 7);
INSERT INTO public.planet VALUES (2, 'Venus', 12104, false, 7);
INSERT INTO public.planet VALUES (3, 'Terra', 12756, true, 7);
INSERT INTO public.planet VALUES (4, 'Marte', 6787, false, 7);
INSERT INTO public.planet VALUES (5, 'Jupiter', 139822, false, 7);
INSERT INTO public.planet VALUES (6, 'Saturno', 116460, false, 7);
INSERT INTO public.planet VALUES (7, 'Urano', 50724, false, 7);
INSERT INTO public.planet VALUES (8, 'Athena', 8000, false, 9);
INSERT INTO public.planet VALUES (9, 'Xanthe', 11000, false, 10);
INSERT INTO public.planet VALUES (10, 'Lyra', 6000, false, 11);
INSERT INTO public.planet VALUES (11, 'Zephyr', 4500, false, 9);
INSERT INTO public.planet VALUES (12, 'Nova', 12000, false, 9);
INSERT INTO public.planet VALUES (13, 'Aurora', 8500, false, 9);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (7, 'sol', 1, 4.6, 1);
INSERT INTO public.star VALUES (8, 'Centauri', 4.24, 4.85, 1);
INSERT INTO public.star VALUES (9, 'Cirus A', 8.6, 2.6, 1);
INSERT INTO public.star VALUES (10, 'Vega', 25, 0.45, 1);
INSERT INTO public.star VALUES (11, 'Canopus', 310, 0.9, 1);
INSERT INTO public.star VALUES (12, 'Betelgeuse', 642, 8.5, 1);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 12, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_name_origin_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_origin_key UNIQUE (name_origin);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: more_info more_info_distancetoearth_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT more_info_distancetoearth_key UNIQUE (distancetoearth);
