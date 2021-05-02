-- 2. SQL DATABASE

-- Complete the following task:

-- Create a new database called "School" this database should have two tables: teachers and students.

-- The students table should have columns for student_id, first_name,last_name, homeroom_number, 
--phone,email, and graduation year.

-- The teachers table should have columns for teacher_id, first_name, last_name,
--homeroom_number, department, email, and phone.
-- The constraints are mostly up to you, but your table constraints do have to consider the following:
--      We must have a phone number to contact students in case of an emergency.
--      We must have ids as the primary key of the tables
--     Phone numbers and emails must be unique to the individual.
CREATE TABLE teachers(
	teacher_id SERIAL PRIMARY KEY,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	homeroom_number INT, 
	department VARCHAR(30),
	email VARCHAR(40) UNIQUE, 
	phone VARCHAR UNIQUE NOT NULL
);
CREATE TABLE students(
	student_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	homeroom_number integer,
	phone VARCHAR(200) UNIQUE NOT NULL,
	email VARCHAR(50) UNIQUE,
	graduation_year INTEGER
);
SELECT * FROM students;
--Once you've made the tables, insert a student named Mark Watney (student_id=1) who 
--has a phone number of 777-555-1234 and doesn't have an email. He graduates in 2035 
--and has 5 as a homeroom number.
INSERT INTO students(student_id,first_name ,last_name,phone,graduation_year,homeroom_number)
VALUES (1,'Mark','Watney','777-555-1234',2035,5);
SELECT *FROM students;

--Then insert a teacher names Jonas Salk (teacher_id = 1) who as a homeroom number of 5 
--and is from the Biology department. His contact info is: jsalk@school.org
--and a phone number of 777-555-4321.
INSERT INTO teachers(teacher_id, first_name, last_name, homeroom_number, department, email, phone)
VALUES (1, 'Jonas', 'Salk', 5, 'Biology', 'jsalk@school.org', '777-555-4321');
ALTER TABLE teachers DROP COLUMN phone  ;
SELECT *FROM teachers;
ALTER TABLE teachers ADD COLUMN phone VARCHAR(50);
INSERT INTO teachers(teacher_id, first_name, last_name, homeroom_number, department, email, phone)
VALUES (1, 'Jonas', 'Salk', 5, 'Biology', 'jsalk@school.org', '777-555-4321');
SELECT *FROM teachers;
