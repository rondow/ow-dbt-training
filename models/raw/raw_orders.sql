{{
    config(
        materialized='table'
    )
}}


SELECT * FROM
   {{ source('GLOBAL_MART', 'ORDERS') }}