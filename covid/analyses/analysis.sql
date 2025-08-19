SELECT *
FROM (
    SELECT country, date, daily_count
    FROM RAW_CASES_DEATHS
    WHERE country = 'Albania'
) src
PIVOT (
    SUM(daily_count) FOR date IN ('02-01-2020','03-01-2020','04-01-2020')
) p;
