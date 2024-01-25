---ex1---AVG POPULATION---
SELECT COUNTRY.CONTINENT,ROUND(AVG(CITY.POPULATION),0)
FROM CITY
INNER JOIN COUNTRY ON CITY.CountryCode = COUNTRY.Code
WHERE CITY.ID IS NOT NULL
GROUP BY COUNTRY.CONTINENT

---ex2---https://datalemur.com/questions/signup-confirmation-rate
SELECT
round(count(texts.email_id)::decimal/COUNT(DISTINCT emails.email_id),2)as activation_rate
FROM emails
LEFT JOIN texts
  ON emails.email_id = texts.email_id
  AND texts.signup_action ='Confirmed'

---ex3---https://datalemur.com/questions/time-spent-snaps
SELECT 
  age.age_bucket, 
  ROUND(100.0 * 
    SUM(activities.time_spent) FILTER (WHERE activities.activity_type = 'send')/
      SUM(activities.time_spent),2) AS send_percentage, 
  ROUND(100.0 * 
    SUM(activities.time_spent) FILTER (WHERE activities.activity_type = 'open')/
      SUM(activities.time_spent),2) AS open_percentage
FROM activities
INNER JOIN age_breakdown AS age 
  ON activities.user_id = age.user_id 
WHERE activities.activity_type IN ('send', 'open') 
GROUP BY age.age_bucket;

---ex4---https://datalemur.com/questions/supercloud-customer
SELECT 
  customers.customer_id, 
  COUNT(DISTINCT products.product_category) AS unique_count
FROM customer_contracts AS customers
LEFT JOIN products 
  ON customers.product_id = products.product_id
GROUP BY customers.customer_id;

---ex5---https://leetcode.com/problems/the-number-of-employees-which-report-to-each-employee
SELECT
e.employee_id
,e.name
,count(e2.reports_to) as reports_count
,ROUND(AVG(e2.age*1.0),0) as average_age
FROM employees e INNER JOIN
employees e2 ON e.employee_id=e2.reports_to
WHERE e2.reports_to IS NOT NULL
GROUP BY
e.employee_id
,e.name
ORDER BY e.employee_id

---ex6---https://leetcode.com/problems/list-the-products-ordered-in-a-period
Select p.product_name, sum(o.unit) as unit from
Products as p inner join Orders as o
on p.product_id = o.product_id
where order_date between '2020-02-01' and '2020-02-29'
group by o.product_id
having unit >= 100;

---ex7---leetcode-- sql pages w/ no likes
SELECT pg.page_id
FROM pages pg
LEFT OUTER JOIN page_likes pl
ON  pg.page_id = pl.page_id
where pl.page_id is null











