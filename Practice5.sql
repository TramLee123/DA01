---ex1---AVG POPULATION---
SELECT COUNTRY.CONTINENT,ROUND(AVG(CITY.POPULATION),0)
FROM CITY
INNER JOIN COUNTRY ON CITY.CountryCode = COUNTRY.Code
WHERE CITY.ID IS NOT NULL
GROUP BY COUNTRY.CONTINENT

---ex2---
SELECT
round(count(texts.email_id)::decimal/COUNT(DISTINCT emails.email_id),2)as activation_rate
FROM emails
LEFT JOIN texts
  ON emails.email_id = texts.email_id
  AND texts.signup_action ='Confirmed'

---ex3---
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

---ex4---


---ex5---




---ex6---







