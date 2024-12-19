--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: celestial_bodies; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.celestial_bodies (
    celestial_bodies_id integer NOT NULL,
    name character varying(100) NOT NULL,
    size integer,
    distance numeric,
    stars boolean
);


ALTER TABLE public.celestial_bodies OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    size integer,
    distance numeric,
    stars boolean DEFAULT true
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_id integer,
    size integer,
    oxygen boolean
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    name character varying(100) NOT NULL,
    size integer,
    oxygen boolean,
    planet_id integer NOT NULL,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    size integer,
    color text,
    galaxy_id integer,
    hot boolean DEFAULT true
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: celestial_bodies; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.celestial_bodies VALUES (202020, 'Andromeda', 260000, 2500000, true);
INSERT INTO public.celestial_bodies VALUES (202021, 'Black Eye', 53800, 18300000, true);
INSERT INTO public.celestial_bodies VALUES (202022, 'Cartwheel', 144300, 500000000, true);
INSERT INTO public.celestial_bodies VALUES (202023, 'Comet', 600000, 3200000000, true);
INSERT INTO public.celestial_bodies VALUES (202024, 'Cigar', 11400000, 12000000, true);
INSERT INTO public.celestial_bodies VALUES (202025, 'Milky Way', 100000, 0, true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (202020, 'Andromeda', 260000, 2500000, true);
INSERT INTO public.galaxy VALUES (202021, 'Black Eye', 53800, 18300000, true);
INSERT INTO public.galaxy VALUES (202022, 'Cartwheel', 144300, 500000000, true);
INSERT INTO public.galaxy VALUES (202023, 'Comet', 600000, 3200000000, true);
INSERT INTO public.galaxy VALUES (202024, 'Cigar', 11400000, 12000000, true);
INSERT INTO public.galaxy VALUES (202025, 'Milky Way', 100000, 0, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (11, 'Luna', 1, 123345, false);
INSERT INTO public.moon VALUES (12, 'Ganymede', 2, 23452, false);
INSERT INTO public.moon VALUES (13, 'Europa', 3, 45232, false);
INSERT INTO public.moon VALUES (14, 'Dione', 4, 78565, false);
INSERT INTO public.moon VALUES (15, 'Miranda', 5, 34567, false);
INSERT INTO public.moon VALUES (16, 'Triton', 6, 345578, false);
INSERT INTO public.moon VALUES (17, 'Lapetus', 7, 845634, false);
INSERT INTO public.moon VALUES (18, 'Umbriel', 8, 554656, false);
INSERT INTO public.moon VALUES (19, 'Io', 9, 987957, false);
INSERT INTO public.moon VALUES (20, 'Epimetheus', 10, 656343, false);
INSERT INTO public.moon VALUES (21, 'Phobos', 11, 56733, false);
INSERT INTO public.moon VALUES (22, 'Charon', 12, 67342, false);
INSERT INTO public.moon VALUES (23, 'Hyperion', 1, 43577, false);
INSERT INTO public.moon VALUES (24, 'Atlas', 2, 45636, false);
INSERT INTO public.moon VALUES (25, 'Mimas', 3, 7564523, false);
INSERT INTO public.moon VALUES (26, 'Titania', 4, 23467, false);
INSERT INTO public.moon VALUES (27, 'Dactyl', 5, 453453, false);
INSERT INTO public.moon VALUES (28, 'Rhea', 6, 56234, false);
INSERT INTO public.moon VALUES (29, 'Jupiter moon 1', 7, 56234, false);
INSERT INTO public.moon VALUES (30, 'Jupiter moon 2', 8, 43553, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Earth', 7926, true, 1, 10);
INSERT INTO public.planet VALUES ('Mars', 4222, false, 2, 11);
INSERT INTO public.planet VALUES ('Mercury', 3032, false, 3, 12);
INSERT INTO public.planet VALUES ('Venus', 12345, false, 4, 13);
INSERT INTO public.planet VALUES ('Jupiter', 54566, false, 5, 14);
INSERT INTO public.planet VALUES ('Uranus', 3456, false, 6, 15);
INSERT INTO public.planet VALUES ('Neptune', 8956, false, 7, 10);
INSERT INTO public.planet VALUES ('Saturn', 435, false, 8, 11);
INSERT INTO public.planet VALUES ('Ambot', 546, false, 9, 12);
INSERT INTO public.planet VALUES ('Amaw', 7897, false, 10, 13);
INSERT INTO public.planet VALUES ('Ikaw', 42342, false, 11, 14);
INSERT INTO public.planet VALUES ('Ako', 4222, false, 12, 15);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (10, 'Sun', 1233412, 'Yellow', 202020, true);
INSERT INTO public.star VALUES (11, 'Rigel', 2346237, 'Red', 202021, true);
INSERT INTO public.star VALUES (12, 'Algenib', 65723237, 'White', 202022, true);
INSERT INTO public.star VALUES (13, 'Algieba', 67342312, 'Blue', 202023, true);
INSERT INTO public.star VALUES (14, 'Algol', 1234567, 'Black', 202024, true);
INSERT INTO public.star VALUES (15, 'Algorab', 1233412, 'Yellow', 202025, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: celestial_bodies celestial_bodies_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_bodies
    ADD CONSTRAINT celestial_bodies_name_key UNIQUE (name);


--
-- Name: celestial_bodies celestial_bodies_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_bodies
    ADD CONSTRAINT celestial_bodies_pkey PRIMARY KEY (celestial_bodies_id);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

