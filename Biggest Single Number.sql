"""
Biggest Single Number

Table: MyNumbers

+-------------+------+
| Column Name | Type |
+-------------+------+
| num         | int  |
+-------------+------+
This table may contain duplicates (In other words, there is no primary key for this table in SQL).
Each row of this table contains an integer.
 

A single number is a number that appeared only once in the MyNumbers table.

Find the largest single number. If there is no single number, report null.

The result format is in the following example.

 

Example 1:

Input: 
MyNumbers table:
+-----+
| num |
+-----+
| 8   |
| 8   |
| 3   |
| 3   |
| 1   |
| 4   |
| 5   |
| 6   |
+-----+
Output: 
+-----+
| num |
+-----+
| 6   |
+-----+
Explanation: The single numbers are 1, 4, 5, and 6.
Since 6 is the largest single number, we return it.
Example 2:

Input: 
MyNumbers table:
+-----+
| num |
+-----+
| 8   |
| 8   |
| 7   |
| 7   |
| 3   |
| 3   |
| 3   |
+-----+
Output: 
+------+
| num  |
+------+
| null |
+------+
Explanation: There are no single numbers in the input table so we return null.

Analysis →

Here, we need to group all the elements which appear once together. 
And then once we have that, basically COUNT(*) > 0 (here * represents the returned rows) 
which means that we get rows which are only appearing once. 
If we have that, we return the largest number out of them else we return NULL
"""

-- This will return all nums which appear once
WITH cte AS
(
    SELECT num
    FROM MyNumbers 
    GROUP BY num
    HAVING COUNT(num) = 1
)

-- WHEN COUNT(*) > 0 THEN MAX(num) will check if returned rows count > 0
-- which means we have numbers which appear only once, so return the
-- largest from them. else return NULL
SELECT CASE WHEN COUNT(*) > 0 THEN MAX(num)
ELSE NULL END AS num
FROM cte