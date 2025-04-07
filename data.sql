WITH company_job_count AS (
SELECT 
 company_id,
 Count(*) AS total_jobs
 FROM  job_postings_fact 

GROUP BY company_id
)

SELECT company_dim.name As company_name,
company_job_count.total_jobs,
CASE
WHEN total_jobs > 50 then 'high'
 When total_jobs < 10 then 'low'
 else 'Medium' End As job_posting_activity
FROM company_dim 
LEFT JOIN company_job_count ON company_job_count.company_id = company_dim.company_id
ORDER BY total_jobs ;

WITH important_skill AS (
    SELECT 
        skill_id,
        COUNT(*) AS highest_skill
    FROM skills_job_dim
    GROUP BY skill_id
)  


select skills_dim.skills,
important_skill.highest_skill
from skills_dim 
left JOIN important_skill on important_skill.skill_id= skills_dim.skill_id
ORDER BY highest_skill Desc
LIMIT 5;

WITH important_skill AS (
    SELECT 
        skill_id,
        COUNT(*) AS highest_skill
    FROM skills_job_dim
    GROUP BY skill_id
)


select skills_dim.skills,
important_skill.highest_skill,
important_skill.skill_id
from skills_dim 
left JOIN important_skill on important_skill.skill_id= skills_dim.skill_id
ORDER BY highest_skill Desc
LIMIT 5;

WITH remote_job_skills AS (
SELECT 
 skill_id,
 Count(*) As skills_count
 FROM skills_job_dim AS skills_to_job
 INNER JOIN job_postings_fact AS job_postings ON job_postings.job_id = skills_to_job.job_id
 WHERE job_postings.job_work_from_home = TRUE AND job_postings.job_title_short = 'Data Analyst'
 GROUP BY
  skill_id)

SELECT
skills.skill_id,
skills as skill_name,
skills_count
FROM remote_job_skills
Inner join  skills_dim AS skills on skills.skill_id= remote_job_skills.skill_id
ORDER BY skills_count DESC
LIMIT 5;