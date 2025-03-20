 {{ config(
    materialized = 'table',
    schema = 'dw_oliver'
    )
}}



SELECT
c.firstname as customer_first_name, ----joined
c.lastname as customer_last_name, ----joined
p.product_name, ----joined
d.date_id, ---joined
S.Store_name, ------joined
E.Employee_key, ----joined
f.Dollars_Sold as sale_amount
FROM {{ ref('fact_sales') }} f

LEFT JOIN {{ ref('oliver_dim_customer') }} c
    ON f.cust_key = c.customer_key

LEFT JOIN {{ ref('oliver_dim_store') }} s
    ON f.store_key = s.store_key

LEFT JOIN {{ ref('oliver_dim_product') }} p
    ON f.product_key = p.product_key

LEFT JOIN {{ ref('oliver_dim_date') }} d
    ON f.date_key = d.date_key

LEFT JOIN {{ ref('oliver_dim_employee') }} e
    ON f.employee_key = e.employee_key

