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



---ex2---

---ex3---

---ex4---


---ex5---


---ex6---


---ex7---


---ex8---


---ex9---


---ex10---

---ex11---


---ex12---


