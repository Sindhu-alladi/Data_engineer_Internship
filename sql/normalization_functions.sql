CREATE DATABASE student_data;
use student_data;

CREATE TABLE student_master_demo (
  student_id INT,
  student_name VARCHAR(50),
  gender VARCHAR(10),
  course VARCHAR(50),
  email VARCHAR(100),
  phone VARCHAR(25),
  marks VARCHAR(10),
  city VARCHAR(50)
);

INSERT INTO student_master_demo VALUES
(1, ' Ravi ', ' male ', ' Data Science', ' Ravi123@GMAIL.com ', '987-654-3210', ' 85 ', ' Hyderabad'),
(2, 'anita ', 'Female', 'data science ', 'anita@ gmail.com', '987 654 3210', '90', 'hyderabad'),
(3, 'JOHN', ' MALE', ' DATA SCIENCE', ' JOHN.DOE@gmail.com ', '(987)6543210', ' 88', 'HYDERABAD'),
(4, 'Sara ', ' female ', 'AI', ' sara@yahoo.COM ', '9876543210 ', ' 92 ', ' Chennai'),
(5, ' mike', 'Male', ' ai ', ' MIKE@YAHOO.com', ' 987-654-3210 ', ' 95', ' chennai '),
(6, ' Neha ', ' FEMALE ', ' Machine Learning ', ' NEHA@GMAIL.COM ', '912-345-6789', ' 78 ', ' Mumbai'),
(7, 'rohit', ' male', 'machine learning', ' rohit@gmail.COM', '912 345 6789', '82', 'mumbai '),
(8, ' Kiran', 'Male ', ' MACHINE LEARNING', 'KIRAN@ gmail.com ', '(912)3456789', ' 80 ', ' MUMBAI'),
(9, 'Priya ', ' female', ' Big Data ', ' PRIYA@YAHOO.com ', '998-765-4321', ' 88 ', ' Bengaluru'),
(10, 'priya', 'FEMALE ', 'big data', 'priya@yahoo.COM', '998 765 4321', '90', ' bengaluru '),
(11, 'Arjun', ' MALE ', 'Cloud Computing', ' ARJUN@OUTLOOK.com ', '901-234-5678', ' 75', ' Pune'),
(12, ' arjun ', 'male', ' cloud computing ', 'arjun@ outlook.com', '(901)2345678', '78 ', 'pune'),
(13, 'Sita ', ' Female ', 'AI', ' SITA@GMAIL.COM ', '888-111-2222', ' 91 ', ' Delhi'),
(14, ' sita', 'female', ' ai ', 'sita@gmail.com', '888 111 2222', '93', ' delhi ');

-- trim (ltrim,rtrim)--
SELECT student_id, student_name FROM student_master_demo;

SELECT student_id, LTRIM(student_name) AS ltrim_name
FROM student_master_demo;

SELECT student_id,RTRIM(student_name) AS rtrim_name
FROM student_master_demo;

SELECT student_id,TRIM(student_name) AS fully_clean_name
FROM student_master_demo;

SELECT student_name       AS original,
  LTRIM(student_name)     AS ltrimmed,
  RTRIM(student_name)     AS rtrimmed,
  TRIM(student_name)      AS trimmed
FROM student_master_demo;

-- UPPER/LOWER --
SELECT student_id, course, city FROM student_master_demo;

SELECT DISTINCT course FROM student_master_demo;

SELECT student_id,
UPPER(trim(course)) AS normalized_course,
UPPER(trim(city)) AS normalized_city
FROM student_master_demo;

SELECT DISTINCT course AS raw_course,
UPPER(TRIM(course)) AS normalized_course
FROM student_master_demo;

-- distinct --
SELECT DISTINCT
UPPER(TRIM(course)) AS normalized_course
FROM student_master_demo;

-- replace --
SELECT phone FROM student_master_demo;
SELECT
  phone,REPLACE(REPLACE(REPLACE(REPLACE(phone, '-', ''),' ', ''),'(', ''),')', '') AS cleaned_phone
FROM student_master_demo;

-- substring/left/right --
SELECT email FROM student_master_demo;

SELECT email,SUBSTRING(TRIM(email),1,LOCATE('@', TRIM(email)) - 1) 
AS username
FROM student_master_demo;

SELECT student_name,
LEFT(TRIM(student_name), 4) AS short_name
FROM student_master_demo;

SELECT marks,
RIGHT(TRIM(marks), 2) AS last_two_digits
FROM student_master_demo;

-- cast/convert--

SELECT student_id, marks FROM student_master_demo;

SELECT student_id,
CAST(TRIM(marks) AS SIGNED) AS normalized_marks
FROM student_master_demo;

SELECT AVG(CAST(TRIM(marks) AS SIGNED)) AS avg_marks
FROM student_master_demo;

-- ---- 
SELECT
  email,
  SUBSTRING_INDEX(TRIM(email), '@', -1) AS email_domain
FROM student_master_demo;

SELECT
  email,
  INSTR(TRIM(email), '@') AS instr_position,
  LOCATE('@', TRIM(email)) AS locate_position
FROM student_master_demo;

SELECT
  student_name,
  ASCII(LEFT(TRIM(student_name), 1)) AS ascii_value
FROM student_master_demo;

SELECT
  student_id,
  LPAD(student_id, 5, '0') AS padded_student_id
FROM student_master_demo;

SELECT
  student_name,
  COALESCE(TRIM(email), 'Email Not Available') AS email_value
FROM student_master_demo;








