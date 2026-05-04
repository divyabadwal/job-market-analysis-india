# Job Market Analysis – India (SQL Project)

## Overview
This project explores the Indian data analyst job market using structured SQL analysis.  
The goal is to understand hiring trends, in-demand skills, and possible reasons behind the perceived slowdown in entry-level opportunities.

Instead of jumping directly into dashboards, this project starts with building a solid data foundation — designing schemas, organizing job-related data, and writing queries to extract meaningful insights.

---

## Problem Statement
There is a growing concern that entry-level data analyst roles in India are becoming harder to secure.

This project attempts to answer:
- What skills are most frequently demanded?
- Are companies asking for unrealistic combinations of skills?
- Is there a pattern in experience requirements?
- Are certain roles or locations dominating the market?

---

## Dataset Structure

The database is designed to simulate real-world job listing data.

### Core Tables:
- `job_listings` → Job role, company, location, experience, etc.
- `job_skills` → Skills mapped to each job listing
- `companies` (if applicable)
- `locations` (if applicable)

The schema is structured to support flexible querying and future scaling.

---

## Schema Design

The schema focuses on:
- Normalized structure for better data organization
- Efficient querying using indexing
- Clear relationships between jobs, skills, and companies

You can view the schema here:
👉 `schema.sql`

---

## Key SQL Analysis

Some of the queries explored in this project:

- Top in-demand skills in the job market  
- Frequency of skills across job listings  
- Experience level distribution  
- Skill combinations required by employers  

All queries are available in:
👉 `queries.sql`

---

## Sample Insight

Example:

```sql
SELECT skill_name, COUNT(*) AS frequency
FROM job_skills
GROUP BY skill_name
ORDER BY frequency DESC;
