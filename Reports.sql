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


/*
3. Promoter Customers for the organization
*/


select cd.customer_id as Promoters,  f.feedback_id from 
SHRIYA_PROJECT.case_details cd 
left join SHRIYA_PROJECT.customer_feedback f
on cd.case_id = f.case_id 
where f.likely_to_retain = 'YES' and f.likely_to_recommend >= 8;

/* 
4. Detractor Customers for the Organization
*/
select cd.customer_id as Detractors,  f.feedback_id from SHRIYA_PROJECT.case_details cd 
left join SHRIYA_PROJECT.customer_feedback f
on cd.case_id = f.case_id
where f.likely_to_retain = 'NO' and f.likely_to_recommend <=5;



/*
5. Number of employees who worked on more than 5 cases
*/

select distinct cd.employee_id, count(cd.case_id)as count from SHRIYA_PROJECT.case_details cd group by cd.employee_id 
having count(cd.case_id) > 2 order by count desc;
