{{ config(
    materialized = 'table',
    schema = 'dw_samssubs'
    )
}}

SELECT 
Distinct
{{ dbt_utils.generate_surrogate_key(['ordernumber'])}} as orderdetail_key,
ordernumber,
ordermethod
FROM {{ source('order_landing', '"ORDER"') }} 