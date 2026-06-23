CREATE DATABASE IF NOT EXISTS uni_admin;

USE uni_admin;

CREATE TABLE staff (
id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(100),
last_name VARCHAR(100),
role VARCHAR(100),
department VARCHAR(100)
);

CREATE TABLE salaries (
id INT AUTO_INCREMENT PRIMARY KEY,
staff_id INT,
amount DECIMAL(10,2),
FOREIGN KEY (staff_id) REFERENCES staff(id)
);

INSERT INTO staff (first_name, last_name, role, department)
VALUES
('Michael', 'Braun', 'System Administrator', 'IT'),
('Sarah', 'Neumann', 'DBA', 'IT'),
('Daniel', 'Koch', 'HR Manager', 'HR');

INSERT INTO salaries (staff_id, amount)
VALUES
(1, 5500.00),
(2, 6000.00),
(3, 4500.00);
