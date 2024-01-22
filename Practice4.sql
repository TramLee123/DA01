---ex1----DataLemur---https://datalemur.com/questions/laptop-mobile-viewership
SELECT 
 sum(CASE 
   WHEN device_type = 'laptop' THEN 1
  ELSE 0 
  END) AS laptop_views, 
  sum(CASE 
   WHEN device_type IN ('tablet', 'phone') THEN 1 
  ELSE 0
  END) AS mobile_views 
FROM viewership;

---ex2---https://leetcode.com/problems/triangle-judgement
SELECT x, y, z,
  CASE
    WHEN x + y > z AND x + z > y AND y + z > x THEN 'YES'
    ELSE 'NO'
  END AS triangle
FROM Triangle;

---ex3---datalemur-uncategorized-calls-percentage
select round(1.0*sum(
case when call_category is null or call_category = 'n/a' then 1 
else 0 end)/count(*)*100,0) 
as call_percentage
from callers;  


---ex4--https://leetcode.com/problems/find-customer-referee/
select name from customer
where referee_id != 2 or referee_id is null

---ex5----ex5: stratascratch the-number-of-survivors.
SELECT
    survived,
    sum(CASE WHEN pclass = 1 THEN 1 ELSE 0 END) AS first_class,
    sum(CASE WHEN pclass = 2 THEN 1 ELSE 0 END) AS second_class,
    sum(CASE WHEN pclass = 3 THEN 1 ELSE 0 END) AS third_class
FROM titanic
GROUP BY 
    survived


