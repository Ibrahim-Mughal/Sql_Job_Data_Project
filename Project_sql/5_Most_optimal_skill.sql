/* 
Question: what are the most optimal skills to learn 
- identify skills in high demand and associated with high avaerage salary for Data Analyst roles
-  
*/

SELECT 
  skills_dim.skill_id,
  skills_dim.skills,
  COUNT(job_postings_fact.job_id) AS demand_count,
  ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
 job_title_short = 'Data Analyst' AND 
 salary_year_avg IS NOT NULL 

GROUP BY                    
  skills_dim.skill_id
HAVING
  COUNT(job_postings_fact.job_id) > 10
ORDER BY 
  avg_salary DESC,
  demand_count DESC
LIMIT 25;
