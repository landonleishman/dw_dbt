{{ config(
    materialized = 'table',
    schema = 'dw_samssubs'
    )
}}

SELECT 
Distinct
{{ dbt_utils.generate_surrogate_key(['p.ProductID'])}} as Product_key,
p.ProductID,
ProductType,
ProductName,
ProductCalories,
BreadType
FROM {{ source('order_landing', 'product') }} p FULL OUTER join {{ source('order_landing', 'sandwich') }} s on p.productid = s.productid