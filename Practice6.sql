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

---ex5---


---ex6---


---ex7---


---ex8---


---ex9---


---ex10---

---ex11---


---ex12---


