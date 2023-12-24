"""

Customer Placing the Largest Number of Orders

Table: Orders

+-----------------+----------+
| Column Name     | Type     |
+-----------------+----------+
| order_number    | int      |
| customer_number | int      |
+-----------------+----------+
order_number is the primary key (column with unique values) for this table.
This table contains information about the order ID and the customer ID.
 

Write a solution to find the customer_number for the customer who has placed the largest number of orders.

The test cases are generated so that exactly one customer will have placed more orders than any other customer.

The result format is in the following example.

 

Example 1:

Input: 
Orders table:
+--------------+-----------------+
| order_number | customer_number |
+--------------+-----------------+
| 1            | 1               |
| 2            | 2               |
| 3            | 3               |
| 4            | 3               |
+--------------+-----------------+
Output: 
+-----------------+
| customer_number |
+-----------------+
| 3               |
+-----------------+
Explanation: 
The customer with number 3 has two orders, which is greater than either customer 1 or 2 because each of them only has one order. 
So the result is customer_number 3.
 
Analysis → 

1. `GROUP BY` on `customer_number`
2. `COUNT` all unique `order_number`

To return only the largest, we need to sort it

1. `ORDER BY` in `DESC` on `order_number`
2. `LIMIT 1` to get the top `customer_number`

"""

SELECT o.customer_number
FROM Orders o
GROUP BY o.customer_number
HAVING COUNT(DISTINCT o.order_number) > 1
ORDER BY COUNT(DISTINCT o.order_number) DESC
LIMIT 1