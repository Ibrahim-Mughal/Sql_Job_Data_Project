/*
Question: What are the most in-demand skills for data analysts?
- identify the top 5 in demand skills for a data analyst.
- Focus on all job postings
- Why? tells the top 5 most in demand skills in the job market for the data analyst role
*/
Select 
     skills,
     count(skills_job_dim.job_id) As demand_count 
    from job_postings_fact
    INNER JOIN skills_job_dim On job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
    job_title_short = 'Data Analyst'
    GROUP BY 
    skills
    ORDER BY 
    demand_count DESC
    LIMIT 5;