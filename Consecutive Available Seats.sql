"""
Consecutive Available Seats

Table: Cinema

+-------------+------+
| Column Name | Type |
+-------------+------+
| seat_id     | int  |
| free        | bool |
+-------------+------+
seat_id is an auto-increment column for this table.
Each row of this table indicates whether the ith seat is free or not. 1 means free while 0 means occupied.
 

Find all the consecutive available seats in the cinema.

Return the result table ordered by seat_id in ascending order.

The test cases are generated so that more than two seats are consecutively available.

The result format is in the following example.

 

Example 1:

Input: 
Cinema table:
+---------+------+
| seat_id | free |
+---------+------+
| 1       | 1    |
| 2       | 0    |
| 3       | 1    |
| 4       | 1    |
| 5       | 1    |
+---------+------+
Output: 
+---------+
| seat_id |
+---------+
| 3       |
| 4       |
| 5       |
+---------+

Analysis →

For every row, we need to know if it’s prev row is 1 or 0. So we can use SQL Window function of LEAD and LAG

```sql
Input:
Cinema table:
+---------+------+-----------+-----------+
| seat_id | free | PrevSeat  | NextSeat  |
+---------+------+-----------+-----------+
| 1       | 1    | N         | 0         |
| 2       | 0    | 1         | 1         |
| 3       | 1    | 0         | 1         |
| 4       | 1    | 1         | 1         |
| 5       | 1    | 1         | N         |
+---------+------+-----------+-----------+

Where N represents NULL
```

Approach 

```
-- find next seat

SELECT NROW.seat_id
FROM (SELECT *, LEAD(free) OVER(ORDER BY seat_id) AS NextSeat 
FROM Cinema) as NROW
WHERE NROW.free = 1 AND  NROW.NextSeat = 1
ORDER BY NROW.seat_id
```

Ans ->

```sql
Output
| seat_id |
| ------- |
| 3       |
| 4       |

Expected
| seat_id |
| ------- |
| 3       |
| 4       |
| 5       |
```

So, this solution misses seat 5 because for 5 if we check the NextSeat it’s Null, so it didn’t get selected.

So, to fix this, we can check prevSeat also.
"""

-- find next seat
-- find prev seat

SELECT NROW.seat_id
FROM (SELECT *,
    LEAD(free) OVER(ORDER BY seat_id) AS NextSeat,
    LAG(free)  OVER(ORDER BY seat_id) AS PrevSeat
FROM Cinema) as NROW
WHERE 
    NROW.free = 1 AND NROW.NextSeat = 1
OR 
    NROW.free = 1 AND NROW.PrevSeat = 1
ORDER BY NROW.seat_id