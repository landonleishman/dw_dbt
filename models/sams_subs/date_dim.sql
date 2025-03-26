{{ config(
    materialized = 'table',
    schema = 'dw_samssubs'
    )
}}

with cte_date as (
{{ dbt_date.get_date_dimension("1985-01-01", "2055-12-31") }}
)

SELECT
{{ dbt_utils.generate_surrogate_key(['date_day'])}} as date_key,
date_day,
month_of_year,
day_of_week,
year_number
from cte_date