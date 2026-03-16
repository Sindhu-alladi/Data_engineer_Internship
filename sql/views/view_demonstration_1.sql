use healthcare_new;
 select * from employee_txt;
describe employee_txt;
describe healthcare_claims_xml;
 
CREATE VIEW IT_Employees AS
SELECT employee_id, employee_name, salary
FROM Employee_txt
WHERE TRIM(Department) = 'IT';

drop view IT_Employees;
 
SELECT * FROM IT_Employees;
select * from employee_txt;
CREATE VIEW Employee_Healthcare_View AS
SELECT e.employee_name, h.hospital_name
FROM Employee_txt e
JOIN healthcare_claims_xml h
ON e.employee_id = h.employee_id;
 
select * from Employee_Healthcare_View;