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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30),
    description text,
    has_life boolean NOT NULL,
    shape character varying(30),
    age_in_millions_of_years integer,
    distance_from_earth_in_ly numeric
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
-- Name: jupiter_moons; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.jupiter_moons (
    jupiter_moons_id integer NOT NULL,
    name character varying(30),
    planet_id integer,
    has_life boolean NOT NULL,
    in_jupiter boolean NOT NULL
);


ALTER TABLE public.jupiter_moons OWNER TO freecodecamp;

--
-- Name: jupiter_moons_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.jupiter_moons_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.jupiter_moons_moon_id_seq OWNER TO freecodecamp;

--
-- Name: jupiter_moons_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.jupiter_moons_moon_id_seq OWNED BY public.jupiter_moons.jupiter_moons_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30),
    planet_id integer NOT NULL,
    description text,
    has_life boolean NOT NULL,
    age_in_millions_of_years integer
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
    planet_id integer NOT NULL,
    name character varying(30),
    star_id integer NOT NULL,
    description text,
    has_life boolean NOT NULL,
    age_in_millions_of_years integer,
    planet_type character varying(30),
    distance_from_earth_in_ly numeric
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30),
    galaxy_id integer NOT NULL,
    description text,
    has_life boolean NOT NULL,
    star_type character varying(5),
    age_in_millions_of_years integer,
    distance_from_earth_in_ly numeric
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
-- Name: jupiter_moons jupiter_moons_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.jupiter_moons ALTER COLUMN jupiter_moons_id SET DEFAULT nextval('public.jupiter_moons_moon_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Home galaxy of Earth', true, 'Spiral', 13600, 0);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Closest galaxy to the Milky Way', false, 'Spiral', 10000, 2500000);
INSERT INTO public.galaxy VALUES (3, 'Antennae', 'Two galaxies colliding cause the galaxy to look like insect antennae.', false, 'Colliding', 250, 45000000);
INSERT INTO public.galaxy VALUES (4, 'Backward', 'Appears to be rotating backwards', false, 'Spiral', NULL, 111000000);
INSERT INTO public.galaxy VALUES (5, 'Bear Claw', 'Resembles the claw of a bear', false, NULL, NULL, 22000000);
INSERT INTO public.galaxy VALUES (6, 'Black Eye', 'Has dark band of dust in front of galactic center', false, 'Spiral', NULL, 17300000);


--
-- Data for Name: jupiter_moons; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.jupiter_moons VALUES (4, 'Io', 5, false, true);
INSERT INTO public.jupiter_moons VALUES (5, 'Europa', 5, false, true);
INSERT INTO public.jupiter_moons VALUES (6, 'Ganymede', 5, false, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, NULL, false, NULL);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, NULL, false, NULL);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, NULL, false, NULL);
INSERT INTO public.moon VALUES (4, 'Io', 5, NULL, false, NULL);
INSERT INTO public.moon VALUES (5, 'Europa', 5, NULL, false, NULL);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, NULL, false, NULL);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, NULL, false, NULL);
INSERT INTO public.moon VALUES (8, 'Amalthea', 5, NULL, false, NULL);
INSERT INTO public.moon VALUES (9, 'Himalia', 5, NULL, false, NULL);
INSERT INTO public.moon VALUES (10, 'Elara', 5, NULL, false, NULL);
INSERT INTO public.moon VALUES (11, 'Pasiphae', 5, NULL, false, NULL);
INSERT INTO public.moon VALUES (12, 'Sinope', 5, NULL, false, NULL);
INSERT INTO public.moon VALUES (13, 'Lysithea', 5, NULL, false, NULL);
INSERT INTO public.moon VALUES (14, 'Carme', 5, NULL, false, NULL);
INSERT INTO public.moon VALUES (15, 'Ananke', 5, NULL, false, NULL);
INSERT INTO public.moon VALUES (16, 'Leda', 5, NULL, false, NULL);
INSERT INTO public.moon VALUES (17, 'Thebe', 5, NULL, false, NULL);
INSERT INTO public.moon VALUES (18, 'Adrastea', 5, NULL, false, NULL);
INSERT INTO public.moon VALUES (19, 'Metis', 5, NULL, false, NULL);
INSERT INTO public.moon VALUES (20, 'Callihrroe', 5, NULL, false, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'Closest planet to the sun', false, NULL, 'Rock', NULL);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'Incredibly hot and dense surface due to runaway greenhouse effect', false, NULL, 'Rock', NULL);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Only place in the universe known to host life', true, NULL, 'Rock', NULL);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'Closest planet to the Earth and thought to once have liquid water', false, NULL, 'Rock', NULL);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'Largest planet in the solar system', false, NULL, 'Gas', NULL);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Hosts a system of beautiful rings of dust', false, NULL, 'Gas', NULL);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, NULL, false, NULL, 'Gas', NULL);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, NULL, false, NULL, 'Gas', NULL);
INSERT INTO public.planet VALUES (9, 'Lalande 21185 b', 8, NULL, false, NULL, NULL, 8.30);
INSERT INTO public.planet VALUES (10, 'Lalande 21185 c', 8, NULL, false, NULL, NULL, 8.30);
INSERT INTO public.planet VALUES (11, 'Lacaille 9352 b', 9, NULL, false, NULL, NULL, 10.72);
INSERT INTO public.planet VALUES (12, 'Lacaille 9352 c', 9, NULL, false, NULL, NULL, 10.72);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'Host star of Earth', true, 'Main', NULL, 0.0000158);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 'Closest star to our solar system', false, NULL, NULL, 4.25);
INSERT INTO public.star VALUES (3, 'Rigil Kentaurus', 1, NULL, false, NULL, NULL, 4.34);
INSERT INTO public.star VALUES (4, 'Toliman', 1, NULL, false, NULL, NULL, 4.34);
INSERT INTO public.star VALUES (5, 'Barnards', 1, NULL, false, NULL, NULL, 5.96);
INSERT INTO public.star VALUES (6, 'Luhman 16 A', 1, NULL, false, NULL, NULL, 6.50);
INSERT INTO public.star VALUES (7, 'luhman 16 B', 1, NULL, false, NULL, NULL, 6.50);
INSERT INTO public.star VALUES (8, 'Lalande 21185', 1, NULL, false, NULL, NULL, 8.30);
INSERT INTO public.star VALUES (9, 'Lacaille 9352', 1, NULL, false, NULL, NULL, 10.72);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: jupiter_moons_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.jupiter_moons_moon_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 9, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: jupiter_moons jupiter_moons_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.jupiter_moons
    ADD CONSTRAINT jupiter_moons_name_key UNIQUE (name);


--
-- Name: jupiter_moons jupiter_moons_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.jupiter_moons
    ADD CONSTRAINT jupiter_moons_pkey PRIMARY KEY (jupiter_moons_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


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
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key1 UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: jupiter_moons jupiter_moons_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.jupiter_moons
    ADD CONSTRAINT jupiter_moons_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon moon_in_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_in_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_in_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_in_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_in_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_in_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

