/*
Question: What are the top paying data analyst jobs?
- Identify the top 10 highest-paying Data Analyst roles that are available remotly
- Focuses on job posting with specified salaries (remove nulls)
- Also Identify the name of the company
*/

SELECT 
job_id,
job_title,
job_location,
job_schedule_type,
company_dim.name AS company_name,
salary_year_avg,
job_posted_date

from job_postings_fact
left join company_dim
on company_dim.company_id= job_postings_fact.company_id
WHERE job_title_short = 'Data Analyst' AND salary_year_avg IS NOT NULL and job_location = 'Anywhere'
ORDER BY salary_year_avg DESC
LIMIT 10;

