{{
    config(
        materialized='table'
    )
}}

select 
c.c_name as customer_name,
c.c_custkey as ID,
o.o_orderkey as order_id,
o.o_orderstatus,
{{round_price('o.o_totalprice')}} as rounded_total_prize,
n.n_name as nation
from {{ ref('stg_customers') }} c join
{{ ref('stg_nation') }} n
on c.c_nationkey=n.n_nationkey join
{{ ref('stg_orders') }} o 
on c.c_custkey=o.o_custkey
