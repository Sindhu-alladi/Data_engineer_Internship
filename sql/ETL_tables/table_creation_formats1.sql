use healthcare;

CREATE TABLE healthcare_claims_txt (
  claim_id INT PRIMARY KEY,
  employee_id INT,
  hospital_name VARCHAR(100),
  diagnosis VARCHAR(100),
  treatment_type VARCHAR(50),
  admission_date DATE,
  discharge_date DATE,
  claim_amount INT,
  approved_amount INT,
  claim_status VARCHAR(20),
  claim_date DATE
);

CREATE TABLE healthcare_claims_json (
  claim_id INT PRIMARY KEY,
  employee_id INT,
  hospital_name VARCHAR(100),
  diagnosis VARCHAR(100),
  treatment_type VARCHAR(50),
  admission_date DATE,
  discharge_date DATE,
  claim_amount INT,
  approved_amount INT,
  claim_status VARCHAR(20),
  claim_date DATE
);

CREATE TABLE healthcare_claims_xml (
  claim_id INT PRIMARY KEY,
  employee_id INT,
  hospital_name VARCHAR(100),
  diagnosis VARCHAR(100),
  treatment_type VARCHAR(50),
  admission_date DATE,
  discharge_date DATE,
  claim_amount INT,
  approved_amount INT,
  claim_status VARCHAR(20),
  claim_date DATE
);

CREATE TABLE finance_transactions_txt (
  transaction_id INT PRIMARY KEY,
  employee_id INT,
  transaction_type VARCHAR(50),
  amount INT,
  payment_mode VARCHAR(50),
  bank_name VARCHAR(50),
  account_number VARCHAR(50),
  transaction_date DATE,
  transaction_status VARCHAR(20)
);

CREATE TABLE finance_transactions_json (
  transaction_id INT PRIMARY KEY,
  employee_id INT,
  transaction_type VARCHAR(50),
  amount INT,
  payment_mode VARCHAR(50),
  bank_name VARCHAR(50),
  account_number VARCHAR(50),
  transaction_date DATE,
  transaction_status VARCHAR(20)
);

CREATE TABLE finance_transactions_xml (
  transaction_id INT PRIMARY KEY,
  employee_id INT,
  transaction_type VARCHAR(50),
  amount INT,
  payment_mode VARCHAR(50),
  bank_name VARCHAR(50),
  account_number VARCHAR(50),
  transaction_date DATE,
  transaction_status VARCHAR(20)
);

select count(*) from finance_transactions_xml;
select count(*) from healthcare_claims_json;
select count(*) from finance_transactions_json;

truncate table employee_xml;
select count(*) from employee_xml;

select *from employee_xml;
select *from employee_json;
select * from employee_txt;
drop table employee_xml;
