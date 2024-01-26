Q.1
select distinct replacement_cost from film
order by replacement_cost asc

Q2.
SELECT 
  replacement_cost,
  CASE 
    WHEN replacement_cost BETWEEN 9.99 AND 19.99 THEN 'Low_rep_cost'
    WHEN replacement_cost BETWEEN 20.00 AND 24.99 THEN 'Medium'
    WHEN replacement_cost BETWEEN 25.00 AND 29.99 THEN 'High'
  END AS cost_range,
  COUNT(*) AS count_in_range,
  SUM(replacement_cost) AS sum_low_rep_cost
FROM 
  film
WHERE 
  replacement_cost BETWEEN 9.99 AND 29.99
GROUP BY 
  replacement_cost, cost_range;

Q3.
  SELECT
    f.title AS longest_film_title,
    f.length AS longest_film_length,
    c.category_name AS category_of_longest_film
FROM
    films AS f
JOIN
    categories AS c ON f.category_id = c.category_id
WHERE
    c.category_name IN ('Drama', 'Sports')
ORDER BY
    f.length DESC
LIMIT 1;

Q4.

