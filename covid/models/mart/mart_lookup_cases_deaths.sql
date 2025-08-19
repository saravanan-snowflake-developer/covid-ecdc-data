{{ 
    config(
        materialized='table',
        transient=false
    ) 
}}

with cases_deaths as (
    select * 
    from {{ ref('mart_cases_deaths') }}
),
country_lookup as (
    select * 
    from {{ ref('country_lookup') }}
)

select
    cast(cd.country as varchar(100)) as country,
    cast(cl.country_code_2_digit as varchar(100)) as country_code_2_digit,
    cast(cl.country_code_3_digit as varchar(100)) as country_code_3_digit,
    cast(cd.population as bigint) as population,
    cast(cd.confirmed_cases as bigint) as confirmed_cases,
    cast(cd.deaths as bigint) as deaths,
    cast(cd.reported_date as date) as reported_date,
    cast(cd.source as varchar(100)) as source
from cases_deaths cd
left join country_lookup cl
    on cd.country = cl.country

