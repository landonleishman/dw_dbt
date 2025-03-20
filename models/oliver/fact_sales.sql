{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
) }}

SELECT
    cd.customerid as Cust_key,
    dd.date_id as Date_key,
    ds.store_id as Store_key,
    dp.product_id as Product_key,
    de.Employeeid as Employee_key,
    o.quantity as Quantity,
    o.quantity * o.unit_price as Dollars_sold,
    o.unit_price
FROM {{ source('oliver_landing', 'orderline') }} o
INNER JOIN {{ source('oliver_landing', 'orders') }} os ON o.order_id = os.order_id
INNER JOIN {{ ref('oliver_dim_customer') }} cd ON os.customer_id = cd.customerid---join    -----customer table
INNER JOIN {{ ref('oliver_dim_date') }} dd ON os.order_date = dd.date_id       ----join.       -------date
INNER JOIN {{ ref('oliver_dim_store') }} ds ON os.store_id = ds.store_id       ----join      ------store
INNER JOIN {{ ref('oliver_dim_product') }} dp ON o.product_id = dp.product_id  ---join      ------product
Inner Join {{ ref('oliver_dim_employee') }} de ON  os.employee_id = de.employeeid                         ---join     ------employee
