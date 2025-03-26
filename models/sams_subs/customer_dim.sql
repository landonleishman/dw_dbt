{{ config(
    materialized = 'table',
    schema = 'dw_samssubs'
    )
}}

SELECT 
Distinct
{{ dbt_utils.generate_surrogate_key(['CustomerID'])}} as Customer_key,
CustomerID,
CustomerFname as CustFname,
CustomerLname as CustLname,
CustomerBday as CustBday,
CustomerPhone as CustPhone
FROM {{ source('order_landing', 'customer') }} 