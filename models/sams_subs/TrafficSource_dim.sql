{{ config(
    materialized = 'table',
    schema = 'dw_samssubs'
    )
}}

SELECT 
Distinct
{{ dbt_utils.generate_surrogate_key(['traffic_source'])}} as TrafficSource_Key,
traffic_source
FROM {{ source('traffic_landing', 'web_traffic_events') }}