---ex1---weather-observation-station-3
SELECT DISTINCT CITY
WHERE ID%2=0 FROM STATION

---ex2---
select count(CITY)- count(distinct CITY) from STATION

---ex3--
select ceil(avg(salary) - avg(replace(salary,1)) 
            from employees
---ex4--/alibaba-compressed-mean
SELECT ROUND(CAST(SUM((item_count * order_occurrences) / SUM(order_occurrences)) AS DECIMAL, 1)) AS mean
FROM items_per_order

---ex5--matching-skills
SELECT candidate_id
FROM candidates
where skill IN ('Python','Tableau','PostgreSQL')
GROUP BY candidate_id
HAVING COUNT(skill)=3;

---ex6---
SELECT user_id
DATE(max(post_date))-DATE(min(post_date)) as days_between
WHERE post_date>='2021-01-01'AND post_date<'2022-01-01'
GROUP BY user_id
HAVING COUNT(post_id)>=2
FROM posts

---ex7---
SELECT card_name,
MAX(issued_amount)— MIN(issued_amount) AS difference
FROM monthly_cards_issued
GROUP BY card_name
ORDER BY difference DESC;

---ex8--
select manufacturer, count(distinct product_id) as drug_count, 
sum(cogs - total_sales) as total_loss
from pharmacy_sales 
where cogs > total_sales
group by manufacturer
order by total_loss desc;  

---ex9--
select * from Cinema
where mod(id,2) <> 0 and description != ‘boring’
order by rating DESC;

---ex10--
SELECT 
    teacher_id,
    COUNT(DISTINCT subject_id) AS cnt
FROM
    teacher
GROUP BY
    teacher_id;

---ex11--
SELECT user_id, 
       Count(follower_id) AS followers_count 
FROM   followers 
GROUP  BY user_id 
ORDER  BY user_id; 

---ex12--
select class 
from courses
group by class having count(distinct student) > 4;


