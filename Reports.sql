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



/*
2. Percent Number of cases (>5) for a given state.
*/

select cd.state_code, count(cd.case_id) as case_count, round((count(*) * 100.0 / (select count(*) from shriya_project.case_details)),2) as Percent_state_case  
from SHRIYA_PROJECT.case_details cd 
left join SHRIYA_PROJECT.case_resolution cr on cd.case_id=cr.case_id 
group by cd.state_code
having count(cd.case_id) > 4
order by count(cd.case_id) desc ;
