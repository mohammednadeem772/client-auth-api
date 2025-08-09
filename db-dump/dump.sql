--
-- PostgreSQL database cluster dump
--

-- Started on 2025-08-09 11:31:12

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS;

--
-- User Configurations
--








--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 17.0
-- Dumped by pg_dump version 17.0

-- Started on 2025-08-09 11:31:12

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

-- Completed on 2025-08-09 11:31:13

--
-- PostgreSQL database dump complete
--

--
-- Database "TestDb" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 17.0
-- Dumped by pg_dump version 17.0

-- Started on 2025-08-09 11:31:13

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4839 (class 1262 OID 8742533)
-- Name: TestDb; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "TestDb" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_India.1252';


ALTER DATABASE "TestDb" OWNER TO postgres;

\connect "TestDb"

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

-- Completed on 2025-08-09 11:31:13

--
-- PostgreSQL database dump complete
--

--
-- Database "client-auth" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 17.0
-- Dumped by pg_dump version 17.0

-- Started on 2025-08-09 11:31:13

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4915 (class 1262 OID 8742535)
-- Name: client-auth; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "client-auth" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_India.1252';


ALTER DATABASE "client-auth" OWNER TO postgres;

\connect -reuse-previous=on "dbname='client-auth'"

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 226 (class 1259 OID 8747491)
-- Name: Categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Categories" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Categories" OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 8747490)
-- Name: Categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Categories_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Categories_id_seq" OWNER TO postgres;

--
-- TOC entry 4916 (class 0 OID 0)
-- Dependencies: 225
-- Name: Categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Categories_id_seq" OWNED BY public."Categories".id;


--
-- TOC entry 227 (class 1259 OID 8747497)
-- Name: ClientRole; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ClientRole" (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "clientId" integer NOT NULL,
    "roleId" integer NOT NULL
);


ALTER TABLE public."ClientRole" OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 8747450)
-- Name: Clients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Clients" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "clientId" character varying(255),
    "clientSecret" character varying(255) NOT NULL,
    "isActive" boolean DEFAULT true,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Clients" OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 8747449)
-- Name: Clients_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Clients_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Clients_id_seq" OWNER TO postgres;

--
-- TOC entry 4917 (class 0 OID 0)
-- Dependencies: 217
-- Name: Clients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Clients_id_seq" OWNED BY public."Clients".id;


--
-- TOC entry 222 (class 1259 OID 8747471)
-- Name: Permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Permissions" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Permissions" OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 8747470)
-- Name: Permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Permissions_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Permissions_id_seq" OWNER TO postgres;

--
-- TOC entry 4918 (class 0 OID 0)
-- Dependencies: 221
-- Name: Permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Permissions_id_seq" OWNED BY public."Permissions".id;


--
-- TOC entry 224 (class 1259 OID 8747482)
-- Name: Products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Products" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    price numeric NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Products" OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 8747481)
-- Name: Products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Products_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Products_id_seq" OWNER TO postgres;

--
-- TOC entry 4919 (class 0 OID 0)
-- Dependencies: 223
-- Name: Products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Products_id_seq" OWNED BY public."Products".id;


--
-- TOC entry 228 (class 1259 OID 8747512)
-- Name: RolePermission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."RolePermission" (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "roleId" integer NOT NULL,
    "permissionId" integer NOT NULL
);


ALTER TABLE public."RolePermission" OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 8747462)
-- Name: Roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Roles" (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."Roles" OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 8747461)
-- Name: Roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Roles_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Roles_id_seq" OWNER TO postgres;

--
-- TOC entry 4920 (class 0 OID 0)
-- Dependencies: 219
-- Name: Roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Roles_id_seq" OWNED BY public."Roles".id;


--
-- TOC entry 4728 (class 2604 OID 8747494)
-- Name: Categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Categories" ALTER COLUMN id SET DEFAULT nextval('public."Categories_id_seq"'::regclass);


--
-- TOC entry 4723 (class 2604 OID 8747453)
-- Name: Clients id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Clients" ALTER COLUMN id SET DEFAULT nextval('public."Clients_id_seq"'::regclass);


--
-- TOC entry 4726 (class 2604 OID 8747474)
-- Name: Permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Permissions" ALTER COLUMN id SET DEFAULT nextval('public."Permissions_id_seq"'::regclass);


--
-- TOC entry 4727 (class 2604 OID 8747485)
-- Name: Products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Products" ALTER COLUMN id SET DEFAULT nextval('public."Products_id_seq"'::regclass);


--
-- TOC entry 4725 (class 2604 OID 8747465)
-- Name: Roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Roles" ALTER COLUMN id SET DEFAULT nextval('public."Roles_id_seq"'::regclass);


--
-- TOC entry 4907 (class 0 OID 8747491)
-- Dependencies: 226
-- Data for Name: Categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Categories" (id, name, "createdAt", "updatedAt") FROM stdin;
1	Category 1	2025-08-08 22:56:08.029+05:30	2025-08-08 22:56:08.029+05:30
2	Category 2	2025-08-08 22:56:08.029+05:30	2025-08-08 22:56:08.029+05:30
3	Category 3	2025-08-08 22:56:08.029+05:30	2025-08-08 22:56:08.029+05:30
4	Category 4	2025-08-08 22:56:08.029+05:30	2025-08-08 22:56:08.029+05:30
5	Category 5	2025-08-08 22:56:08.029+05:30	2025-08-08 22:56:08.029+05:30
\.


--
-- TOC entry 4908 (class 0 OID 8747497)
-- Dependencies: 227
-- Data for Name: ClientRole; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ClientRole" ("createdAt", "updatedAt", "clientId", "roleId") FROM stdin;
2025-08-08 22:56:07.395+05:30	2025-08-08 22:56:07.395+05:30	1	1
2025-08-08 22:56:07.465+05:30	2025-08-08 22:56:07.465+05:30	2	1
2025-08-08 22:56:07.533+05:30	2025-08-08 22:56:07.533+05:30	3	2
2025-08-08 22:56:07.601+05:30	2025-08-08 22:56:07.601+05:30	4	2
2025-08-08 22:56:07.67+05:30	2025-08-08 22:56:07.67+05:30	5	3
2025-08-08 22:56:07.739+05:30	2025-08-08 22:56:07.739+05:30	6	3
2025-08-08 22:56:07.807+05:30	2025-08-08 22:56:07.807+05:30	7	5
2025-08-08 22:56:07.88+05:30	2025-08-08 22:56:07.88+05:30	8	4
2025-08-08 22:56:07.948+05:30	2025-08-08 22:56:07.948+05:30	9	6
2025-08-08 22:56:08.024+05:30	2025-08-08 22:56:08.024+05:30	10	7
\.


--
-- TOC entry 4899 (class 0 OID 8747450)
-- Dependencies: 218
-- Data for Name: Clients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Clients" (id, name, "clientId", "clientSecret", "isActive", "createdAt", "updatedAt") FROM stdin;
1	Admin Client 1	admin1	$2b$10$JjIZUxVzzQCBOSu6ld/ZKOtXCnr//Xa6ZA/rIAT3GcVkalXQt6YAC	t	2025-08-08 22:56:07.389+05:30	2025-08-08 22:56:07.389+05:30
2	Admin Client 2	admin2	$2b$10$S/dpLvtqoSPJXoGYwYDBXO6vMBStigpuOZrBMtq3HRzE33RBTuJN.	t	2025-08-08 22:56:07.46+05:30	2025-08-08 22:56:07.46+05:30
3	RW Client 1	rw1	$2b$10$rF/giMXZ5BbRI.qJOEbDbOo7DXmZ9cPYKlH76Mdnl/jsbeQhptG7a	t	2025-08-08 22:56:07.53+05:30	2025-08-08 22:56:07.53+05:30
4	RW Client 2	rw2	$2b$10$VtK1hXiDjaKeVteRrw5a5OrD4ixv.XkJGxanGOZ1sOWLAMhijEKFu	t	2025-08-08 22:56:07.597+05:30	2025-08-08 22:56:07.597+05:30
5	UD Client 1	ud1	$2b$10$TcECErP29S8k2FHWvSLcNu69jQuEnJi7/8UdBVpktnFT/PRNbm/Z2	t	2025-08-08 22:56:07.666+05:30	2025-08-08 22:56:07.666+05:30
6	UD Client 2	ud2	$2b$10$GXz2rXablshZTYwDYJ7qUelXV0v13Omaxqn/z/N3C8SmhzM.Spffa	t	2025-08-08 22:56:07.735+05:30	2025-08-08 22:56:07.735+05:30
7	Write Client	write1	$2b$10$w7uhwqzI02NRlCwtstJbOe6PviZuMI6FYHtlWgJdW4PXAvnBAZY0K	t	2025-08-08 22:56:07.805+05:30	2025-08-08 22:56:07.805+05:30
8	Read Client	read1	$2b$10$kG8Eoc/1I78Qr0OaU6FCiebrk.mYdz8bZ7dJsj9Uhhpv6WlGpmuzG	t	2025-08-08 22:56:07.876+05:30	2025-08-08 22:56:07.876+05:30
9	Update Client	update1	$2b$10$eSE4PbhEmpuc/dSBtFNZ1ui6TmPXqIGHKOBqvSaEZ6VE8Qz83Mwvq	t	2025-08-08 22:56:07.945+05:30	2025-08-08 22:56:07.945+05:30
10	Delete Client	delete1	$2b$10$jOS2HkwS3y86oDqN0w4JZeAgPim2/2F.8bL8yK/Wuh3R/ot6QBgzS	t	2025-08-08 22:56:08.019+05:30	2025-08-08 22:56:08.019+05:30
\.


--
-- TOC entry 4903 (class 0 OID 8747471)
-- Dependencies: 222
-- Data for Name: Permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Permissions" (id, name, description, "createdAt", "updatedAt") FROM stdin;
1	read_product	Read products	2025-08-08 22:56:07.298+05:30	2025-08-08 22:56:07.298+05:30
2	create_product	Create products	2025-08-08 22:56:07.298+05:30	2025-08-08 22:56:07.298+05:30
3	update_product	Update products	2025-08-08 22:56:07.298+05:30	2025-08-08 22:56:07.298+05:30
4	delete_product	Delete products	2025-08-08 22:56:07.298+05:30	2025-08-08 22:56:07.298+05:30
5	read_category	Read categories	2025-08-08 22:56:07.298+05:30	2025-08-08 22:56:07.298+05:30
6	create_category	Create categories	2025-08-08 22:56:07.298+05:30	2025-08-08 22:56:07.298+05:30
7	update_category	Update categories	2025-08-08 22:56:07.298+05:30	2025-08-08 22:56:07.298+05:30
8	delete_category	Delete categories	2025-08-08 22:56:07.298+05:30	2025-08-08 22:56:07.298+05:30
\.


--
-- TOC entry 4905 (class 0 OID 8747482)
-- Dependencies: 224
-- Data for Name: Products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Products" (id, name, price, "createdAt", "updatedAt") FROM stdin;
1	Product 1	10.99	2025-08-08 22:56:08.026+05:30	2025-08-08 22:56:08.026+05:30
2	Product 2	19.99	2025-08-08 22:56:08.026+05:30	2025-08-08 22:56:08.026+05:30
3	Product 3	29.99	2025-08-08 22:56:08.026+05:30	2025-08-08 22:56:08.026+05:30
4	Product 4	39.99	2025-08-08 22:56:08.026+05:30	2025-08-08 22:56:08.026+05:30
5	Product 5	49.99	2025-08-08 22:56:08.026+05:30	2025-08-08 22:56:08.026+05:30
6	New Product	9.99	2025-08-08 22:59:29.843+05:30	2025-08-08 22:59:29.843+05:30
\.


--
-- TOC entry 4909 (class 0 OID 8747512)
-- Dependencies: 228
-- Data for Name: RolePermission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."RolePermission" ("createdAt", "updatedAt", "roleId", "permissionId") FROM stdin;
2025-08-08 22:56:07.309+05:30	2025-08-08 22:56:07.309+05:30	1	1
2025-08-08 22:56:07.309+05:30	2025-08-08 22:56:07.309+05:30	1	2
2025-08-08 22:56:07.309+05:30	2025-08-08 22:56:07.309+05:30	1	3
2025-08-08 22:56:07.309+05:30	2025-08-08 22:56:07.309+05:30	1	4
2025-08-08 22:56:07.309+05:30	2025-08-08 22:56:07.309+05:30	1	5
2025-08-08 22:56:07.309+05:30	2025-08-08 22:56:07.309+05:30	1	6
2025-08-08 22:56:07.309+05:30	2025-08-08 22:56:07.309+05:30	1	7
2025-08-08 22:56:07.309+05:30	2025-08-08 22:56:07.309+05:30	1	8
2025-08-08 22:56:07.314+05:30	2025-08-08 22:56:07.314+05:30	2	1
2025-08-08 22:56:07.314+05:30	2025-08-08 22:56:07.314+05:30	2	2
2025-08-08 22:56:07.314+05:30	2025-08-08 22:56:07.314+05:30	2	5
2025-08-08 22:56:07.314+05:30	2025-08-08 22:56:07.314+05:30	2	6
2025-08-08 22:56:07.316+05:30	2025-08-08 22:56:07.316+05:30	3	3
2025-08-08 22:56:07.316+05:30	2025-08-08 22:56:07.316+05:30	3	4
2025-08-08 22:56:07.316+05:30	2025-08-08 22:56:07.316+05:30	3	7
2025-08-08 22:56:07.316+05:30	2025-08-08 22:56:07.316+05:30	3	8
2025-08-08 22:56:07.318+05:30	2025-08-08 22:56:07.318+05:30	4	1
2025-08-08 22:56:07.318+05:30	2025-08-08 22:56:07.318+05:30	4	5
2025-08-08 22:56:07.319+05:30	2025-08-08 22:56:07.319+05:30	5	2
2025-08-08 22:56:07.319+05:30	2025-08-08 22:56:07.319+05:30	5	6
2025-08-08 22:56:07.321+05:30	2025-08-08 22:56:07.321+05:30	6	3
2025-08-08 22:56:07.321+05:30	2025-08-08 22:56:07.321+05:30	6	7
2025-08-08 22:56:07.322+05:30	2025-08-08 22:56:07.322+05:30	7	4
2025-08-08 22:56:07.322+05:30	2025-08-08 22:56:07.322+05:30	7	8
\.


--
-- TOC entry 4901 (class 0 OID 8747462)
-- Dependencies: 220
-- Data for Name: Roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Roles" (id, name, "createdAt", "updatedAt") FROM stdin;
1	admin	2025-08-08 22:56:07.286+05:30	2025-08-08 22:56:07.286+05:30
2	read_write	2025-08-08 22:56:07.286+05:30	2025-08-08 22:56:07.286+05:30
3	update_delete	2025-08-08 22:56:07.286+05:30	2025-08-08 22:56:07.286+05:30
4	read	2025-08-08 22:56:07.286+05:30	2025-08-08 22:56:07.286+05:30
5	write	2025-08-08 22:56:07.286+05:30	2025-08-08 22:56:07.286+05:30
6	update	2025-08-08 22:56:07.286+05:30	2025-08-08 22:56:07.286+05:30
7	delete	2025-08-08 22:56:07.286+05:30	2025-08-08 22:56:07.286+05:30
\.


--
-- TOC entry 4921 (class 0 OID 0)
-- Dependencies: 225
-- Name: Categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Categories_id_seq"', 5, true);


--
-- TOC entry 4922 (class 0 OID 0)
-- Dependencies: 217
-- Name: Clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Clients_id_seq"', 10, true);


--
-- TOC entry 4923 (class 0 OID 0)
-- Dependencies: 221
-- Name: Permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Permissions_id_seq"', 8, true);


--
-- TOC entry 4924 (class 0 OID 0)
-- Dependencies: 223
-- Name: Products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Products_id_seq"', 6, true);


--
-- TOC entry 4925 (class 0 OID 0)
-- Dependencies: 219
-- Name: Roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Roles_id_seq"', 7, true);


--
-- TOC entry 4744 (class 2606 OID 8747496)
-- Name: Categories Categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Categories"
    ADD CONSTRAINT "Categories_pkey" PRIMARY KEY (id);


--
-- TOC entry 4746 (class 2606 OID 8747501)
-- Name: ClientRole ClientRole_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ClientRole"
    ADD CONSTRAINT "ClientRole_pkey" PRIMARY KEY ("clientId", "roleId");


--
-- TOC entry 4730 (class 2606 OID 8747460)
-- Name: Clients Clients_clientId_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Clients"
    ADD CONSTRAINT "Clients_clientId_key" UNIQUE ("clientId");


--
-- TOC entry 4732 (class 2606 OID 8747458)
-- Name: Clients Clients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Clients"
    ADD CONSTRAINT "Clients_pkey" PRIMARY KEY (id);


--
-- TOC entry 4738 (class 2606 OID 8747480)
-- Name: Permissions Permissions_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Permissions"
    ADD CONSTRAINT "Permissions_name_key" UNIQUE (name);


--
-- TOC entry 4740 (class 2606 OID 8747478)
-- Name: Permissions Permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Permissions"
    ADD CONSTRAINT "Permissions_pkey" PRIMARY KEY (id);


--
-- TOC entry 4742 (class 2606 OID 8747489)
-- Name: Products Products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "Products_pkey" PRIMARY KEY (id);


--
-- TOC entry 4748 (class 2606 OID 8747516)
-- Name: RolePermission RolePermission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RolePermission"
    ADD CONSTRAINT "RolePermission_pkey" PRIMARY KEY ("roleId", "permissionId");


--
-- TOC entry 4734 (class 2606 OID 8747469)
-- Name: Roles Roles_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "Roles_name_key" UNIQUE (name);


--
-- TOC entry 4736 (class 2606 OID 8747467)
-- Name: Roles Roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "Roles_pkey" PRIMARY KEY (id);


--
-- TOC entry 4749 (class 2606 OID 8747502)
-- Name: ClientRole ClientRole_clientId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ClientRole"
    ADD CONSTRAINT "ClientRole_clientId_fkey" FOREIGN KEY ("clientId") REFERENCES public."Clients"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4750 (class 2606 OID 8747507)
-- Name: ClientRole ClientRole_roleId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ClientRole"
    ADD CONSTRAINT "ClientRole_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES public."Roles"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4751 (class 2606 OID 8747522)
-- Name: RolePermission RolePermission_permissionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RolePermission"
    ADD CONSTRAINT "RolePermission_permissionId_fkey" FOREIGN KEY ("permissionId") REFERENCES public."Permissions"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4752 (class 2606 OID 8747517)
-- Name: RolePermission RolePermission_roleId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RolePermission"
    ADD CONSTRAINT "RolePermission_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES public."Roles"(id) ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2025-08-09 11:31:13

--
-- PostgreSQL database dump complete
--

-- Completed on 2025-08-09 11:31:13

--
-- PostgreSQL database cluster dump complete
--

