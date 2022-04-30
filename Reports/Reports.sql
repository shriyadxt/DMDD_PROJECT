-- 1. No.of cases solved by an employee (cases>3) --

CREATE VIEW Emp_Case_Count AS
select distinct cd.employee_id, count(cd.case_id) as count from SHRIYA_PROJECT.case_details cd group by cd.employee_id 
having count(cd.case_id) > 2 order by count desc;

select * from sharan_project.emp_case_count;

-- 2. listing the efficient employees -- cases open and close date -- 
create view EMP_CASE_STATUS AS
select c.employee_id,c.case_id,r.resolution_date - c.open_date nbr_of_days,p.product_category,w.status from SHRIYA_PROJECT.case_details c
left join SHRIYA_PROJECT.case_resolution r on c.case_id = r.case_id
left join SHRIYA_PROJECT.imei_info i on c.imei = i.imei
left join SHRIYA_PROJECT.product p on p.product_number = i.product_number
left join SHRIYA_PROJECT.employee_work w on c.case_id = w.case_id
where c.employee_id in (select distinct cd.employee_id from SHRIYA_PROJECT.case_details cd group by cd.employee_id)
order by c.case_id;


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


