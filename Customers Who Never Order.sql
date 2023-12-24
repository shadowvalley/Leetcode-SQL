"""
Customers Who Never Orders

Table: Customers

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
+-------------+---------+
id is the primary key (column with unique values) for this table.
Each row of this table indicates the ID and name of a customer.
 

Table: Orders

+-------------+------+
| Column Name | Type |
+-------------+------+
| id          | int  |
| customerId  | int  |
+-------------+------+
id is the primary key (column with unique values) for this table.
customerId is a foreign key (reference columns) of the ID from the Customers table.
Each row of this table indicates the ID of an order and the ID of the customer who ordered it.
 

Write a solution to find all customers who never order anything.

Return the result table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Customers table:
+----+-------+
| id | name  |
+----+-------+
| 1  | Joe   |
| 2  | Henry |
| 3  | Sam   |
| 4  | Max   |
+----+-------+
Orders table:
+----+------------+
| id | customerId |
+----+------------+
| 1  | 3          |
| 2  | 1          |
+----+------------+
Output: 
+-----------+
| Customers |
+-----------+
| Henry     |
| Max       |
+-----------+

Analysis → 

We can do a `LEFT JOIN` on `Orders` table. Now, once we do it, `Customers` table will have `customerId` attached to it, 
but it’ll be NULL for the column which has no orders. 
So, basically those customers who have never ordered.

"""


SELECT c.name as Customers
FROM Customers c
LEFT JOIN Orders o
ON c.id = o.customerId
WHERE customerId is NULL


"""
Analysis → 

Another way to solve this is to find which customer has ordered something and return the remaining rows.
"""
SELECT c.name as Customers
FROM Customers c
WHERE c.id NOT IN 
(
    SELECT c.id -- as there can be two people of same name and one may have ordered and other may not have ordered.
    FROM Customers c
    INNER JOIN Orders o
    ON c.id = o.customerId
)
