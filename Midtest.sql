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

Q5.---
  SELECT 
  actor.actor_id,
  actor.first_name,
  actor.last_name,
  COUNT(film_actor.film_id) AS number_of_films
FROM 
  actor
INNER JOIN 
  film_actor ON actor.actor_id = film_actor.actor_id
GROUP BY 
  actor.actor_id, actor.first_name, actor.last_name
ORDER BY 
  number_of_films DESC;
---Diễn viên nào đóng nhiều phim nhất?
SELECT 
  actor.actor_id,
  actor.first_name,
  actor.last_name,
  COUNT(film_actor.film_id) AS film_count
FROM 
  actor
JOIN 
  film_actor ON actor.actor_id = film_actor.actor_id
GROUP BY 
  actor.actor_id, actor.first_name, actor.last_name
ORDER BY 
  film_count DESC
LIMIT 1;


Q6; Task: Tìm các địa chỉ không liên quan đến bất kỳ khách hàng nào.
  SELECT 
  address.address_id,
  address.address,
  address.district,
  address.city_id
FROM 
  address
LEFT JOIN 
  customer ON address.address_id = customer.address_id
WHERE 
  customer.address_id IS NULL;

----Có bao nhiêu địa chỉ như vậy?
SELECT 
  COUNT(address.address_id) AS number_of_addresses_without_customers
FROM 
  address
LEFT JOIN 
  customer ON address.address_id = customer.address_id
WHERE 
  customer.address_id IS NULL;

Q.7:Danh sách các thành phố và doanh thu tương ừng trên từng thành phố 
SELECT
  city.city_id,
  city.city,
  SUM(payment.amount) AS total_revenue
FROM
  city
JOIN
  address ON city.city_id = address.city_id
JOIN
  customer ON address.address_id = customer.address_id
JOIN
  payment ON customer.customer_id = payment.customer_id
GROUP BY
  city.city_id, city.city
ORDER BY
  total_revenue DESC;
----Thành phố nào đạt doanh thu cao nhất?
SELECT
  city.city_id,
  city.city,
  SUM(payment.amount) AS total_revenue
FROM
  city
JOIN
  address ON city.city_id = address.city_id
JOIN
  customer ON address.address_id = customer.address_id
JOIN
  payment ON customer.customer_id = payment.customer_id
GROUP BY
  city.city_id, city.city
ORDER BY
  total_revenue DESC
LIMIT 1;

Q.8...
  SELECT
  CONCAT(city.city, ', ', country.country) AS city_country,
  SUM(payment.amount) AS total_revenue
FROM
  city
JOIN
  address ON city.city_id = address.city_id
JOIN
  country ON city.country_id = country.country_id
JOIN
  customer ON address.address_id = customer.address_id
JOIN
  payment ON customer.customer_id = payment.customer_id
GROUP BY
  city.city_id, city.city, country.country
ORDER BY
  total_revenue DESC;
---------: thành phố của đất nước nào đat doanh thu cao nhất
SELECT
  country.country AS highest_revenue_country,
  MAX(payment.amount) AS total_revenue
FROM
  city
JOIN
  address ON city.city_id = address.city_id
JOIN
  country ON city.country_id = country.country_id
JOIN
  customer ON address.address_id = customer.address_id
JOIN
  payment ON customer.customer_id = payment.customer_id
GROUP BY
  country.country
ORDER BY
  total_revenue DESC
LIMIT 1;

