-- 1. Displayinmg number of cases resolved per employee out of total cases assigned to a employee --

WITH A AS (select *
from
(
select *
from shriya_project.employee_work
) x
pivot
(
count(CASE_ID)
for STATUS in ('RESOLVED' AS RES,'PENDING' AS PEN)
) p)
SELECT EMPLOYEE_ID,SUM(RES),SUM(PEN),ROUND((SUM(RES)/(SUM(PEN)+SUM(RES))) * 100) AS PERCENT_RES FROM A GROUP BY EMPLOYEE_ID;