--Creating tables for CCMS Project --
-- table 1 --

drop table employee_work;
drop table employee_address;
drop table employee;
drop table DEPARTMENT;
drop table CUSTOMER_ADDRESS;
drop table payment;
drop table subscription_renewal;
drop table customer_feedback;
drop table case_resolution;
drop table CASE_DETAILS;
drop table imei_info;
drop table product;
drop table parts;
drop table customer;
drop table subscription;
drop table geo_details;



create table department(
Dept_id varchar2(10),
Dept_name varchar2(100),
Dept_Priority_days number(13),
Dept_email varchar2(30),
Dept_phone varchar2(15),
Manager_id varchar2(10),
Dept_Service_cost number(5),
constraint pk_dept primary key (Dept_id)
);

--insert statements for department 
Insert into SHRIYA_PROJECT.DEPARTMENT (DEPT_ID,DEPT_NAME,DEPT_PRIORITY_DAYS,DEPT_EMAIL,DEPT_PHONE,MANAGER_ID,DEPT_SERVICE_COST) values ('D01','SUBSCRIPTION',null,'subscription@ccms.com','(908) 379-5666','EMP30',null);
Insert into SHRIYA_PROJECT.DEPARTMENT (DEPT_ID,DEPT_NAME,DEPT_PRIORITY_DAYS,DEPT_EMAIL,DEPT_PHONE,MANAGER_ID,DEPT_SERVICE_COST) values ('D02','HW_LAPTOP',3,'hwlaptop@ccms.com','(521) 445-7944','EMP25',30);
Insert into SHRIYA_PROJECT.DEPARTMENT (DEPT_ID,DEPT_NAME,DEPT_PRIORITY_DAYS,DEPT_EMAIL,DEPT_PHONE,MANAGER_ID,DEPT_SERVICE_COST) values ('D03','HW_MONITOR',3,'hwmonitor@ccms.com','(428) 678-3661','EMP07',20);
Insert into SHRIYA_PROJECT.DEPARTMENT (DEPT_ID,DEPT_NAME,DEPT_PRIORITY_DAYS,DEPT_EMAIL,DEPT_PHONE,MANAGER_ID,DEPT_SERVICE_COST) values ('D04','HW_SPEAKER',5,'hwspeaker@ccms.com','(227) 296-2771','EMP16',10);
Insert into SHRIYA_PROJECT.DEPARTMENT (DEPT_ID,DEPT_NAME,DEPT_PRIORITY_DAYS,DEPT_EMAIL,DEPT_PHONE,MANAGER_ID,DEPT_SERVICE_COST) values ('D05','HW_MOUSE',5,'hwmouse@ccms.com','(928) 663-7286','EMP52',10);
Insert into SHRIYA_PROJECT.DEPARTMENT (DEPT_ID,DEPT_NAME,DEPT_PRIORITY_DAYS,DEPT_EMAIL,DEPT_PHONE,MANAGER_ID,DEPT_SERVICE_COST) values ('D06','HW_KEYBOARD',5,'hwkeyboard@ccms.com','(206) 740-9273','EMP45',10);
Insert into SHRIYA_PROJECT.DEPARTMENT (DEPT_ID,DEPT_NAME,DEPT_PRIORITY_DAYS,DEPT_EMAIL,DEPT_PHONE,MANAGER_ID,DEPT_SERVICE_COST) values ('D07','SW_LAPTOP',2,'swlaptop@ccms.com','(514) 572-1910','EMP32',40);
Insert into SHRIYA_PROJECT.DEPARTMENT (DEPT_ID,DEPT_NAME,DEPT_PRIORITY_DAYS,DEPT_EMAIL,DEPT_PHONE,MANAGER_ID,DEPT_SERVICE_COST) values ('D08','NON-TECH_OTHERS',5,'swothers@ccms.com','(605) 975-7790','EMP01',15);
Insert into SHRIYA_PROJECT.DEPARTMENT (DEPT_ID,DEPT_NAME,DEPT_PRIORITY_DAYS,DEPT_EMAIL,DEPT_PHONE,MANAGER_ID,DEPT_SERVICE_COST) values ('D09','ANALYSTS',null,'analysts@ccms.com','(720) 543-3078','EMP17',null);
Insert into SHRIYA_PROJECT.DEPARTMENT (DEPT_ID,DEPT_NAME,DEPT_PRIORITY_DAYS,DEPT_EMAIL,DEPT_PHONE,MANAGER_ID,DEPT_SERVICE_COST) values ('D10','PAYMENTS',null,'payments@ccms.com','(841) 513-6996','EMP19',null);
Insert into SHRIYA_PROJECT.DEPARTMENT (DEPT_ID,DEPT_NAME,DEPT_PRIORITY_DAYS,DEPT_EMAIL,DEPT_PHONE,MANAGER_ID,DEPT_SERVICE_COST) values ('D11','WAREHOUSE',null,'warehouse@ccms.com','(323) 210-3039','EMP05',null);


-- table 2---

create table subscription (
    sub_id varchar2(20),
    sub_tier varchar2(65 CHAR),
    sub_period number(20),
    discount number(5),
    primary key(sub_id)
);

ALTER TABLE SHRIYA_PROJECT.subscription
DROP COLUMN discount;


alter table SHRIYA_PROJECT.subscription
add discount decimal(5,2);


--insert subscription
Insert into SHRIYA_PROJECT.SUBSCRIPTION (SUB_ID,SUB_TIER,SUB_PERIOD,DISCOUNT) values ('SUB01','SILVER',3,0.1);
Insert into SHRIYA_PROJECT.SUBSCRIPTION (SUB_ID,SUB_TIER,SUB_PERIOD,DISCOUNT) values ('SUB02','GOLD',4,0.15);
Insert into SHRIYA_PROJECT.SUBSCRIPTION (SUB_ID,SUB_TIER,SUB_PERIOD,DISCOUNT) values ('SUB03','PLATINUM',5,0.2);
Insert into SHRIYA_PROJECT.SUBSCRIPTION (SUB_ID,SUB_TIER,SUB_PERIOD,DISCOUNT) values ('SUB04','DIAMOND',7,0.3);



CREATE TABLE GEO_DETAILS(
State_Code varchar2(5), 
State varchar2(200) NOT NULL UNIQUE,
Tax number(5) NOT NULL,
Time_zone varchar2(200) NOT NULL,
PRIMARY KEY(State_code)
);


-- altering table geo_details , changing datatype of tax to decimal --
ALTER TABLE shriya_project.geo_details
DROP COLUMN tax;

ALTER TABLE shriya_project.geo_details
ADD tax decimal(5,2);


-- Inserting data into geodetails object ----
Insert into SHRIYA_PROJECT.GEO_DETAILS (STATE_CODE,STATE,TIME_ZONE,TAX) values ('AK','Alaska','CST',0);
Insert into SHRIYA_PROJECT.GEO_DETAILS (STATE_CODE,STATE,TIME_ZONE,TAX) values ('AZ','Arizona','MST',0.04);
Insert into SHRIYA_PROJECT.GEO_DETAILS (STATE_CODE,STATE,TIME_ZONE,TAX) values ('AR','Arkansas','CST',0.05);
Insert into SHRIYA_PROJECT.GEO_DETAILS (STATE_CODE,STATE,TIME_ZONE,TAX) values ('CA','California','PST',0.06);
Insert into SHRIYA_PROJECT.GEO_DETAILS (STATE_CODE,STATE,TIME_ZONE,TAX) values ('CO','Colorado','MST',0.07);
Insert into SHRIYA_PROJECT.GEO_DETAILS (STATE_CODE,STATE,TIME_ZONE,TAX) values ('CT','Connecticut','EST',0.03);
Insert into SHRIYA_PROJECT.GEO_DETAILS (STATE_CODE,STATE,TIME_ZONE,TAX) values ('DE','Delaware','EST',0);
Insert into SHRIYA_PROJECT.GEO_DETAILS (STATE_CODE,STATE,TIME_ZONE,TAX) values ('DC','District of Columbia','EST',0.03);
Insert into SHRIYA_PROJECT.GEO_DETAILS (STATE_CODE,STATE,TIME_ZONE,TAX) values ('FL','Florida','EST',0.06);
Insert into SHRIYA_PROJECT.GEO_DETAILS (STATE_CODE,STATE,TIME_ZONE,TAX) values ('GA','Georgia','EST',0.04);
Insert into SHRIYA_PROJECT.GEO_DETAILS (STATE_CODE,STATE,TIME_ZONE,TAX) values ('HI','Hawaii','HST',0.06);
Insert into SHRIYA_PROJECT.GEO_DETAILS (STATE_CODE,STATE,TIME_ZONE,TAX) values ('ID','Idaho','MST',0.04);
Insert into SHRIYA_PROJECT.GEO_DETAILS (STATE_CODE,STATE,TIME_ZONE,TAX) values ('IL','Illinois','CST',0.04);
Insert into SHRIYA_PROJECT.GEO_DETAILS (STATE_CODE,STATE,TIME_ZONE,TAX) values ('IN','Indiana','CST',0.06);
Insert into SHRIYA_PROJECT.GEO_DETAILS (STATE_CODE,STATE,TIME_ZONE,TAX) values ('IA','Iowa','CST',0.06);
Insert into SHRIYA_PROJECT.GEO_DETAILS (STATE_CODE,STATE,TIME_ZONE,TAX) values ('KS','Kansas','MST',0.07);
Insert into SHRIYA_PROJECT.GEO_DETAILS (STATE_CODE,STATE,TIME_ZONE,TAX) values ('KY','Kentucky','CST',0.06);
Insert into SHRIYA_PROJECT.GEO_DETAILS (STATE_CODE,STATE,TIME_ZONE,TAX) values ('LA','Louisiana','CST',0.06);
Insert into SHRIYA_PROJECT.GEO_DETAILS (STATE_CODE,STATE,TIME_ZONE,TAX) values ('ME','Maine','EST',0.06);
Insert into SHRIYA_PROJECT.GEO_DETAILS (STATE_CODE,STATE,TIME_ZONE,TAX) values ('MD','Maryland','EST',0.04);
Insert into SHRIYA_PROJECT.GEO_DETAILS (STATE_CODE,STATE,TIME_ZONE,TAX) values ('MA','Massachusetts','EST',0.05);
Insert into SHRIYA_PROJECT.GEO_DETAILS (STATE_CODE,STATE,TIME_ZONE,TAX) values ('MI','Michigan','CST',0.06);
Insert into SHRIYA_PROJECT.GEO_DETAILS (STATE_CODE,STATE,TIME_ZONE,TAX) values ('MN','Minnesota','CST',0.06);
Insert into SHRIYA_PROJECT.GEO_DETAILS (STATE_CODE,STATE,TIME_ZONE,TAX) values ('MS','Mississippi','CST',0.06);
Insert into SHRIYA_PROJECT.GEO_DETAILS (STATE_CODE,STATE,TIME_ZONE,TAX) values ('MO','Missouri','CST',0.06);
Insert into SHRIYA_PROJECT.GEO_DETAILS (STATE_CODE,STATE,TIME_ZONE,TAX) values ('MT','Montana','MST',0);
Insert into SHRIYA_PROJECT.GEO_DETAILS (STATE_CODE,STATE,TIME_ZONE,TAX) values ('NE','Nebraska','CST',0.04);
Insert into SHRIYA_PROJECT.GEO_DETAILS (STATE_CODE,STATE,TIME_ZONE,TAX) values ('NV','Nevada','PST',0.06);
Insert into SHRIYA_PROJECT.GEO_DETAILS (STATE_CODE,STATE,TIME_ZONE,TAX) values ('NH','New Hampshire','EST',0);
Insert into SHRIYA_PROJECT.GEO_DETAILS (STATE_CODE,STATE,TIME_ZONE,TAX) values ('NJ','New Jersey','EST',0.06);
Insert into SHRIYA_PROJECT.GEO_DETAILS (STATE_CODE,STATE,TIME_ZONE,TAX) values ('NM','New Mexico','EST',0);
Insert into SHRIYA_PROJECT.GEO_DETAILS (STATE_CODE,STATE,TIME_ZONE,TAX) values ('NY','New York','EST',0.06);
Insert into SHRIYA_PROJECT.GEO_DETAILS (STATE_CODE,STATE,TIME_ZONE,TAX) values ('NC','North Carolina','EST',0.06);
Insert into SHRIYA_PROJECT.GEO_DETAILS (STATE_CODE,STATE,TIME_ZONE,TAX) values ('ND','North Dakota','CST',0.04);
Insert into SHRIYA_PROJECT.GEO_DETAILS (STATE_CODE,STATE,TIME_ZONE,TAX) values ('OH','Ohio','EST',0.05);
Insert into SHRIYA_PROJECT.GEO_DETAILS (STATE_CODE,STATE,TIME_ZONE,TAX) values ('OK','Oklahoma','CST',0.05);
Insert into SHRIYA_PROJECT.GEO_DETAILS (STATE_CODE,STATE,TIME_ZONE,TAX) values ('OR','Oregon','MST',0);
Insert into SHRIYA_PROJECT.GEO_DETAILS (STATE_CODE,STATE,TIME_ZONE,TAX) values ('PA','Pennsylvania','EST',0.04);
Insert into SHRIYA_PROJECT.GEO_DETAILS (STATE_CODE,STATE,TIME_ZONE,TAX) values ('RI','Rhode Island','EST',0.07);
Insert into SHRIYA_PROJECT.GEO_DETAILS (STATE_CODE,STATE,TIME_ZONE,TAX) values ('SC','South Carolina','EST',0.06);
Insert into SHRIYA_PROJECT.GEO_DETAILS (STATE_CODE,STATE,TIME_ZONE,TAX) values ('SD','South Dakota','MST',0.12);
Insert into SHRIYA_PROJECT.GEO_DETAILS (STATE_CODE,STATE,TIME_ZONE,TAX) values ('TN','Tennessee','EST',0.07);
Insert into SHRIYA_PROJECT.GEO_DETAILS (STATE_CODE,STATE,TIME_ZONE,TAX) values ('TX','Texas','MST',0.06);
Insert into SHRIYA_PROJECT.GEO_DETAILS (STATE_CODE,STATE,TIME_ZONE,TAX) values ('UT','Utah','MST',0.04);
Insert into SHRIYA_PROJECT.GEO_DETAILS (STATE_CODE,STATE,TIME_ZONE,TAX) values ('VT','Vermont','EST',0.07);
Insert into SHRIYA_PROJECT.GEO_DETAILS (STATE_CODE,STATE,TIME_ZONE,TAX) values ('VA','Virginia','EST',0.06);
Insert into SHRIYA_PROJECT.GEO_DETAILS (STATE_CODE,STATE,TIME_ZONE,TAX) values ('WA','Washington','PST',0.12);
Insert into SHRIYA_PROJECT.GEO_DETAILS (STATE_CODE,STATE,TIME_ZONE,TAX) values ('WV','West Virginia','EST',0.07);
Insert into SHRIYA_PROJECT.GEO_DETAILS (STATE_CODE,STATE,TIME_ZONE,TAX) values ('WI','Wisconsin','CST',0.06);


-- table 3---
CREATE TABLE PARTS (
    PART_ID VARCHAR2(65 CHAR),
    PART_NUMBER varchar2(38) NOT NULL,
    PART_NAME VARCHAR2(65 CHAR),
    AVAILABILITY number(6),
    WARRANTY VARCHAR2(65 CHAR),
    PART_COST number(6),
    PRIMARY KEY(PART_ID)
);


---insert for parts

--alter table employee delete column employee_email;
--alter table employee add employee_email varchar2(100);

create table employee(employee_id varchar2(10),
employee_firstname varchar2(16),
employee_lastname varchar2(14),
employee_email varchar2(50),
employee_phonenbr varchar2(15),
dept_id varchar2(10),
primary key(employee_id),
FOREIGN KEY (dept_id) REFERENCES department(dept_id));

--insert employee


create table employee_address(employee_id varchar2(6),
address_type varchar2(18),
address_1 varchar2(100),
address_2 varchar(100),
employee_city varchar2(30),
employee_statecode varchar2(5),
employee_country varchar2(9),
employee_zip NUMBER(7),
FOREIGN KEY (employee_id) REFERENCES employee(employee_id),
FOREIGN KEY (employee_statecode) REFERENCES geo_details(State_Code) ON DELETE CASCADE);

--insert employeeadress



create table product(
product_number varchar2(50),
product_name varchar2(50),
product_category varchar2(50),
primary key(product_number)
);


---insert product

create table imei_info(
imei varchar2(25),
product_number varchar2(50),
primary key(imei),
FOREIGN KEY (product_number) REFERENCES product(product_number)
);

--insert imei info



CREATE TABLE CUSTOMER(
Customer_id varchar2(10),
First_name varchar2(225) NOT NULL UNIQUE,
Last_name varchar2(225) NOT NULL,
Email varchar2(50) NOT NULL UNIQUE,
Phone_number varchar2(15) NOT NULL,
Customer_onboarddate timestamp NOT NULL,
Sub_id varchar2(20),
PRIMARY KEY(Customer_id),
FOREIGN KEY (Sub_id) References SUBSCRIPTION(Sub_id) ON DELETE CASCADE
);


---insert statements for customer



CREATE TABLE CUSTOMER_ADDRESS(
Customer_id varchar2(10),
Address_type varchar2(200) NOT NULL,
Address_1 varchar2(255) NOT NULL,
Address_2 varchar2(255) ,
City varchar2(255) NOT NULL,
State_code varchar2(6),
Country varchar(65) NOT NULL,
Zip number(10) NOT NULL,
FOREIGN KEY (Customer_id) References CUSTOMER(Customer_id) ON DELETE CASCADE,
FOREIGN KEY (State_code) References GEO_DETAILS(State_code) ON DELETE CASCADE
);

---insert statements for customer_address

CREATE TABLE CASE_DETAILS(
Case_id varchar2(10),
Open_date Timestamp NOT NULL,
Close_date Timestamp ,
Part_id varchar2(20),
IMEI varchar2(25),
Case_subject varchar2(250),
Customer_id varchar2(6),
State_code varchar2(25),
Issue_type varchar2(200) ,
employee_id varchar2(25),
PRIMARY KEY(Case_id),
FOREIGN KEY(Part_id) References PARTS(Part_id) ON DELETE CASCADE,
FOREIGN KEY(IMEI) References IMEI_INFO(IMEI) ON DELETE CASCADE,
FOREIGN KEY(Customer_id) References CUSTOMER(Customer_id) ON DELETE CASCADE,
FOREIGN KEY(State_code) References GEO_DETAILS(State_code) ON DELETE CASCADE
);
--- insert statements for case_details

-- table 4---

CREATE TABLE EMPLOYEE_WORK (
    WORK_ID  VARCHAR2 (65 CHAR), 
    EMPLOYEE_ID varchar2 (6),
    WORK_TYPE VARCHAR2 (65 CHAR),
    START_DATE TIMESTAMP, 
    STATUS VARCHAR2(65 CHAR),
    case_id varchar2(10),
    PRIMARY KEY (WORK_ID),
    FOREIGN KEY (EMPLOYEE_ID) REFERENCES EMPLOYEE(EMPLOYEE_ID) ON DELETE CASCADE,
    FOREIGN KEY (case_id) REFERENCES case_details(case_id) on delete cascade
) ;

--insert employee_work



-- table 10---

CREATE TABLE PAYMENT(
Payment_id varchar2(60),
Customer_id varchar2(10),
discount number(10),
case_id varchar2(10),
PRIMARY KEY(Payment_id),
FOREIGN KEY (case_id) References case_details(case_id) ON DELETE CASCADE
);


--insert payment




-- table 11 --

create table subscription_renewal(
sub_renewal_id varchar2(10),
customer_id varchar2(10),
sub_id varchar2(10),
renewal_tier varchar2(25),
start_date timestamp,
primary key(sub_renewal_id),
FOREIGN KEY (sub_id) References subscription(sub_id) ON DELETE CASCADE
);

--insert sub renewal

-- table 12 --

create table customer_feedback(
feedback_id varchar2(25),
case_id varchar2(10),
feedback_description VARCHAR2(100),
likely_to_retain varchar2(20),
likely_to_recommend number(20),
primary key(feedback_id),
FOREIGN KEY (case_id) REFERENCES case_details(case_id) ON DELETE CASCADE
);
/* alter table query for time taken */


---insert statements for customer_feedback


-- table 15 --


create table case_resolution(
case_id varchar2(20),
resolution_type varchar2(50),
resolution_date timestamp,
comments varchar2(300),
FOREIGN KEY (case_id) REFERENCES case_details(case_id) ON DELETE CASCADE
);


--insert statements fro case resolution


alter table payment add service_cost decimal(20,4);
alter table payment add total decimal(20,4);

update table payment set service_cost = 

select dept_id from 


