/*
Question: What types of job are avalible in the job market?
-- get the types od job and total job available in the job market
-- get jobs where the salary is specified
*/

SELECT
 job_title_short,
 count(job_id) AS total_jobs
 from 
 job_postings_fact
 WHERE 
 salary_year_avg is NOT NULL
 GROUP BY 
 job_title_short
 ORDER BY 
 total_jobs DESC


 