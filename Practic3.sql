---ex1---
select Name
from STUDENTS
where Marks > 75
order by right(name,3),ID

---ex2----
SELECT user_id,  
    CONCAT(UPPER(SUBSTRING(name, 1, 1)), LOWER(SUBSTRING(name,2, 4))) AS NAME
FROM Users
ORDER BY user_id;

---ex3----
SELECT manufacturer,
       CONCAT('$', ROUND(SUM((total_sales * units_sold) - cogs) / 1000000), ' million') AS Sales_Mil
FROM pharmacy_sales
GROUP BY manufacturer
ORDER BY SUM((total_sales * units_sold) - cogs) DESC;

---ex4----
SELECT 
  EXTRACT(month from submit_date) as MONTH,
  product_id,
 ROUND( AVG(stars),2) AS avg_stars
FROM reviews
GROUP BY EXTRACT(MONTH FROM submit_date), product_id
ORDER BY month, product_id 

---ex5----
SELECT 
  sender_id,
  COUNT(message_id) AS count_messages
FROM messages
WHERE EXTRACT(MONTH FROM sent_date) = '8'
  AND EXTRACT(YEAR FROM sent_date) = '2022'
GROUP BY sender_id
ORDER BY count_messages desc
limit 2;

---ex6----
SELECT tweet_id
FROM Tweets
WHERE LENGTH(content) > 15;


---ex7----error
SELECT active_day as day,
    COUNT(DISTINCT user_id) as active_users
FROM Activity
WHERE EXTRACT(DAY FROM activity_date) = 30
AND EXTRACT(MONTH FROM activity_date) = 7
group by user_id


---ex8----
SELECT COUNT(employee_id) AS number_employees_hired
FROM employees
WHERE EXTRACT(MONTH FROM joining_date) IN (1, 7) 
  AND EXTRACT(YEAR FROM joining_date) = 2022;



---ex9----
SELECT POSITION('a' IN 'Amitah') AS position_of_a
from worker;



---ex10----
select substring(title, length(winery)+2,4)
from title
where country='Macadonia'




