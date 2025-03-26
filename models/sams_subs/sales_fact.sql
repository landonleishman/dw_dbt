{{ config(
   materialized = 'table',
   schema = 'dw_samssubs'
) }}


SELECT
   CD.Customer_key,
   ED.Employee_key,
   SD.Store_key,
   PD.Product_key,
   ODD.orderdetail_key,
   od.orderlineqty,
   od.orderlineprice,
   op.productcost as productprice,
   od.pointsearned
FROM {{ source('order_landing', 'orderdetails') }} od ------this contains the orderlineqty, pointsearned, orderlineprice-----we still need productprice. where is this???
INNER JOIN {{ source('order_landing', 'product') }} op on od.productid = op.productid ---this gives us ProductPrice
INNER JOIN {{ source('order_landing', '"ORDER"') }} o on o.ordernumber = od.ordernumber
INNER JOIN {{ source('order_landing', 'employee') }} e on e.employeeid = o.employeeid
INNER JOIN {{ source('order_landing', 'store') }} s on s.storeid = e.storeid
INNER JOIN {{ ref('customer_dim') }} cd ON cd.CustomerID = o.customerid
INNER JOIN {{ ref('employee_dim') }} ed ON ed.Employeeid = o.employeeid
INNER JOIN {{ ref('store_dim') }} sd ON sd.storeid = s.storeid
INNER JOIN {{ ref('product_dim') }} pd on pd.productid = od.productid
INNER JOIN {{ ref('orderdetails_dim') }} odd on odd.ordernumber = od.ordernumber
INNER JOIN {{ ref('date_dim') }} dd on dd.Date_day = o.orderdate



