{{ 
    config(
        materialized = 'ephemeral'
    )
}}

WITH filtered_records AS (
    SELECT 
        country,
        country_code,
        population,
        indicator,
        daily_count,
        source,
        date AS reported_date
    FROM {{ ref("raw_cases_deaths") }}
    WHERE continent = '{{ var("name","USA") }}'
      AND country_code IS NOT NULL
)

SELECT
    country,
    country_code,
    population,
    source,
    reported_date,
    SUM(CASE WHEN indicator = 'confirmed cases' THEN daily_count ELSE 0 END) AS confirmed_cases,
    SUM(CASE WHEN indicator = 'deaths' THEN daily_count ELSE 0 END) AS deaths
FROM filtered_records
GROUP BY country, country_code, population, source, reported_date
ORDER BY country, reported_date
