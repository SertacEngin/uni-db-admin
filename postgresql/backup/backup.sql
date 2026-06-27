--
-- PostgreSQL database dump
--

\restrict EXVkNCmCzG7k4MP2IBagClN3kirRuKfudQndmfr4079ROXBqkHaB9elBXKeEQJG

-- Dumped from database version 16.14 (Debian 16.14-1.pgdg13+1)
-- Dumped by pg_dump version 16.14 (Debian 16.14-1.pgdg13+1)

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
-- Name: courses; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.courses (
    id integer NOT NULL,
    title character varying(200) NOT NULL,
    professor_id integer
);


ALTER TABLE public.courses OWNER TO admin;

--
-- Name: courses_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.courses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.courses_id_seq OWNER TO admin;

--
-- Name: courses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.courses_id_seq OWNED BY public.courses.id;


--
-- Name: enrollments; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.enrollments (
    student_id integer NOT NULL,
    course_id integer NOT NULL,
    enrollment_date date DEFAULT CURRENT_DATE
);


ALTER TABLE public.enrollments OWNER TO admin;

--
-- Name: professors; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.professors (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    department character varying(100) NOT NULL
);


ALTER TABLE public.professors OWNER TO admin;

--
-- Name: professors_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.professors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.professors_id_seq OWNER TO admin;

--
-- Name: professors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.professors_id_seq OWNED BY public.professors.id;


--
-- Name: staff; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.staff (
    id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    "position" character varying(100) NOT NULL,
    department character varying(100) NOT NULL
);


ALTER TABLE public.staff OWNER TO admin;

--
-- Name: staff_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.staff_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.staff_id_seq OWNER TO admin;

--
-- Name: staff_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.staff_id_seq OWNED BY public.staff.id;


--
-- Name: students; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.students (
    id integer NOT NULL,
    student_number character varying(20) NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    email character varying(255) NOT NULL
);


ALTER TABLE public.students OWNER TO admin;

--
-- Name: students_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.students_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.students_id_seq OWNER TO admin;

--
-- Name: students_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.students_id_seq OWNED BY public.students.id;


--
-- Name: courses id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.courses ALTER COLUMN id SET DEFAULT nextval('public.courses_id_seq'::regclass);


--
-- Name: professors id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.professors ALTER COLUMN id SET DEFAULT nextval('public.professors_id_seq'::regclass);


--
-- Name: staff id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.staff ALTER COLUMN id SET DEFAULT nextval('public.staff_id_seq'::regclass);


--
-- Name: students id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.students ALTER COLUMN id SET DEFAULT nextval('public.students_id_seq'::regclass);


--
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.courses (id, title, professor_id) FROM stdin;
1	Linux Administration	1
2	Database Systems	1
3	Linear Algebra	2
4	Cloud Computing	3
5	DevOps Foundations	3
6	Automation Systems	4
7	Quantum Mechanics	5
\.


--
-- Data for Name: enrollments; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.enrollments (student_id, course_id, enrollment_date) FROM stdin;
1	1	2026-06-26
1	2	2026-06-26
1	4	2026-06-26
2	3	2026-06-26
2	7	2026-06-26
3	1	2026-06-26
3	5	2026-06-26
4	4	2026-06-26
4	5	2026-06-26
5	6	2026-06-26
5	3	2026-06-26
6	2	2026-06-26
6	4	2026-06-26
7	1	2026-06-26
7	6	2026-06-26
\.


--
-- Data for Name: professors; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.professors (id, name, department) FROM stdin;
1	Dr. Müller	Computer Science
2	Prof. Schneider	Mathematics
3	Dr. Wagner	Computer Science
4	Prof. Fischer	Electrical Engineering
5	Dr. Weber	Physics
\.


--
-- Data for Name: staff; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.staff (id, first_name, last_name, "position", department) FROM stdin;
1	Michael	Braun	System Administrator	IT
2	Sarah	Neumann	Database Administrator	IT
3	Daniel	Koch	Registrar	Student Services
4	Laura	Zimmermann	HR Manager	Human Resources
\.


--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.students (id, student_number, first_name, last_name, email) FROM stdin;
1	20240001	Max	Mustermann	max.mustermann@stud.uni.de
2	20240002	Anna	Schmidt	anna.schmidt@stud.uni.de
3	20240003	Julian	Becker	julian.becker@stud.uni.de
4	20240004	Laura	Hoffmann	laura.hoffmann@stud.uni.de
5	20240005	Jonas	Meyer	jonas.meyer@stud.uni.de
6	20240006	Sarah	Wagner	sarah.wagner@stud.uni.de
7	20240007	David	Schulz	david.schulz@stud.uni.de
8	20260008	Sertac	Engin	sertac.engin@uni.de
\.


--
-- Name: courses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.courses_id_seq', 7, true);


--
-- Name: professors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.professors_id_seq', 5, true);


--
-- Name: staff_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.staff_id_seq', 4, true);


--
-- Name: students_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.students_id_seq', 8, true);


--
-- Name: courses courses_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (id);


--
-- Name: enrollments enrollments_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.enrollments
    ADD CONSTRAINT enrollments_pkey PRIMARY KEY (student_id, course_id);


--
-- Name: professors professors_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.professors
    ADD CONSTRAINT professors_pkey PRIMARY KEY (id);


--
-- Name: staff staff_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_pkey PRIMARY KEY (id);


--
-- Name: students students_email_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_email_key UNIQUE (email);


--
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (id);


--
-- Name: students students_student_number_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_student_number_key UNIQUE (student_number);


--
-- Name: courses courses_professor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_professor_id_fkey FOREIGN KEY (professor_id) REFERENCES public.professors(id);


--
-- Name: enrollments enrollments_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.enrollments
    ADD CONSTRAINT enrollments_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.courses(id);


--
-- Name: enrollments enrollments_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.enrollments
    ADD CONSTRAINT enrollments_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.students(id);


--
-- PostgreSQL database dump complete
--

\unrestrict EXVkNCmCzG7k4MP2IBagClN3kirRuKfudQndmfr4079ROXBqkHaB9elBXKeEQJG

