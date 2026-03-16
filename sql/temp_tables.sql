use healthcare_new;

select * from employee_txt;

create temporary table dept_avg_sal as
select department,avg(salary) as avg_salary
from employee_txt 
group by department;



select e.employee_id,e.employee_name,e.department,e.salary,
d.avg_salary
from employee_txt e
join dept_avg_sal d
on e.department = d.department
where e.salary>d.avg_salary;

-- top 2 highest paid per dept

create temporary table dept_sal_rank as 
select employee_id,employee_name,department,salary,
RANK() over (partition by department order by salary DESC) as sal_rank
from employee_txt;


select * from dept_sal_rank;

select * from dept_sal_rank 
where sal_rank <=2;