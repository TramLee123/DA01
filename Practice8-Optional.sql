---ex1---leetcode---immediatefood---delivery---
with first_order as (
select d.customer_id,
min(d.order_date) as first_date,
d.customer_pref_delivery_date as goal
from Delivery d
group by d.customer_id
)

select
round(
(sum(if (f.first_date = f.goal, 1, 0)) )
/ (count(f.customer_id)) * 100.0
, 2) as immediate_percentage
from first_order as f;



---ex2---


