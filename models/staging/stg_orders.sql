SELECT 
 --from raw_orders
 {{ dbt_utils.generate_surrogate_key(['O.ORDERID', 'C.CUSTOMERID', 'P.PRODUCTID']) }} AS SK_ORDERS,
 O.ORDERID ,
 O.ORDERDATE ,
 O.SHIPDATE ,
 O.SHIPMODE, 
 O.ORDERSELLINGPRICE - O.ORDERCOSTPRICE AS ORDERPROFIT,
 O.ORDERSELLINGPRICE,
 O.ORDERCOSTPRICE,
 --from raw_customer 
 C.CUSTOMERID,
 C.CUSTOMERNAME,
 C.SEGMENT,
 C.COUNTRY,
 --from raw_product 
 P.PRODUCTID,
 P.CATEGORY, 
 P.PRODUCTNAME,
 P.SUBCATEGORY,
 {{ markup('ORDERSELLINGPRICE','ORDERCOSTPRICE') }} AS MARKUP,
 D.delivery_team
FROM {{ ref('raw_orders') }} AS O
 LEFT JOIN {{ ref('raw_customer') }} AS C
  ON O.CUSTOMERID = C.CUSTOMERID
 LEFT JOIN {{ ref('raw_product') }} AS P
  ON O.PRODUCTID = P.PRODUCTID
LEFT JOIN  {{ ref('delivery_team') }} AS D 
  ON O.SHIPMODE = D.SHIPMODE
--{{ limit_data_in_dev('ORDERDATE') }}