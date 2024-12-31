-- Problem Description:
-- The task is to find customers who visited the mall without making any transactions.
-- For such customers, count the number of visits where no transaction occurred.
-- Input tables:
--   1. Visits: Contains information about visits, with columns 'visit_id' and 'customer_id'.
--   2. Transactions: Contains information about transactions during visits, with columns 'transaction_id', 'visit_id', and 'amount'.
-- Output:
--   A table with 'customer_id' and the count of their visits without transactions ('count_no_trans').

SELECT customer_id, COUNT(customer_id) AS count_no_trans
FROM Visits AS V
LEFT JOIN Transactions AS T
ON V.visit_id = T.visit_id
WHERE transaction_id IS NULL
GROUP BY customer_id
ORDER BY COUNT(customer_id);
