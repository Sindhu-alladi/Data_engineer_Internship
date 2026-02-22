-- JOINS 
use healthcare_new;
select * from healthcare_xml;
-- inner join 
with employee_claims as (
select e.employee_id,e.employee_name,e.department,
h.claim_id,h.hospital_name,h.diagnosis,h.claim_amount,
h.approved_amount,h.claim_status
from employee_txt e
INNER JOIN healthcare_xml h
on e.employee_id = h.employee_id
)
select * from employee_claims
where trim(lower(claim_status)) = trim(lower('Approved'))
and approved_amount > 50000;

-- left join 
select e.employee_id,e.employee_name,e.department,
h.claim_id
from employee_txt e 
left join healthcare_xml h
on e.employee_id = h.employee_id
where h.claim_id is NULL;

-- right join 
select e.employee_id,e.employee_name,
h.claim_id,h.claim_amount
from employee_txt e
right join healthcare_xml h
on e.employee_id = h.employee_id ;

-- full join 
select e.employee_id,e.employee_name,h.claim_id
from employee_txt e
left join healthcare_xml h
on e.employee_id = h.employee_id
UNION 
select e.employee_id,e.employee_name,
h.claim_id
from employee_txt e 
right join healthcare_xml h
on e.employee_id = h.employee_id;

select e.employee_id,e.employee_name,h.claim_id
from employee_txt e
left join healthcare_xml h
on e.employee_id = h.employee_id
UNION ALL
select e.employee_id,e.employee_name,
h.claim_id
from employee_txt e 
right join healthcare_xml h
on e.employee_id = h.employee_id;

select e.employee_id,e.employee_name
from employee_txt e 
UNION 
select e.employee_id,e.employee_name
from employee_txt e ;

select employee_id, employee_name, count(*) as duplicate_count
from (
    select employee_id, employee_name from employee_txt
    UNION ALL
    select employee_id, employee_name from employee_txt
) t
group by employee_id, employee_name
having count(*) > 1;


select * from employee_txt;



-- cross join 
select e.employee_name,e.employee_id,
h.claim_id,h.claim_amount
from employee_txt e
cross join healthcare_xml h;

select count(*) as total_rows
from employee_txt e
cross join healthcare_xml h;


-- subselecet
select * from employee_txt where employee_id in(
select employee_id from healthcare_xml 
group by employee_id
having sum(claim_amount) > 100000);

