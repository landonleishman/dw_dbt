{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
    )
}}


select
store_id as store_key,
store_id,
Store_name,
Street,
City,
State
FROM {{ source('oliver_landing', 'store') }}