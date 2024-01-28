---ex1---https://datalemur.com/questions/duplicate-job-listings
WITH job_count_cte AS (
  SELECT 
    company_id, 
    title, 
    description, 
    COUNT(job_id) AS job_count
  FROM job_listings
  GROUP BY company_id, title, description
)

SELECT COUNT(DISTINCT company_id) AS duplicate_companies
FROM job_count_cte
WHERE job_count > 1;

---ex2---datalemur-Highest-Grossing Items
WITH ranked_spending_cte AS (
  SELECT 
    category, 
    product, 
    SUM(spend) AS total_spend,
    RANK() OVER (
      PARTITION BY category 
      ORDER BY SUM(spend) DESC) AS ranking 
  FROM product_spend
  WHERE EXTRACT(YEAR FROM transaction_date) = 2022
  GROUP BY category, product
)

SELECT 
  category, 
  product, 
  total_spend 
FROM ranked_spending_cte 
WHERE ranking <= 2 
ORDER BY category, ranking;

---ex3---https://datalemur.com/questions/frequent-callers
WITH call_records AS (
SELECT
  policy_holder_id,
  COUNT(case_id) AS call_count
FROM callers
GROUP BY policy_holder_id
HAVING COUNT(case_id) >= 3
)

SELECT COUNT(policy_holder_id) AS member_count
FROM call_records;

---ex4---https://datalemur.com/questions/sql-page-with-no-likes
SELECT page_id
FROM pages
WHERE NOT EXISTS (
  SELECT page_id
  FROM page_likes AS likes
  WHERE likes.page_id = pages.page_id)

---ex5---https://leetcode.com/problems/monthly-transactions
WITH temp AS
(SELECT * ,
DATE_FORMAT(trans_date,"%Y-%m") AS month
FROM Transactions)

SELECT temp.month, temp.country,
COUNT(*) AS trans_count,
SUM(CASE WHEN temp.state = "approved" THEN 1 ELSE 0 END) AS approved_count,
SUM(temp.amount) AS trans_total_amount,
SUM(CASE WHEN temp.state = "approved" THEN amount ELSE 0 END ) as approved_total_amount
FROM temp
GROUP BY temp.month, temp.country

---ex6---https://leetcode.com/problems/monthly-transactions-i

WITH temp AS
(SELECT * ,
DATE_FORMAT(trans_date,"%Y-%m") AS month
FROM Transactions)

SELECT temp.month, temp.country,
COUNT(*) AS trans_count,
SUM(CASE WHEN temp.state = "approved" THEN 1 ELSE 0 END) AS approved_count,
SUM(temp.amount) AS trans_total_amount,
SUM(CASE WHEN temp.state = "approved" THEN amount ELSE 0 END ) as approved_total_amount
FROM temp
GROUP BY temp.month, temp.country
  
---ex7---https://leetcode.com/problems/product-sales-analysis
SELECT product_id, year as first_year, quantity,price
FROM Sales
WHERE (product_id,year) in (
SELECT product_id,MIN(year)
FROM Sales
GROUP BY product_id
)

---ex8---https://leetcode.com/problems/customers-who-bought-all-products
select customer_id from customer 
group by 
customer_id
having count(distinct product_key ) = (select count(product_key ) from product)

---ex9---https://leetcode.com/problems/employees-whose-manager-left-the-company
select employee_id from Employees
where salary < 30000 and manager_id not in (select employee_id from employees) 
order by employee_id desc

---ex10---



---ex11---https://leetcode.com/problems/movie-rating/
(
  select name as results 
  from movierating mr inner join users u 
  on mr.user_id=u.user_id
  group by u.user_id 
  order by count(*) desc, name asc 
  limit 1
)
union all
(
  select results from
  (
  select title as results, avg(rating) as average_rating 
  from movierating mr 
  inner join movies m 
  on mr.movie_id=m.movie_id 
  where month(created_at) = 2 
  group by m.movie_id
  ) rating_group
  order by average_rating desc, results asc limit 1
);



---ex12---https://leetcode.com/problems/friend-requests-ii-who-has-the-most-friends
WITH CTE AS(
SELECT requester_id , accepter_id
FROM RequestAccepted
UNION ALL
SELECT accepter_id , requester_id
FROM RequestAccepted
)
SELECT requester_id id, count(accepter_id) num
FROM CTE
group by 1
ORDER BY 2 DESC
LIMIT 1

