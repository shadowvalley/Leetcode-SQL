"""
Table: Person

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| email       | varchar |
+-------------+---------+
id is the primary key (column with unique values) for this table.
Each row of this table contains an email. The emails will not contain uppercase letters.
 

Write a solution to report all the duplicate emails. Note that it's guaranteed that the email field is not NULL.

Return the result table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Person table:
+----+---------+
| id | email   |
+----+---------+
| 1  | a@b.com |
| 2  | c@d.com |
| 3  | a@b.com |
+----+---------+
Output: 
+---------+
| Email   |
+---------+
| a@b.com |
+---------+
Explanation: a@b.com is repeated two times.

Analysis ->

Analyse →

We need to return the email which is occurring more than once. To do this, we can use `GROUP BY`. 
So, what it’ll do is group all rows having the same email together. And once we have that, we can add a filter to count which group has `COUNT > 1`. 
To add filter, we can use `WHERE` or `HAVING`. Now, `WHERE` is used directly on the column, but `HAVING` is used on aggregated values.
"""

SELECT p.email
FROM Person p
GROUP BY p.email
HAVING COUNT(DISTINCT p.id) > 1