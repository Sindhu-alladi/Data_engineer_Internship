use student_data;
DELIMITER //

CREATE PROCEDURE getStudentDetails_Clean(IN inputID INT)
BEGIN
    SELECT 
        student_id,
        TRIM(student_name)                        AS student_name,
        UPPER(TRIM(gender))                       AS gender,
        UPPER(TRIM(course))                       AS course,
        LOWER(TRIM(email))                        AS email,
        REPLACE(REPLACE(REPLACE(REPLACE(phone,'-',''),' ',''),'(',''),')','') AS phone,
        CAST(TRIM(marks) AS SIGNED)               AS marks,
        UPPER(TRIM(city))                         AS city
    FROM student_master_demo
    WHERE student_id = inputID;
END //

DELIMITER ;

CALL getStudentDetails_Clean(4);

DELIMITER //

CREATE PROCEDURE countStudentsInCity_Clean(
    IN inputCity VARCHAR(50),
    OUT totalStudents INT
)
BEGIN
    SELECT COUNT(*) INTO totalStudents
    FROM student_master_demo
    WHERE UPPER(TRIM(city)) = UPPER(TRIM(inputCity));
END //

DELIMITER ;

CALL countStudentsInCity_Clean('Hyderabad', @count);
SELECT @count AS total_students_in_hyderabad;

DELIMITER //

CREATE PROCEDURE getStudentConditional_Clean(
    IN inputID INT
)
BEGIN
    IF inputID > 0 THEN
        SELECT 
            student_id,
            TRIM(student_name) AS student_name,
            UPPER(TRIM(course)) AS course,
            CAST(TRIM(marks) AS SIGNED) AS marks,
            UPPER(TRIM(city)) AS city
        FROM student_master_demo
        WHERE student_id = inputID;
    ELSE
        SELECT 
            student_id,
            TRIM(student_name) AS student_name,
            UPPER(TRIM(course)) AS course,
            CAST(TRIM(marks) AS SIGNED) AS marks,
            UPPER(TRIM(city)) AS city
        FROM student_master_demo;
    END IF;
END //

DELIMITER ;

CALL getStudentConditional_Clean(0);


