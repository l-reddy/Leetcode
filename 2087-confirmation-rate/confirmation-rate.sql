# Write your MySQL query statement below
with cte as(
    SELECT s.user_id, SUM(CASE WHEN action = 'confirmed' then 1 else 0 end) as confirmed, count(action) as total
FROM Signups s left join Confirmations c on s.user_id = c.user_id group by s.user_id
)

SELECT user_id, round(coalesce(confirmed/total,0),2) as confirmation_rate from cte group by user_id