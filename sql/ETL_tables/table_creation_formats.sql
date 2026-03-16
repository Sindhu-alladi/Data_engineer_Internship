Create Database Healthcare;
use healthcare;

CREATE TABLE employee_txt (
  employee_id INT PRIMARY KEY,
  employee_name VARCHAR(100),
  gender VARCHAR(10),
  date_of_birth DATE,
  email VARCHAR(100),
  phone VARCHAR(30),
  department VARCHAR(50),
  designation VARCHAR(50),
  city VARCHAR(50),
  state VARCHAR(50),
  join_date DATE,
  salary INT,
  employment_status VARCHAR(20)
);

CREATE TABLE employee_json (
  employee_id INT PRIMARY KEY,
  employee_name VARCHAR(100),
  gender VARCHAR(10),
  date_of_birth DATE,
  email VARCHAR(100),
  phone VARCHAR(30),
  department VARCHAR(50),
  designation VARCHAR(50),
  city VARCHAR(50),
  state VARCHAR(50),
  join_date DATE,
  salary INT,
  employment_status VARCHAR(20)
);

CREATE TABLE employee_xml (
  employee_id INT PRIMARY KEY,
  employee_name VARCHAR(100),
  gender VARCHAR(10),
  date_of_birth DATE,
  email VARCHAR(100),
  phone VARCHAR(30),
  department VARCHAR(50),
  designation VARCHAR(50),
  city VARCHAR(50),
  state VARCHAR(50),
  join_date DATE,
  salary INT,
  employment_status VARCHAR(20)
);