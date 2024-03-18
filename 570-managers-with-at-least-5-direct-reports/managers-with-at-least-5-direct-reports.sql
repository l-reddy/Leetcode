# Write your MySQL query statement below
SELECT name FROM Employee
where id in (
    SELECT managerId FROM Employee group by managerId HAVING count(id) >=5
);