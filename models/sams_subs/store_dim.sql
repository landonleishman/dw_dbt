{{ config(
    materialized = 'table',
    schema = 'dw_samssubs'
    )
}}

SELECT 
Distinct
{{ dbt_utils.generate_surrogate_key(['StoreID'])}} as Store_key,
StoreID,
Address as StoreAddress,
City as StoreCity,
State as StoreState,
Zip as StoreZip
FROM {{ source('order_landing', 'store') }}