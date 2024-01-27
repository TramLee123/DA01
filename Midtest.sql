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
  film.title,
  film.length,
  category.name AS category_name
FROM 
  film
JOIN 
  film_category ON film.film_id = film_category.film_id
JOIN 
  category ON film_category.category_id = category.category_id
WHERE 
  category.name IN ('Drama', 'Sports')
ORDER BY 
  film.length DESC;

------Phim dài nhất thuộc thể loại nào và dài bao nhiêu?
SELECT 
  category.name AS longest_movie_category,
  MAX(film.length) AS longest_movie_length
FROM 
  film
JOIN 
  film_category ON film.film_id = film_category.film_id
JOIN 
  category ON film_category.category_id = category.category_id
WHERE 
  category.name IN ('Drama', 'Sports')
GROUP BY 
  category.name;



Q4. SELECT 
  category.name AS category_name,
  COUNT(film.title) AS number_of_films
FROM 
  category
INNER JOIN 
  film_category ON category.category_id = film_category.category_id
INNER JOIN 
  film ON film_category.film_id = film.film_id
GROUP BY 
  category.name
ORDER BY 
  number_of_films DESC;
-----Thể loại danh mục nào là phổ biến nhất trong số các bộ phim?
SELECT 
  category.name AS most_popular_category,
  COUNT(film.film_id) AS film_count
FROM 
  category
JOIN 
  film_category ON category.category_id = film_category.category_id
JOIN 
  film ON film_category.film_id = film.film_id
GROUP BY 
  category.name
ORDER BY 
  film_count DESC
LIMIT 1;


