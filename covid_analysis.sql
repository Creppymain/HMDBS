sql

-- COVID-19 DATA ANALYSIS QUERIES
-- Author: Christopher Ikwumonu
-- Date: 2025-05-18

----------------------------------
-- QUESTION 1: COUNTRY COMPARISON
----------------------------------

/* 
Objective: Compare COVID-19 impact across countries
by total cases, deaths, and vaccination rates
*/

WITH country_stats AS (
    SELECT 
        location AS country,
        MAX(date) AS last_update,
        MAX(total_cases) AS total_cases,
        MAX(total_deaths) AS total_deaths,
        MAX(people_vaccinated_per_hundred) AS vaccination_rate
    FROM covid_data
    WHERE 
        continent IS NOT NULL -- Exclude continents/aggregates
        AND date = (SELECT MAX(date) FROM covid_data)
    GROUP BY location
)

SELECT 
    country,
    last_update,
    total_cases,
    total_deaths,
    ROUND((total_deaths/total_cases)*100, 2) AS mortality_pct,
    vaccination_rate,
    CASE
        WHEN vaccination_rate > 70 THEN 'High'
        WHEN vaccination_rate > 40 THEN 'Medium'
        ELSE 'Low'
    END AS vaccination_status
FROM country_stats
WHERE total_cases > 100000  -- Only countries with significant cases
ORDER BY total_cases DESC
LIMIT 20;

/* 
INSIGHTS:
1. Shows countries with highest case counts
2. Calculates mortality rates
3. Categorizes vaccination progress
4. Filters for meaningful comparison
*/

