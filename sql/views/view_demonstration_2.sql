use healthcare_new;
 select * from employee_txt;
describe employee_txt;

CREATE VIEW IT_Employees AS
SELECT employee_id, employee_name, salary
FROM Employee_txt
WHERE TRIM(Department) = 'IT';

drop view IT_Employees;
 
SELECT * FROM IT_Employees;


/* UPDATE Employee_txt
SET Department = TRIM(Department); */

