/* Write your T-SQL query statement below */
SELECT sell_date, COUNT(distinct product) as num_sold, 
STRING_AGG(product,',') WITHIN GROUP (ORDER BY product) as products
FROM 
(SELECT DISTINCT sell_date, product from Activities) ac 
GROUP BY ac.sell_date;