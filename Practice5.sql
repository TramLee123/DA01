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


---ex4---


---ex5---




---ex6---







