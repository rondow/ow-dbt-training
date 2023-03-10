with orders AS ( 
    SELECT * FROM {{ ref('raw_orders') }}
)

SELECT ORDERID, 
       SUM(ORDERSELLINGPRICE) AS TOTAL_SP 
FROM ORDERS 
GROUP BY ORDERID 
HAVING TOTAL_SP < 0