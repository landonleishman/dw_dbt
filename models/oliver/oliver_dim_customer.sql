{{ config(
    materialized = 'table',
    schema = 'dw_oliver'
    )
}}
----making a table in this schema

select
customer_id as customer_key,
customer_id as CustomerID,
first_name as FirstName,
last_name as LastName,
Email,
Phone_Number as PhoneNumber,
State
FROM {{ source('oliver_landing', 'customer') }}