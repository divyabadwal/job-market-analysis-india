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
