--
-- PostgreSQL database dump
--

\restrict vcnltdG8gbBlh0BQmN1DXJj6fVqJdnobY5OA7Np1pPI5TSresfEsUE6A9ZBAYBU

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
4	Linux Administration	1
5	Database Systems	1
6	Linear Algebra	2
7	Statistics	2
8	Physics I	3
9	Cloud Computing	4
10	IT Service Management	4
\.


--
-- Data for Name: enrollments; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.enrollments (student_id, course_id, enrollment_date) FROM stdin;
1	1	2026-06-23
1	2	2026-06-23
2	3	2026-06-23
1	6	2026-06-23
2	2	2026-06-23
3	1	2026-06-23
3	4	2026-06-23
3	7	2026-06-23
4	2	2026-06-23
4	5	2026-06-23
5	1	2026-06-23
5	6	2026-06-23
6	3	2026-06-23
6	4	2026-06-23
7	5	2026-06-23
7	7	2026-06-23
8	2	2026-06-23
8	6	2026-06-23
8	7	2026-06-23
\.


--
-- Data for Name: professors; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.professors (id, name, department) FROM stdin;
1	Dr. Müller	Computer Science
2	Prof. Schneider	Mathematics
3	Dr. Anna Müller	Computer Science
4	Prof. Markus Schneider	Mathematics
5	Dr. Julia Weber	Physics
6	Prof. Thomas Bauer	Business Informatics
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

COPY public.students (id, first_name, last_name, email) FROM stdin;
1	Max	Mustermann	[max@example.com](mailto:max@example.com)
2	Anna	Schmidt	[anna@example.com](mailto:anna@example.com)
3	Max	Mustermann	max.mustermann@uni.local
4	Anna	Schmidt	anna.schmidt@uni.local
5	Leon	Fischer	leon.fischer@uni.local
6	Sophie	Wagner	sophie.wagner@uni.local
7	Lukas	Becker	lukas.becker@uni.local
8	Emma	Hoffmann	emma.hoffmann@uni.local
9	Noah	Keller	noah.keller@uni.local
10	Mia	Wolf	mia.wolf@uni.local
\.


--
-- Name: courses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.courses_id_seq', 10, true);


--
-- Name: professors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.professors_id_seq', 6, true);


--
-- Name: staff_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.staff_id_seq', 4, true);


--
-- Name: students_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.students_id_seq', 10, true);


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
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

GRANT USAGE ON SCHEMA public TO app_user;
GRANT USAGE ON SCHEMA public TO report_user;


--
-- Name: TABLE courses; Type: ACL; Schema: public; Owner: admin
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.courses TO app_user;
GRANT SELECT ON TABLE public.courses TO report_user;
GRANT SELECT ON TABLE public.courses TO readonly;


--
-- Name: TABLE enrollments; Type: ACL; Schema: public; Owner: admin
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.enrollments TO app_user;
GRANT SELECT ON TABLE public.enrollments TO report_user;
GRANT SELECT ON TABLE public.enrollments TO readonly;


--
-- Name: TABLE professors; Type: ACL; Schema: public; Owner: admin
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.professors TO app_user;
GRANT SELECT ON TABLE public.professors TO report_user;
GRANT SELECT ON TABLE public.professors TO readonly;


--
-- Name: TABLE students; Type: ACL; Schema: public; Owner: admin
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.students TO app_user;
GRANT SELECT ON TABLE public.students TO report_user;
GRANT SELECT ON TABLE public.students TO readonly;


--
-- PostgreSQL database dump complete
--

\unrestrict vcnltdG8gbBlh0BQmN1DXJj6fVqJdnobY5OA7Np1pPI5TSresfEsUE6A9ZBAYBU

