# Job Market Analysis – India (SQL Project)

## Overview
This project explores the structure of the Indian data analyst job market using SQL.

The focus is not just on analysis, but on building a strong data foundation — designing a schema that can represent job listings, skills, and hiring patterns in a structured way.

This is part of a larger goal: to understand why entry-level data analyst roles feel increasingly competitive and constrained.

---

## Problem Statement
There is a noticeable gap between the number of people learning data analytics and the number of entry-level opportunities available.

This project attempts to explore:

- Which skills are most in demand?
- Do job postings require overlapping or unrealistic skill sets?
- What experience levels are companies actually asking for?
- Are certain roles or locations dominating hiring?

---

## Data Model

The database is designed to simulate real-world job listing data with a focus on flexibility and scalability.

### Core Tables:
- `job_listings` → job role, company, location, experience required  
- `job_skills` → mapping between jobs and required skills  
- (optional) `companies`, `locations` for normalization  

### Design Considerations:
- Normalized structure to reduce redundancy  
- Ability to handle many-to-many relationships (jobs ↔ skills)  
- Query efficiency using indexing  

Schema file: [job_market_schema.sql](./job_market_schema.sql)

---

## SQL Analysis

This project uses SQL to explore patterns such as:

- Most in-demand skills across job listings  
- Frequency distribution of required skills  
- Experience requirements across roles  
- Common skill combinations expected by employers  

Queries available in: [analysis_queries.sql](.analysis_queries.sql)

---

## Key Insights (Initial Findings)

- SQL appears in majority of job listings, making it a core requirement across all experience levels  
- Entry-level roles (0–2 years) form a smaller portion of total listings, indicating higher competition for freshers  
- Skills like Python and Power BI frequently co-occur, suggesting expectation of both analysis and visualization skills  

---

## How to Use

1. Run the schema file to create the database:
   - [job_market_schema.sql](./job_market_schema.sql)

2. Run the queries file to perform analysis:
   - [analysis_queries.sql](./analysis_queries.sql)

## Example Exploration

```sql
SELECT skill_name, COUNT(*) AS frequency
FROM job_skills
GROUP BY skill_name
ORDER BY frequency DESC;
