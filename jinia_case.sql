{%- set category = ["Furniture", "Office", "Technology"] -%}

SELECT 
 ORDERID, 
 {% for category in category %}
 SUM(CASE WHEN CATEGORY = '{{category}}' THEN ORDERPROFIT END) AS {{category}}_orderprofit
 {% if not loop.last %}, {% endif %}
 {% endfor %}
FROM {{ ref('stg_orders') }}
GROUP BY 1 

--sql 

SELECT 
 ORDERID, 
 
 SUM(CASE WHEN CATEGORY = 'Furniture' THEN ORDERPROFIT END) AS Furniture_orderprofit
 , 
 
 SUM(CASE WHEN CATEGORY = 'Office' THEN ORDERPROFIT END) AS Office_orderprofit
 , 
 
 SUM(CASE WHEN CATEGORY = 'Technology' THEN ORDERPROFIT END) AS Technology_orderprofit
 
 
FROM ANALYTICS.dbt_rondow.stg_orders
GROUP BY 1 