{{ 
    config(
        materialized = 'table',
        transient = false
    )
}}

with raw_cases_deaths AS (
    SELECT * 
    FROM {{ source('COVID', 'cases_deaths') }}
)
select * from raw_cases_deaths
