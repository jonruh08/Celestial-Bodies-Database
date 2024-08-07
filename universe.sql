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
    name character varying(30) NOT NULL,
    galaxy_type_id integer,
    diameter_in_ly integer,
    constellation character varying(30),
    solar_mass numeric,
    min_stars_in_billion integer,
    max_stars_in_billion integer
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
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_type (
    galaxy_type_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text
);


ALTER TABLE public.galaxy_type OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_type_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_type_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_type_galaxy_type_id_seq OWNED BY public.galaxy_type.galaxy_type_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    earth_mass numeric,
    earth_radius numeric,
    planet_id integer NOT NULL,
    regular_satellite boolean
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
    star_id integer,
    has_life boolean,
    name character varying(30) NOT NULL,
    mean_radius_in_km numeric
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
    galaxy_id integer,
    name character varying(30) NOT NULL,
    solar_mass numeric,
    solar_radius numeric,
    age_in_million_years numeric,
    solar_luminosity numeric
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
-- Name: galaxy_type galaxy_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type ALTER COLUMN galaxy_type_id SET DEFAULT nextval('public.galaxy_type_galaxy_type_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 2, 87400, 'Sagittarius', 1150000000000, 100, 400);
INSERT INTO public.galaxy VALUES (2, 'Large Magellanic Cloud', 3, 32200, 'Dorado/Mensa', 138000000000, 20, 20);
INSERT INTO public.galaxy VALUES (3, 'Andromeda Galaxy', 2, 152000, 'Andromada', 1500000000000, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'Small Magellanic Cloud', 3, 18900, 'Tucana and Hydrus', 7000000000, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool Galaxy', 2, 76900, 'Canes Venatici', 160000000000, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 1, 60000, 'Centaurus', 55000000, NULL, NULL);


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_type VALUES (1, 'elliptical', 'Ellipticals, which account for about one-third of galaxies observed, vary from nearly circular to very elongated. They possess comparatively little gas and dust, contain older stars and are not actively forming stars anymore. The largest and rarest of these, called giant ellipticals, are about 300,000 light-years across. Astronomers theorize that these are formed by the mergers of smaller galaxies. Much more common are dwarf ellipticals, which are only a few thousand light-years wide.');
INSERT INTO public.galaxy_type VALUES (2, 'spiral', 'Spiral galaxies appear as flat, blue-white disks of stars, gas and dust with yellowish bulges in their centers. These galaxies are divided into two groups: normal spirals and barred spirals. In barred spirals, the bar of stars runs through the central bulge. The arms of barred spirals usually start at the end of the bar instead of from the bulge. Spirals are actively forming stars and comprise a large fraction of all the galaxies in the local universe.');
INSERT INTO public.galaxy_type VALUES (3, 'irregular', 'Irregular galaxies, which have very little dust, are neither disk-like nor elliptical. Astronomers often see irregular galaxies as they peer deeply into the universe, which is equivalent to looking back in time. These galaxies are abundant in the early universe, before spirals and ellipticals developed.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (9, 'Helike', NULL, NULL, 5, NULL);
INSERT INTO public.moon VALUES (10, 'Enceladus', 0.000018, 0.0395, 6, NULL);
INSERT INTO public.moon VALUES (1, 'Moon', 0.0123, 0.2727, 1, true);
INSERT INTO public.moon VALUES (2, 'Ganymede', 0.025, 0.413, 5, true);
INSERT INTO public.moon VALUES (3, 'Europa', 0.008, 0.245, 5, true);
INSERT INTO public.moon VALUES (4, 'Callisto', 0.018, 0.378, 5, true);
INSERT INTO public.moon VALUES (5, 'Thebe', NULL, NULL, 5, true);
INSERT INTO public.moon VALUES (6, 'Eirene', NULL, NULL, 5, false);
INSERT INTO public.moon VALUES (7, 'Cyllene', NULL, NULL, 5, false);
INSERT INTO public.moon VALUES (8, 'Aoede', NULL, NULL, 5, true);
INSERT INTO public.moon VALUES (11, 'Io', 0.015, 0.28592, 5, true);
INSERT INTO public.moon VALUES (12, 'Ersa', NULL, NULL, 5, false);
INSERT INTO public.moon VALUES (13, 'Methone', NULL, NULL, 6, true);
INSERT INTO public.moon VALUES (14, 'Hati', NULL, NULL, 6, true);
INSERT INTO public.moon VALUES (15, 'Herse', NULL, NULL, 5, true);
INSERT INTO public.moon VALUES (16, 'Eukelade', NULL, NULL, 5, false);
INSERT INTO public.moon VALUES (17, 'Iocaste', NULL, NULL, 5, false);
INSERT INTO public.moon VALUES (18, 'Erriapus', NULL, NULL, 6, false);
INSERT INTO public.moon VALUES (19, 'Siarnaq', NULL, NULL, 6, false);
INSERT INTO public.moon VALUES (20, 'Themisto', NULL, NULL, 5, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, true, 'Earth', 6371.0);
INSERT INTO public.planet VALUES (2, 1, false, 'Mercury', 2439.7);
INSERT INTO public.planet VALUES (3, 1, false, 'Venus', 6051.8);
INSERT INTO public.planet VALUES (4, 1, false, 'Mars', 3389.5);
INSERT INTO public.planet VALUES (5, 1, false, 'Jupiter', 69911);
INSERT INTO public.planet VALUES (6, 1, false, 'Saturn', 58232);
INSERT INTO public.planet VALUES (7, 1, false, 'Neptune', 24622);
INSERT INTO public.planet VALUES (8, 1, false, 'Uranus', 25362);
INSERT INTO public.planet VALUES (9, 7, NULL, 'Proxima Centauri d', 5166.3);
INSERT INTO public.planet VALUES (10, 7, NULL, 'Proxima Centauri b', 5995.4);
INSERT INTO public.planet VALUES (11, 8, NULL, 'Epsilon Eridani b', 4847.4);
INSERT INTO public.planet VALUES (12, 9, NULL, 'Gliese 367 b', 4458.3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sun', 1, 1, 4600, 1);
INSERT INTO public.star VALUES (2, 1, 'Antares', 11, 680, 15, 759000);
INSERT INTO public.star VALUES (3, 1, 'Betelgeuse', 14, 640, 8, 65000);
INSERT INTO public.star VALUES (4, 1, 'KW Sagittarii', 20, 1009, NULL, 175000);
INSERT INTO public.star VALUES (5, 1, 'VV Cephei', 18.2, 779, 25, 116000);
INSERT INTO public.star VALUES (6, 1, 'Mu Cephei', 25, 972, 10.0, 269000);
INSERT INTO public.star VALUES (7, 1, 'Proxima Centauri', 0.1221, 0.1542, NULL, NULL);
INSERT INTO public.star VALUES (8, 1, 'Epsilon Eridani', 0.82, 0.735, NULL, NULL);
INSERT INTO public.star VALUES (9, 1, 'Gliese 367', 0.454, 0.457, NULL, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_type_galaxy_type_id_seq', 3, true);


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
-- Name: galaxy_type galaxy_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_name_key UNIQUE (name);


--
-- Name: galaxy_type galaxy_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_pkey PRIMARY KEY (galaxy_type_id);


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
-- Name: galaxy galaxy_galaxy_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_type_id_fkey FOREIGN KEY (galaxy_type_id) REFERENCES public.galaxy_type(galaxy_type_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

