"""

Table: Employee

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
| salary      | int     |
| managerId   | int     |
+-------------+---------+
id is the primary key (column with unique values) for this table.
Each row of this table indicates the ID of an employee, their name, salary, and the ID of their manager.
 

Write a solution to find the employees who earn more than their managers.

Return the result table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Employee table:
+----+-------+--------+-----------+
| id | name  | salary | managerId |
+----+-------+--------+-----------+
| 1  | Joe   | 70000  | 3         |
| 2  | Henry | 80000  | 4         |
| 3  | Sam   | 60000  | Null      |
| 4  | Max   | 90000  | Null      |
+----+-------+--------+-----------+
Output: 
+----------+
| Employee |
+----------+
| Joe      |
+----------+
Explanation: Joe is the only employee who earns more than his manager.

Analysis ->

Analysing this question → 

```sql
Employee table:
+----+-------+--------+-----------+
| id | name  | salary | managerId |
+----+-------+--------+-----------+
| 1  | Joe   | 70000  | 3         |
| 2  | Henry | 80000  | 4         |
| 3  | Sam   | 60000  | Null      |
| 4  | Max   | 90000  | Null      |
+----+-------+--------+-----------+
```

Here, we have managerId which indicates that for Employee with id 1, their manager is id 3

(so, for example → For Employee Joe, their manager is Sam and so on..)

To solve this question, we need both employee and their manager. So, by looking at it, we see we have only two employees that match this description.

So, here we only have 1 table. So, in these cases, think of it as two tables (having same data), so basically `JOIN the table on itself (SELF JOIN)`. 
Now when we analyse the table, we see `managerId` column. Now, from description it seems it’s a FOREIGN key. 
`(Foreign keys can take values and their values can be restricted to the reference column or can be NULL)`

We can do a `LEFT JOIN` or `INNER JOIN` which can help us to solve the question.
"""

# Write your MySQL query statement below
SELECT e1.name as Employee
FROM Employee e1
LEFT JOIN Employee e2
ON e1.managerId = e2.id
WHERE e1.salary > e2.salary
