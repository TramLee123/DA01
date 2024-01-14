---ex1-HackerRank-- CITY table with populations larger than 120000
select NAME from CITY
where CountryCode = "USA" and population > 120000;

---ex2---attributes of every Japanese city in the CITY 
select *from city
where countrycode = "jpn";

---ex3--- a list of CITY and STATE from the STATION table.
select CITY,STATE from STATION;

--ex4-STARTING W/ VOWELS
select distinct CITY
from STATION
where  (CITY like 'A%' or CITY  like 'E%' or CITY  like 'I%' or CITY  like 'O%' or CITY  like 'U%');

---ex5--ENDING W/ VOWELS
select distinct CITY
from STATION
where  (CITY like '%A' or CITY  like '%E' or CITY  like '%I' or CITY  like '%O' or CITY  like '%U');

---ex6--do not start with vowels
select distinct CITY
from STATION
where  (CITY not like 'A%' AND CITY not like'E%' AND CITY not like'I%' AND CITY not like  'O%' AND CITY not like 'U%');

---ex7--a list of employee names
SELECT name
FROM Employee
ORDER BY name ASC;

---ex8--salary of employee
SELECT name
FROM Employee
WHERE salary > 2000 and months <10
ORDER BY employee_id ASC;

---ex9--Leetcode-recyclable and lowfat products
select product_id from Products
where low_fats ="Y" and recyclable ="Y"

---ex10----find customer id
select name from customer
where referee_id = 1 or  referee_id is null;

---ex11--big countries
select name,population, area from world
where area>3000000 or population >25000000

---ex12--article view
SELECT DISTINCT id
FROM views
WHERE viewer_id = author_id

---ex13--DataLemur---Unfinished Parts
SELECT part AS unfinished_part
FROM parts_assembly
WHERE finish_date IS NULL;

---ex14---Stratascratch--
select * from lyft_drivers
where yearly_salary <= 30000 
or yearly_salary >= 70000;

---ex15---
select advertising_channel from uber_advertising
where money_spent>100000 and year=2019;
