/*
What are the   top paying jobs?
- what are the specific skills reqiored for this role
- why?  ti provides a detailde look at which high paying jobs demand certain skills,
helping job seeketrs understand which skills to develop that allign top salaries 
*/

WITH top_paying_jobs AS (
  SELECT 
    job_id,
    job_title,
    company_dim.name AS company_name,
    job_location,
    salary_year_avg
  FROM job_postings_fact
  LEFT JOIN company_dim 
    ON job_postings_fact.company_id = company_dim.company_id
  WHERE salary_year_avg IS NOT NULL  And job_title_short = 'Data Analyst'
  ORDER BY salary_year_avg DESC
  LIMIT 10
)

SELECT 
  top_paying_jobs.*,
  skills_dim.skills
FROM top_paying_jobs

INNER JOIN skills_job_dim  
  ON top_paying_jobs.job_id = skills_job_dim.job_id 
INNER JOIN skills_dim 
  ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY salary_year_avg DESC;