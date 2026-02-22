use healthcare_new;

select * from finance_transactions_json;

-- row_number 

select * from(
select employee_id,transaction_id,
TRIM(LOWER(payment_mode)) as payment_clean,
transaction_date,
ROW_NUMBER() over(
partition by employee_id
order by transaction_date DESC
)as r
from finance_transactions_json)t
where r = 1;

-- rank 
select * from(
select e.employee_id,e.employee_name,
sum(f.amount) as total_earnings,
RANK() over(
order by sum(f.amount) DESC) as earning_rank
from employee_txt e
join finance_transactions_json f on e.employee_id = f.employee_id 
group by e.employee_id,e.employee_name)ranked_date 
where earning_rank <=3;

-- dense_rank 
select employee_id,department,salary,
DENSE_RANK() over(
partition by department
order by salary DESC ) as salary_level
from employee_txt;

UPDATE employee_txt
SET salary = 100000
WHERE employee_id IN (947, 478);


SELECT 
    department,
    SUM(salary) AS total_salary,
    DENSE_RANK() OVER (
        ORDER BY SUM(salary) DESC
    ) AS dept_level
FROM employee_txt
GROUP BY department;

SELECT 
    hospital_name,
    AVG(claim_amount) AS avg_claim,
    DENSE_RANK() OVER (
        ORDER BY AVG(claim_amount) DESC
    ) AS hospital_cost_tier
FROM healthcare_xml
GROUP BY hospital_name;

SELECT 
    MONTH(claim_date) AS claim_month,
    SUM(claim_amount) AS total_month_claim,
    DENSE_RANK() OVER (
        ORDER BY SUM(claim_amount) DESC
    ) AS month_burden_level
FROM healthcare_xml
GROUP BY MONTH(claim_date);





