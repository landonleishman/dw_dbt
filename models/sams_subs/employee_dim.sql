{{ config(
    materialized = 'table',
    schema = 'dw_samssubs'
    )
}}

SELECT 
Distinct
{{ dbt_utils.generate_surrogate_key(['EmployeeID'])}} as Employee_key,
EmployeeID,
EmployeeFname,
EmployeeLname,
EmployeeBday
FROM {{ source('order_landing', 'employee') }} 