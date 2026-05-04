DROP DATABASE IF EXISTS da_market_india;
-- =========================
-- Create Database
-- =========================
CREATE DATABASE da_market_india;
USE da_market_india;

-- =========================
-- Table: job_listings
-- =========================
CREATE TABLE job_listings (
    job_id INT AUTO_INCREMENT PRIMARY KEY,
    platform VARCHAR(50) NOT NULL,
    job_title VARCHAR(250) NOT NULL,
    company_name VARCHAR(250),
    city VARCHAR(100),
    work_type VARCHAR(50), -- remote/hybrid/onsite
    experience_min INT,
    experience_max INT,
    employment_type VARCHAR(100), -- fulltime/contract/internship
    salary_min INT,
    salary_max INT,
    date_posted DATE,
    
    -- keep raw skills only if scraping pipeline exists
    skills_text TEXT,
    
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =========================
-- Table: job_skills
-- =========================
CREATE TABLE job_skills (
    skill_id INT AUTO_INCREMENT PRIMARY KEY,
    job_id INT NOT NULL,
    skill_name VARCHAR(150) NOT NULL,

    -- prevent duplicate skill entries per job
    UNIQUE (job_id, skill_name),

    FOREIGN KEY (job_id)
        REFERENCES job_listings(job_id)
        ON DELETE CASCADE
);

-- =========================
-- Indexing (performance)
-- =========================
CREATE INDEX idx_job_id ON job_skills(job_id);
CREATE INDEX idx_skill_name ON job_skills(skill_name);

CREATE INDEX idx_experience ON job_listings(experience_max);
CREATE INDEX idx_city ON job_listings(city);

-- =========================
-- Sample Data: job_listings
-- =========================
INSERT INTO job_listings
(platform, job_title, company_name, city, work_type,
 experience_min, experience_max, employment_type,
 salary_min, salary_max, date_posted, skills_text)
VALUES
('Naukri', 'Junior Data Analyst', 'ABC Analytics', 'Bangalore', 'Onsite',
 0, 2, 'Full-time',
 400000, 600000, '2026-02-10',
 'SQL, Excel, Power BI, Python'),

('LinkedIn', 'Data Analyst', 'TechNova Pvt Ltd', 'Hyderabad', 'Hybrid',
 2, 4, 'Full-time',
 600000, 900000, '2026-02-12',
 'SQL, Python, Tableau, Statistics'),

('Indeed', 'Business Data Analyst', 'FinEdge Solutions', 'Mumbai', 'Onsite',
 3, 5, 'Contract',
 700000, 1100000, '2026-02-08',
 'SQL, Excel, Power BI, Financial Analysis'),

('LinkedIn', 'Data Analyst Intern', 'Insight Labs', 'Remote', 'Remote',
 0, 1, 'Internship',
 NULL, NULL, '2026-02-15',
 'Excel, SQL, Basic Python'),

('Naukri', 'Senior Data Analyst', 'DataCore Systems', 'Bangalore', 'Hybrid',
 5, 8, 'Full-time',
 1200000, 1800000, '2026-02-05',
 'SQL, Python, Machine Learning, Power BI, AWS');

-- =========================
-- Sample Data: job_skills
-- =========================
INSERT INTO job_skills (job_id, skill_name) VALUES
(1, 'SQL'), (1, 'Excel'), (1, 'Power BI'), (1, 'Python'),
(2, 'SQL'), (2, 'Python'), (2, 'Tableau'), (2, 'Statistics'),
(3, 'SQL'), (3, 'Excel'), (3, 'Power BI'), (3, 'Financial Analysis'),
(4, 'Excel'), (4, 'SQL'), (4, 'Basic Python'),
(5, 'SQL'), (5, 'Python'), (5, 'Machine Learning'), (5, 'Power BI'), (5, 'AWS');
