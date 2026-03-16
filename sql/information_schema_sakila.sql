use sakila;

-- tables present in the database 
select table_name,table_type from information_schema.tables
where table_schema = 'sakila';

-- coloumns of a specific table 
select column_name,data_type,column_key
from information_schema.columns
where table_schema = 'sakila' and table_name = 'film';

-- key_coloumn_usage
select column_name,constraint_name 
from information_schema.key_column_usage
where table_name = 'film' and constraint_name = 'PRIMARY';

-- foreign keys
select table_name,column_name,referenced_table_name,referenced_column_name
from information_schema.key_column_usage
where table_schema = 'sakila' and referenced_table_name is NOT NULL;

-- key constraints
select table_name,constraint_name,constraint_type 
from information_schema.table_constraints
where table_schema = 'sakila';

-- unique keys 
select t.table_name,k.column_name
from information_schema.table_constraints t
join information_schema.key_column_usage k
on t.constraint_name = k.constraint_name
where t.table_schema = 'sakila' and t.constraint_type = 'unique';

-- views
select table_name 
from information_schema.views
where table_schema = 'sakila';

-- stored procedures 
select routine_name,routine_type
from information_schema.routines
where routine_schema = 'sakila';

-- privileges
select table_name,privilege_type
from information_schema.table_privileges
where table_schema = 'sakila';

select * from  information_schema.schema_privileges
where table_schema = 'sakila';

-- summary view
SELECT t.table_name,c.constraint_type,t.column_name,t.referenced_table_name,t.referenced_column_name
from information_schema.key_column_usage t
join information_schema.table_constraints c 
using(constraint_name,table_schema,table_name)
where t.table_schema = 'sakila'
order by t.table_name,c.constraint_type


