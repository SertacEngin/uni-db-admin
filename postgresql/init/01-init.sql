CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    student_number VARCHAR(20) UNIQUE NOT NULL, -- Hier ist deine neue Student-ID (Matrikelnummer)
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE professors (
    id SERIAL PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    department VARCHAR(100) NOT NULL
);

CREATE TABLE courses (
    id SERIAL PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    professor_id INTEGER REFERENCES professors(id)
);

CREATE TABLE enrollments (
    student_id INTEGER REFERENCES students(id),
    course_id INTEGER REFERENCES courses(id),
    enrollment_date DATE DEFAULT CURRENT_DATE,
    PRIMARY KEY (student_id, course_id)
);

CREATE TABLE staff (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    position VARCHAR(100) NOT NULL,
    department VARCHAR(100) NOT NULL
);

-- Realistische Professoren (verschiedene Fakultäten)
INSERT INTO professors (name, department) VALUES
('Dr. Müller', 'Computer Science'),
('Prof. Schneider', 'Mathematics'),
('Dr. Wagner', 'Computer Science'),
('Prof. Fischer', 'Electrical Engineering'),
('Dr. Weber', 'Physics');

-- Realistische Studenten mit Matrikelnummern (student_number)
INSERT INTO students (student_number, first_name, last_name, email) VALUES
('20240001', 'Max', 'Mustermann', 'max.mustermann@stud.uni.de'),
('20240002', 'Anna', 'Schmidt', 'anna.schmidt@stud.uni.de'),
('20240003', 'Julian', 'Becker', 'julian.becker@stud.uni.de'),
('20240004', 'Laura', 'Hoffmann', 'laura.hoffmann@stud.uni.de'),
('20240005', 'Jonas', 'Meyer', 'jonas.meyer@stud.uni.de'),
('20240006', 'Sarah', 'Wagner', 'sarah.wagner@stud.uni.de'),
('20240007', 'David', 'Schulz', 'david.schulz@stud.uni.de');

-- Realistische Kurse, verknüpft mit den Professoren
INSERT INTO courses (title, professor_id) VALUES
('Linux Administration', 1),  -- Dr. Müller
('Database Systems', 1),      -- Dr. Müller
('Linear Algebra', 2),        -- Prof. Schneider
('Cloud Computing', 3),       -- Dr. Wagner
('DevOps Foundations', 3),    -- Dr. Wagner
('Automation Systems', 4),    -- Prof. Fischer
('Quantum Mechanics', 5);     -- Dr. Weber

INSERT INTO staff
(first_name,last_name,position,department)
VALUES
('Michael','Braun','System Administrator','IT'),
('Sarah','Neumann','Database Administrator','IT'),
('Daniel','Koch','Registrar','Student Services'),
('Laura','Zimmermann','HR Manager','Human Resources');

-- Realistische Einschreibungen (Enrollments)
-- Jeder Student belegt 2-3 passende Kurse
INSERT INTO enrollments (student_id, course_id) VALUES
(1, 1), (1, 2), (1, 4), -- Max macht Linux, DB und Cloud
(2, 3), (2, 7),         -- Anna macht Mathe und Physik
(3, 1), (3, 5),         -- Julian macht Linux und DevOps
(4, 4), (4, 5),         -- Laura macht Cloud und DevOps
(5, 6), (5, 3),         -- Jonas macht Automation und Mathe
(6, 2), (6, 4),         -- Sarah macht DB und Cloud
(7, 1), (7, 6);         -- David macht Linux und Automation
