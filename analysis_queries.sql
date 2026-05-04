-- =========================
-- Q1: Most in-demand skills overall
-- =========================
SELECT 
    skill_name,
    COUNT(*) AS frequency
FROM job_skills
GROUP BY skill_name
ORDER BY frequency DESC;


-- =========================
-- Q2: Most in-demand skills for entry-level roles
-- =========================
SELECT 
    js.skill_name,
    COUNT(*) AS frequency
FROM job_skills js
JOIN job_listings jl ON js.job_id = jl.job_id
WHERE jl.experience_max <= 2
GROUP BY js.skill_name
ORDER BY frequency DESC;


-- =========================
-- Q3: Entry-level job ratio
-- =========================
SELECT 
    COUNT(CASE WHEN experience_max <= 2 THEN 1 END) * 1.0 
    / COUNT(*) AS entry_level_ratio
FROM job_listings;


-- =========================
-- Q4: Job distribution by experience level
-- =========================
SELECT 
    CASE 
        WHEN experience_max <= 2 THEN 'Entry Level'
        WHEN experience_max <= 5 THEN 'Mid Level'
        ELSE 'Senior Level'
    END AS experience_category,
    COUNT(*) AS job_count
FROM job_listings
GROUP BY experience_category;

-- Q5: % of jobs requiring each skill
SELECT 
    skill_name,
    COUNT(DISTINCT job_id) * 100.0 / (SELECT COUNT(*) FROM job_listings) AS percentage
FROM job_skills
GROUP BY skill_name
ORDER BY percentage DESC;

-- Q6: Skills that frequently appear together
SELECT 
    js1.skill_name AS skill_1,
    js2.skill_name AS skill_2,
    COUNT(*) AS frequency
FROM job_skills js1
JOIN job_skills js2 
    ON js1.job_id = js2.job_id 
    AND js1.skill_name < js2.skill_name
GROUP BY skill_1, skill_2
ORDER BY frequency DESC;

-- Q7: Average number of skills required per job (by experience level)
SELECT 
    CASE 
        WHEN jl.experience_max <= 2 THEN 'Entry Level'
        WHEN jl.experience_max <= 5 THEN 'Mid Level'
        ELSE 'Senior Level'
    END AS experience_category,
    COUNT(js.skill_name) * 1.0 / COUNT(DISTINCT jl.job_id) AS avg_skills_per_job
FROM job_listings jl
JOIN job_skills js ON jl.job_id = js.job_id
GROUP BY experience_category;
