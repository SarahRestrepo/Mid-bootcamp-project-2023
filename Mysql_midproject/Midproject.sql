#5a
ALTER TABLE house_price_regression.house_price_data
DROP COLUMN date;

#5b
select *
from house_price_data
limit 10;

#6
select count(*)
from house_price_data;

#7
select distinct bedrooms, bathrooms,floors, grade, house_price_data.condition
from house_price_data;

#8
select id 
from house_price_data
order by price desc
limit 10;

#9
select avg(price)
from house_price_data;

# 10a
select bedrooms, avg (price) as "Avg price by bedroom"
from house_price_data
group by bedrooms 
; 
# 10b
select bedrooms, avg (sqft_living) as "Avg sqft by bedroom"
from house_price_data
group by bedrooms 
; 
# 10c
select bedrooms, avg (price) as "Avg price by bedroom"
from house_price_data
group by bedrooms 
; 
# 10d
select waterfront, avg (price) as "Avg price for waterfront"
from house_price_data
group by waterfront 
; 
#10e
SELECT house_price_data.condition, AVG(grade) AS avg_grade
FROM house_price_data
GROUP BY house_price_data.condition;
#10f
SELECT `condition`, AVG(grade) AS avg_grade, COUNT(*) AS num_houses
FROM house_price_data
GROUP BY `condition`
;

# 11 
SELECT *
FROM house_price_data
WHERE bedrooms IN (3, 4)
  AND bathrooms > 3
  AND floors = 1
  AND waterfront = 0
  AND house_price_data.condition >= 3
  AND grade >= 5
  AND price < 300000;

# 11 extra   
SELECT price, bedrooms,bathrooms, floors
FROM house_price_regression.house_price_data
Where price <= 300000 
and bedrooms IN (3, 4)
and bathrooms > 3
and floors = 2;

# 12  
select *
from house_price_data
where price >2 * (select avg(price) from house_price_data);

#13
create view Houses_with_higher_than_double_average_price as
select *
from house_price_data
where price >2 * (select avg(price) from house_price_data);

#14
SELECT bedrooms, AVG(price) AS avg_price
FROM house_price_data
WHERE bedrooms IN (3, 4)
GROUP BY bedrooms;

#15
Select distinct zip_code
from house_price_data;

#16
select id, yr_renovated
from house_price_data
where yr_renovated <> 0;

#17
SELECT
    *
FROM (
    SELECT *, ROW_NUMBER() OVER (ORDER BY price) AS RowNum
    FROM house_price_data
) AS sub
WHERE RowNum = 11;
   








