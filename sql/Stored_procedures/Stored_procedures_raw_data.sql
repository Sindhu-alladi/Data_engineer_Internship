select * from student_master_demo;
DELIMITER //

CREATE PROCEDURE getStudentDetails(IN inputID INT)
BEGIN
    SELECT 
        student_id,
        student_name,
        gender,
        course,
        email,
        phone,
        marks,
        city
    FROM student_master_demo
    WHERE student_id = inputID;
END //

DELIMITER ;

CALL getStudentDetails(2);
 -- ------ 

DELIMITER //

CREATE PROCEDURE countStudentsInCity_1(
    IN inputCity VARCHAR(50),
    OUT totalStudents INT
)
BEGIN
    SELECT COUNT(*) INTO totalStudents
    FROM student_master_demo
    WHERE trim(city) = inputCity;
END //

DELIMITER ;

CALL countStudentsInCity('Hyderabad', @count);
SELECT @count AS total_students_in_hyderabad;

-- ------ 
DELIMITER //

CREATE PROCEDURE getStudentConditional(
    IN inputID INT
)
BEGIN
    IF inputID > 0 THEN
        -- Select the student with the given ID
        SELECT *
        FROM student_master_demo
        WHERE student_id = inputID;
    ELSE
        -- If inputID <= 0, select all students
        SELECT *
        FROM student_master_demo;
    END IF;
END //

DELIMITER ;
CALL getStudentConditional(0);

-- -----
DELIMITER //

CREATE PROCEDURE getStudentsUsingLoop(
    IN maxID INT
)
BEGIN
    DECLARE counter INT DEFAULT 1;

    WHILE counter <= maxID DO
        SELECT *
        FROM student_master_demo
        WHERE student_id = counter;

        SET counter = counter + 1;
    END WHILE;

END //

DELIMITER ;

CALL getStudentsUsingLoop(5);



