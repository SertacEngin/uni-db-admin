CREATE TABLE students (
id SERIAL PRIMARY KEY,
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

INSERT INTO professors (name, department)
VALUES
('Dr. Müller', 'Computer Science'),
('Prof. Schneider', 'Mathematics');

INSERT INTO students (first_name, last_name, email)
VALUES
('Max', 'Mustermann', '[max@example.com](mailto:max@example.com)'),
('Anna', 'Schmidt', '[anna@example.com](mailto:anna@example.com)');

INSERT INTO courses (title, professor_id)
VALUES
('Linux Administration', 1),
('Database Systems', 1),
('Linear Algebra', 2);

INSERT INTO enrollments (student_id, course_id)
VALUES
(1,1),
(1,2),
(2,3);
