📊 Internship Work Summary – ETL, SQL & Data Engineering
📌 Overview

This repository documents the work, learning outcomes, and hands-on implementations I completed during my internship.
The primary focus areas were:

ETL & Data Engineering fundamentals

SQL & Database Management

Workflow orchestration and automation

The internship emphasized practical implementation, not just theory, with real datasets, transformations, validations, and database integrations.

🛠️ Technologies & Tools Covered

ETL Concepts – ETL vs ELT

Pentaho Data Integration (PDI)

Apache Airflow (Basics)

Dagster (Basics)

MySQL

## ETL & Data Engineering

1. Understanding ETL vs ELT

Learned the difference between ETL (Extract → Transform → Load) and ELT (Extract → Load → Transform).

Understood real-world use cases and performance considerations.

Identified when to use ETL vs ELT based on data volume and system architecture.

2. Exploring ETL Tools

Studied different ETL tools and their use cases.

Practiced hands-on implementations using:

Pentaho Data Integration

Apache Airflow (workflow orchestration basics)

Dagster (pipeline concepts basics)

## Pentaho – ETL Implementation

🔹 Data Sources
Kaggle datasets
Custom-generated CSV files

🔹 File Formats Used

CSV

TXT

JSON

XML

📌 Pentaho Tasks Performed
✅ Task 1: CSV File Generation

Generated CSV datasets for:

Employee

Healthcare

Finance

✅ Task 2: Single Transformation – Multiple Outputs

Converted CSV files into TXT, JSON, and XML formats.

Implemented transformations in a single Pentaho transformation.

Understood and documented each transformation step.

✅ Task 3: Multiple Transformations + Job Creation

Created separate transformations for:

CSV → TXT

CSV → JSON

CSV → XML

Built a Pentaho Job to orchestrate all transformations.

Implemented error handling:

If transformation fails → error message stored in an error folder

Successful transformations routed correctly

✅ Task 4: File to Database Table

Loaded:

TXT → MySQL table

JSON → MySQL table

XML → MySQL table

✅ Task 5: End-to-End ETL with Notification

Employee → TXT

Finance → JSON

Healthcare → XML

Loaded transformed data into MySQL tables

Configured success email notification for successful job execution

✅ Task 6: Pentaho Parameters & Scheduling

Implemented Pentaho parameters

Learned job scheduling concepts

✅ Task 7: Table Mapping

Mapped Employee table → Patient table

Implemented transformations using Pentaho mapping steps

## MySQL & SQL Practice

1. SQL Fundamentals

Practiced:

DDL (CREATE, ALTER, DROP)

DML (INSERT, UPDATE, DELETE)

DCL (GRANT, REVOKE)

TCL (COMMIT, ROLLBACK)

Worked with database constraints

2. Sakila Database

Explored Sakila sample database

Demonstrated DDL, DML, DCL, and TCL commands using real tables

3. EER Modeling – Healthcare Database

Designed an Enhanced Entity Relationship (EER) diagram for:

Patients ──< Appointments >── Doctors ──< Departments
│ │
│ ├── Diagnoses
│ ├── Prescriptions ── Medications
│ ├── Lab Tests
│ └── Billing
│
└── Insurance

4. Data Ingestion

Ingested data from Employee table into Patient table

5. Advanced SQL Topics

Views

Stored Procedures

Data Normalization Functions

Raw → Cleaned Data Transformation

Deduplication using:

CTEs

Ordinal Positions

Information Schema

6. Query Optimization & Analysis

EXISTS, NOT EXISTS, IN, NOT IN

Window Functions

Indexing

Joins:

Inner Join

Left Join

Right Join

Full Join

Cross Join

Self Join

Subqueries vs Joins

## Conclusion

This internship provided a solid foundation in data engineering, covering:

ETL concepts and tools

End-to-end data transformations

Database design and SQL optimization
