{{ config(
    materialized = 'table',
    schema = 'dw_samssubs'
    )
}}

SELECT 
Distinct
{{ dbt_utils.generate_surrogate_key(['event_name'])}} as eventname_key,
event_name as event_type
FROM {{ source('traffic_landing', 'web_traffic_events') }}