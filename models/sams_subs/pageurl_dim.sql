{{ config(
    materialized = 'table',
    schema = 'dw_samssubs'
    )
}}

SELECT 
DISTINCT
{{ dbt_utils.generate_surrogate_key(['page_url'])}} as PageUrl_Key,
page_url
FROM {{ source('traffic_landing', 'web_traffic_events') }}