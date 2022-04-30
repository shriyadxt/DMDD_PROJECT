-- 1. No.of cases solved by an employee (cases>3) --

CREATE VIEW Emp_Case_Count AS
select distinct cd.employee_id, count(cd.case_id) as count from SHRIYA_PROJECT.case_details cd group by cd.employee_id 
having count(cd.case_id) > 2 order by count desc;

select * from sharan_project.emp_case_count;

-- 2. listing the efficient employees -- cases open and close date -- 
DROP VIEW EMP_CASE_STATUS ;

create view EMP_CASE_STATUS AS
select c.employee_id,c.case_id,r.resolution_date - c.open_date nbr_of_days,p.product_category,w.status,f.LIKELY_TO_RECOMMEND from SHRIYA_PROJECT.case_details c
left join SHRIYA_PROJECT.case_resolution r on c.case_id = r.case_id
left join SHRIYA_PROJECT.imei_info i on c.imei = i.imei
left join SHRIYA_PROJECT.product p on p.product_number = i.product_number
left join SHRIYA_PROJECT.employee_work w on c.case_id = w.case_id
left join shriya_project.customer_feedback f on f.case_id = c.case_id
where c.employee_id in (select distinct cd.employee_id from SHRIYA_PROJECT.case_details cd group by cd.employee_id)
order by nbr_of_days desc;


select * from sharan_project.EMP_CASE_STATUS;


/* 3. Customers that are likely to retain (retain = yes and recommend = score > 7)
list out promoters, detractors and passive customers

*/



----3. PROMOTERS--------------------------------------------------------------------------------------------------------------------------------------
create view Cust_Promoters AS
select cd.customer_id as Promoters,  f.feedback_id from 
SHRIYA_PROJECT.case_details cd 
left join SHRIYA_PROJECT.customer_feedback f
on cd.case_id = f.case_id 
where f.likely_to_retain = 'YES' and f.likely_to_recommend >= 9;

select * from sharan_project.cust_promoters;

-----------4. DETRACTORS ---------------------------

drop view Cust_Detractors;

create view Cust_Detractors AS
select cd.customer_id as Detractors,  f.feedback_id from SHRIYA_PROJECT.case_details cd 
left join SHRIYA_PROJECT.customer_feedback f
on cd.case_id = f.case_id
where f.likely_to_retain = 'NO' and f.likely_to_recommend <=6;

select * from sharan_project.cust_detractors;

----------------------------------

--5. problematic parts (sindhu) ---

create view Part_Problem_Count AS

select cd.part_id, p.part_name, count(*) as part_problem from shriya_project.case_details cd
inner join shriya_project.parts p on cd.part_id=p.part_id
group by cd.part_id, p.part_name
having count(*) > 2
order by count(*) desc;


select * from sharan_project.part_problem_count;

--6. no of cases from a given state --
-- sharan --

drop view Cases_Per_State;

create view Cases_Per_State AS
select cd.state_code, count(cd.case_id) as case_count, round((count(*) * 100.0 / (select count(*) from shriya_project.case_details)),2) as Case_Per_State
from SHRIYA_PROJECT.case_details cd
left join SHRIYA_PROJECT.case_resolution cr on cd.case_id=cr.case_id
group by cd.state_code
having count(cd.case_id) > 4
order by count(cd.case_id) desc ;

select * from sharan_project.cases_per_state;

-- 7. highest number of subscriptions used by a set of customers --
--sindhu --
drop view sharan_project.Tier_Weightage;

create view Tier_Weightage AS
select c.sub_id, s.sub_tier, round((count(*) * 100.0 / (select count(*) from shriya_project.customer)),2) as Sub_Percentage from shriya_project.customer c
inner join shriya_project.subscription s on c.sub_id=s.sub_id
group by c.sub_id, s.sub_tier
order by count(*) desc;

select * from sharan_project.Tier_Weightage;

-- 8. Displayinmg number of cases resolved per employee out of total cases assigned to a employee --

DROP VIEW emp_efficiency;

create view emp_efficiency AS
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
SELECT EMPLOYEE_ID,SUM(RES) as TOT_RES,SUM(PEN) as TOT_PEN, ROUND((SUM(RES)/(SUM(PEN)+SUM(RES))) * 100,2) AS RES_PERCENTAGE FROM A GROUP BY EMPLOYEE_ID
order by EMPLOYEE_ID;


SELECT * FROM sharan_project.emp_efficiency;

---------------------------------------------------------------------------------------------------------------------

----9. Employee Product Count ----

create view EMP_PRODUCT_COUNT as
select distinct cd.employee_id, count(cd.case_id)as count,p.product_category from SHRIYA_PROJECT.case_details cd
left join SHRIYA_PROJECT.imei_info i on i.imei = cd.imei
left join SHRIYA_PROJECT.product p on p.product_number = i.product_number
group by cd.employee_id ,p.product_category
having count(cd.case_id) > 1 order by count desc,p.product_category desc;

select * from sharan_project.emp_product_count;
------------------------------------------------------------------------------------------------------------------------------------------------


-- 10. Product Promoters, Detractors, Passives ---
DROP VIEW Product_Prom;

create view Product_Prom as
with a as (select * from (select cf.case_id, product_category,
case
when LIKELY_TO_RECOMMEND between 0 and 6 then 'Detractors'
when LIKELY_TO_RECOMMEND between 7 and 8 then 'Passives'
when LIKELY_TO_RECOMMEND between 9 and 10 then 'Promotors'
END as NET_SCORE
from shriya_project.customer_feedback cf
left join shriya_project.case_details cd on cf.case_id = cd.case_id
left join shriya_project.imei_info i on i.imei = cd.imei
left join shriya_project.product p on p.product_number = i.product_number) x
pivot(
count(CASE_ID)
for NET_SCORE in ('Detractors','Passives','Promotors')
) p)
select * from A;




select * from sharan_project.product_prom;

-------------------------------------------------------


