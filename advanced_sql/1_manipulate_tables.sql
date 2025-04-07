SELECT 
Avg(Salary_year_avg) As Highest_paying,
 job_title_short
FROM job_postings_fact
WHERE salary_year_avg IS NOT NULL
GROUP BY job_title_short
ORDER BY Highest_paying Desc;