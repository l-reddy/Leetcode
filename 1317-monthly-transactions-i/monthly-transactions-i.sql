# Write your MySQL query statement below
with cte as (
    SELECT DATE_FORMAT(trans_date, '%Y-%m') as month, country, count(trans_date) as trans_count,
    SUM(CASE WHEN state = 'approved' then 1 else 0 end) as approved_count, 
    SUM(amount) as trans_total_amount,
    SUM(CASE WHEN state = 'approved' then amount else 0 end) as approved_total_amount
    FROM Transactions
GROUP BY month, country
)
SELECT month, country, trans_count, approved_count, trans_total_amount, approved_total_amount from cte 
group by month, country