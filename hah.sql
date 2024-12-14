create database company;
use company;
CREATE table Departments (
department_id int primary key,
department_name varchar(100) not null,
location varchar(100),
budget decimal(12,2)
);
describe Departments;
show tables in company;
CREATE table Projects (
project_id int primary key,
project_name varchar(100) not null,
department_id int,
foreign key(department_id) references Departments(department_id)
);

describe Projects;

#creating tables for employees
CREATE table Employees (
employee_id int primary key,
e_name varchar(100) not null,
salary decimal(10,2)not null,
hire_date date not null,
job varchar(100) not null,
department_id int,
project_id int,
foreign key(department_id) references Departments(department_id),
foreign key(project_id) references Projects(project_id)
);

describe Employees;
show tables in company;

# inserting records into department
insert into Departments values
(1,'Engineering','info park kochi',500000.00),
(2,'Marketing','Technopark tvm',300000.00),
(3,'HR','cyberpark kozhikode',200000.00),
(4,'Finance','Smartcity Kochi',400000.00);

# inserting records into projects
INSERT INTO Projects (project_id, project_name, department_id) VALUES
(1, 'Project Solar', 1),
(2, 'Project Titan', 2),
(3, 'Project Evolve', 3),
(4, 'Project Nexus', 4);

INSERT INTO Employees (employee_id, e_name, salary, hire_date, job, department_id, project_id) VALUES
(1, 'Lakshmi Pillai', 60000.00, '2021-01-15', 'Software Engineer', 1, 1),
(2, 'Suhana', 95000.00, '2020-02-20', 'Project Manager', 2, 2),
(3, 'Risana', 45000.00, '2019-03-25', 'Recruitment Specialist', 3, 3),
(4, 'Rakeek', 105000.00, '2018-04-30', 'Finance Manager', 4, 4),
(5, 'Shakira', 50000.00, '2021-06-18', 'Software Engineer', 1, 1),
(6, 'Nafiya', 70000.00, '2019-08-12', 'Marketing Specialist', 2, 2),
(7, 'Ziyad', 85000.00, '2021-03-15', 'DevOps Engineer', 1, 1),
(8, 'Priya Varghese', 78000.00, '2019-04-10', 'Marketing Manager', 2, 2),
(9, 'Nikhil George', 55000.00, '2020-07-18', 'HR Analyst', 3, 3),
(10, 'Afsal', 120000.00, '2018-11-22', 'Chief Financial Officer', 4, 4),
(11, 'Meheza', 60000.00, '2021-09-03', 'Junior Software Engineer', 1, 1),
(12, 'Fawaz', 68000.00, '2020-05-25', 'Content Strategist', 2, 2);

select * from Departments;
select * from Projects;
select * from Employees;

select * ,salary*12 as annual_salary from Employees;

select salary from Employees where salary>50000 and salary<90000;
#between -- used when you to have display the records from one range to another
#not between- used when you start exclude the ranges
#in between as well as not between start range and ending range is a must
select * from Employees where salary between 50000 and 90000;
select * from Employees where hire_date not between '2018-12-31' and '2021-02-01'; # date in between these date wont display other all will display

select e_name from Employees where department_id  in (1,4) and salary>60000;

select e_name,job,hire_date from Employees where hire_date>'2020-01-01' and job='Software Engineer';

select * from Employees where hire_date<2020-6-15 and (job="Software Engineer" or job="Junior Software Engineer");

select employee_id,e_name,project_id from Employees where (job='HR Analyst' or job='Finance Manager') and department_id!=4;

select *,salary*12 as annual_salary from Employees where salary*12<666890;

select e_name,department_id from Employees where job='Project Manager' or job='DevOps Engineer' and hire_date between '2020-01-01' and '2021-12-31';


# The LIKE operator is used to search for a specific pattern within a column.(aka pattern matching operator)
# Wildcards:
# 1. % -- Represents zero or more characters.
# 2. _ -- Represent a single character.

# NOT LIKE -- not to search for a specific pattern within a column(excluding the pattern)

# Name start from letter z
select * from Employees where e_name like 'z%';

# names ending with letter a
select * from Employees where e_name like '%a';

# name is not ending with a
select * from Employees where e_name not like '%a';

#name start with s and end with a
select * from Employees where e_name like 's%a';
#have letter i in their name
select * from Employees where e_name like '%i%';

# job nd name of employee where i comes twice in name
select job,e_name from Employees where e_name like '%i%i%';

# names with 2 consecutive 'e'
select * from Employees where e_name like '%ee%';

# name start wd a and have letter inbtwn s 
select * from Employees where e_name like 'a%s%';

# name of employee who hired in the year 2019
select * from Employees where hire_date like '2019%';

# display the names of emp who are having 5 charc in theirs names (5 underscore)
select * from Employees where e_name like '_____';

# name of emp whose second char is i 
select * from Employees where e_name like '_i%';

# display engineer whose job is engineer 
select * from Employees where job like '%engineer';

# name has 3rd last character as a 
select * from Employees where e_name like '%a__';

# disply employees who hav vowels in their name
select * from Employees where e_name like '%a%' or '%e%' or '%i%' or '%o%' or '%u%';

# Both are used to check null values in a table. is - check is there any null. is not - opposite
select * from Employees where e_name is NULL; 
select * from Employees where e_name is not NULL;
#how to modify record
update employees set salary =1200000 where employee_id=7;
select * from employees;
#how to add column in table
alter table employees add column gender varchar(10);
select * from employees;
#filling values
update employees set gender="female" where employee_id in (1,2,3,4,5,6,7,8,9,10,11,12);
select * from employees;
#change constraint
alter table employees modify column gender varchar(10) not null;
describe employees;
#change column name
alter table employees 
change column salary sal decimal(10,2);
select * from employees;
#deletig record
delete from employees where employee_id=4;
select * from employees;
#deletion of column
-- alter table employees drop gender;
#deletion of table
-- drop table employees;
#functions
-- single row
-- multi row(aggreagate function)
-- n SQL:

-- Single-Row Functions: Operate on a single row and return one result per row. Example: UPPER(name) converts the name to uppercase.

-- Multi-Row (Aggregate) Functions: Operate on multiple rows and return a single result for the entire set. Example: SUM(salary) returns the total salary of all rows.

-- -- Functions
-- it is a set of instructions that are written to reduce the task
-- SQL functions can be broadly categorized into two types based on the number of rows they operate on: 
     -- single-row functions and multi-row functions.

-- Single-row functions operate on each row individually and return a single result per row. 
-- These functions are applied to each row in the result set and return a value for each row.

-- Types of single-
-- SUBSTRING(str, pos, len): Extracts a substring starting at position pos for len characters.
-- LENGTH(str): Returns the length of a string in bytes.

-- UPPER(str): Converts a string to uppercase.
-- LOWER(str): Converts a string to lowercase.
-- TRIM(str): Removes leading and trailing spaces from a string.
-- REPLACE:
-- reVERSE:

-- Multi-row functions, also known as aggregate functions, operate on a set of rows and return a 
-- single result for the entire set. These functions are typically used with the GROUP BY clause 
-- to group rows that share a common attribute and perform operations on these groups.

-- Types of Multi-Row Functions:

-- 1. COUNT(): Counts the number of rows in a set.

-- 2. SUM(): Calculates the sum of a numeric column.

-- 3. AVG(): Calculates the average of a numeric column.

-- 4. MAX(): Finds the maximum value in a set.

-- 5. MIN(): Finds the minimum value in a set.
#multi row
-- count
select count(e_name) from  employees;
select * from employees;
select count(*) as count_of from employees;
-- sum
select sum(sal) from employees;
select sum(sal) as totsal from employees;
-- avg
select avg(sal) from employees;
select avg(sal) as totsal from employees;
select round(avg(sal),2) as totsal from employees;
select count(sal),sum(sal),avg(sal) from employees;
-- max 
select max(sal) from employees;
select max(sal) as totsal from employees;
select round(avg(sal),2) as totsal from employees;
select count(sal),sum(sal),avg(sal),max(sal) from employees;
-- min
select min(sal) from employees;
select min(sal) as totsal from employees;
select round(avg(sal),2) as totsal from employees;
select count(sal),sum(sal),avg(sal),min(sal) from employees;
-- rules for multi row
-- we can use select at first
-- acannotuse  multi row functions in where clause because where is executed row by row
-- cannot use anu column name with multi row functions in select clause
#dispplay the no of emplyees having charcter i in second place of name
select count(e_name) from employees where e_name like "_i%";
#display min salay to third department
#group  by clause 
-- used to group the records
-- executes row by row
-- we can pas

select min(sal) from employees where department_id =3;
select * from employees;
#display count of  unique salary
select distinct(sal),count(sal) from employees;

SELECT COUNT(DISTINCT sal) as distinctsal
FROM employees;
#max salary of hr and software engineer
select max(sal)  as maxsal from employees where job in ("Software Engineer", "HR Analyst");
-- group by is used to display two columns with multi row functions and a column;
SELECT sal, COUNT(sal)
FROM employees group by sal;
#groupby
-- used to group the records
-- executes row by row
-- we can pass coulmn name s argument;
-- we can write group by column along along with the multi row function in select clause
select count(*),department_id from employees group by department_id;
#display no of employees a well as depts who are earning more than 7000 in each deopt
select department_id,count(*) as no_of_emp from employees where sal>7000 group  by department_id;
#dislay no of eployees as well as depts who are earning more than 7000 in each dept as well as projects
select department_id,project_id,count(*) as no_of_emp from employees where sal>70000 group  by department_id,project_id;
#calculate the total salary of employees working in departments 1 and 3 where job title starts wirh "s"
select sum(sal) from employees where department_id in (1,3) and job like "s%";
#display the total sal given in esch dept
select department_id,sum(sal) from employees group by department_id;
#dislplay the no of employees havinh cahracter "a" in each job
select job,count(*) from employees where e_name like "%a%" group by job;
#count the  uumber of employees who hav asalary between 500000 and 10000 grouped by department
select  department_id,count(*) from employees where sal between 50000 and 100000 group by department_id;
select * from employees;
#find tptal sal of employees who were hired after 2020 and whosw name contains letter "a" grouped  by dept
select  department_id,sum(sal) from employees where hire_date>2020 and e_name like "%a%" group by department_id;
# calculate avg salry and total no of emloyees i each dept,displayig both result
select department_id as departmentid,avg(sal)as average_salary,count(*) as no_of_employees from employees group by department_id;
# display the no of depts in emp tables;
select count(distinct department_id) as departmentno from employees;
#display the total salary given to each dept
select department_id,sum(sal)from employees group by department_id;
#display the o of employees having character "A" in each job;
select job,count(*) from employees where e_name like "%A%" group by job;
#having clause 
-- whewre cannot include 
-- used to filter out the progress;
-- we can pass multiple condition
-- mutiple conditions are seperated using and ,or 
-- it executes only after group by 
#display the no of employees and their depts where there atleast 3 employees ij each other
select department_id,count(*) as noo_femp from employees group by department_id having count(*)>=3;
-- execution order
-- from,groupby,having,select
#display the no of employees and who are workimg in solar project and has max salary>70000;
select count(*),max(salary) from employees where project_id=1 having  max(salary)>40000;
select * from employees;
select count(*),salary from employees where project_id=1 and salary>70000 group by salary;
#display the no of employees and dept, if there are atleast 3 employees in each department whose name has character a or s;
select department_id,count(*) from employees where e_name like  "%a%" or "%s%" group by department_id having count(*)>=3;
# between  max and min sal for each depaart where the job contai s engineer;
select max(salary)- min(salary) from employees where job like "%engineer%" group by department_id;
select * from employees 
#list the projects where the max sal of employees working i the project is greater then 85,000 and total sal is less than 250000
select project_id,max(salary),sum(salary) from employees group by project_id having max(salary)>85000 and sum(salary)<250000;
#calculate the avg sal for employees hired before hanuary1,2020 grouped by deprtment,but  exclude department with ids greater than 2;
select department_id,avg(salary) from employees where hire_date<"2020-1-1" and project_id <=2 group by department_id;
#order by clause;
-- used to araange the data in ascending or descending order
-- by default arranges in ascending order
-- to arange in descending order make use of keyword desc
use company;
select * from employees order by e_name;
select * from employees order by e_name desc;
#default asc
#salary in asc
select salary from employees order by e_name;
select salary from employees order by e_name asc;

#salary in desc
select salary from employees order by e_name desc;
select * from employees order by hire_date asc,salary desc;
update employees set hire_date="2018-11-22" where employee_id=3;
select * from employees;
select * from employees order by hire_date asc,salary desc;
# retreive the totl number of emloyees in each department wgose salry is greater than 60000 only include departmments with more than 3 employees . sort the result by the total  umber of employees in descending order
select department_id,count(*) from employees where salary>60000 group by department_id having count(*)>3 order by count(*)desc;
-- list the departments where the sum of salary is between 200000 and 50000 for employees who joined before 2021 order the department by the sum of sal in ascending
select  department_id,sum(salary) from employees where hire_date<"2021-1-1"  group by department_id having sum(salary) between 200000 and 500000 order by sum(salary) desc;
select sum(salary),department_id from employees group by department_id having sum(salary) between 200000 and 500000;
#single row
#string function
#1.concat()
select e_name,job,concat(e_name,job) as fullname from employees;
select e_name,if(gender="female",concat("ms",e_name),concat("mr",e_name)) as name from employees;
select e_name,concat("employee ",e_name) as naem from employees;
alter table employees add column fullname varchar(300);
select * from employees;
update employees set fullname =concat("miss ",e_name) ;
SET SQL_SAFE_UPDATES = 0;
select * from employees;
-- 2.lower()
select lower("SHAKIRA");
select *,lower(e_name) from employees;
-- 3.upper
select e_name,upper(job) as jobb from employees; 
-- 4.length
select e_name,length(e_name) as name_length from employees;
select * from employees where  length(e_name)>=6;
-- substring
select substring("hello world",2,4);  -- 2 is starting number and 4 as last number
select  e_name,substring(e_name,1,3) from employees;
-- TRIM
select trim(" hello world ") as trimmed;
-- ltrim
select ltrim(" hello world ") as trimmed;
-- rtrim
select rtrim(" hello world ") as trimmed;
-- replace (col,org strring,replac string)
 select job, replace(e_name,"Suhana","yankee") from employees;
-- select * from employees;
-- instr(find position of substring within the string)
select e_name,instr(e_name,"a") as position from employees;
-- reverse
select reverse(e_name) from employees;
-- lpad
select e_name,lpad(e_name,15,"*") from employees;
-- rpad
select e_name,rpad(e_name,15,"*") from employees;
-- dispkay the name of emp in upper cse if their salary is greater than 70000 otherwise display in lowercase
select if(salary>70000,upper(e_name),lower(e_name)) from employees;
-- show the details of employees whose name contains teh substring "an" starting from the 4th char
select * from employees where substring(e_name,4,2)="an"; -- 4 starting from 4th chara -- 2 lenghth
-- display teh sal of employees whose name contains "i" dtsrting from second pos
select e_name,sal from employees where substring(e_name,2,1)="i"; 
select * from employees;
-- numeric functions
-- 1.ceil- increase 
select ceil(34.1);
select ceil(34.9);
select e_name,ceil(salary/55)*2 as round from employees;
-- floor() - same
select floor(34.1);
select floor(34.9);
select e_name,floor(salary/55)*2 as round from employees;
-- round() - 5 and after 5 increase, before 5 same
select round(34.5);
select round(34.1);
select round(34.9);
select round(34.5000,2);
select round(34.5000,3);
select e_name,round(salary/55)*2 as round from employees;
-- sqrt
select sqrt(4);
select sqrt(salary) from employees;
-- power
select power(4,3);
select mod
-- mod()
select curdate() as current;
-- curtime()
select curtime() as time;
-- now
select now() as currentdateandtime
-- in table
-- date()
select name, date(hire_date) as hire_date_only from employees;



select * from employees where job=( select job from employees where e_name='Nikhil George');
select * from employees;
use company;
select * from employees;
# display all the employee whose salry is higher than avg salary across all dept
select * from employees where salary >(select avg(salary )from employees );
# find the  employee whose job title conation word engineer and who have higher salary than all avg salary of engineers
select * from employees where job like "&Engineer&" and salary > (select avg (salary ) from employees where job like "&Engineer&");
#find employee who has same hiredate as afsal
select * from employees where hire_date=(select hire_date from employees where e_name='Afsal');
select * from employees where department_id = (select department_id from employees where e_name='Meheza' )and salary >(select salary from employees where e_name='Meheza');
select max(salary) from employees;
#second highest salary
select max(salary) from  employees where salary<(select max(salary )from employees);
#third lowest 
select min(salary) from employees where salary >(select min (salary )from employees where salary >(select min (salary )from employees));
#or
select salary from employees order by salary asc limit 1 offset 2;
#find employee who is hired recently
select * from employees order by hire_date desc limit 1;
# display all the employee who belong to dept that have fewer than 3 employee
select * from employees where department_id in (select department_id from employees group by department_id having count(*)<3);
# display the names of the employee who where hired last and have the highest salary 
# find the employee who have been working in the company longest 
#display the employee with the lowest salary in the 4th department
select * from employees where hire_date in (select max(hire_date) from employees order by hire_date)and salary >(select max(salary) from employees);
#find the employee who have been working in the company longest
select * from employees order by hire_date asc limit 1;
# display the employee with the lowest salary in the 4th department 
select * from employees;
-- find the name and salary of employee who earns more than any employee in department 2
select  e_name,salary from employees where salary>any(select salary from employees where department_id='2');
-- display names and salary employee who are earning less than all employees in the designated engineer 
select e_name ,salary from employees where salary <all(select salary from employees where job like"%Engineer%");
-- display the employees whose salary is not equal to any manager
select * from employees where salary != any (select salary from employees where job like "%manager");
 -- CASE 2: when data to be found is in another table
 -- find the employee with the lowest salary in "marketing"
 select * from employees where salary=(select min(salary) from employees where department_id=(select department_id from departments where department_name='Marketing'));
 -- list the names of employee who are in finance department
 select * from employees where department_id= (select department_id from departments  where department_name ="finance");
 -- display the project names where the employees earn more than 80000
 select project_name from projects where project_id in (select project_id from employees where salary >80000);
-- display the employees who work on projects with budget more than 300000
select * from employees where department_id in (select department_id from employees where salary>300000);
-- display the employyes whose sal is greater than average sal in the HR dept
select * from employees where salary>(select avg(salary) from employees where department_id=(select department_id from departments where department_name='HR')); 
-- display the employyes who are working in infopark kochi
select * from employees where department_id in (select department_id from departments where location ="info park kochi");
-- display location of employyess whose is working in project nexus
select location from departments where department_id=(select department_id from projects where project_name="project nexus");
-----------           GRAND AND REVOKE        ---------
# granting specific privilages on a table in the company database 
GRANT SELECT,INSERT,UPDATE,DELETE ON company.employees TO'root'@'localhost'; 
#granting all privilages on the entire company database
GRANT ALL PRIVILEGES ON company.employees TO'root'@'localhost';
FLUSH privileges;
REVOKE SELECT,UPDATE ON company.employees from 'root'@'localhost';
select * from employees;
-- always apply changes with flush privileges to ensure they take immediately.
-- REVOKE ALL PRIVILEGES ON COMPANY.EMP FROM 'ROOT'@'LOCALHOST';
REVOKE SELECT,INSERT,UPDATE,DELETE ON company.employees FROM 'root'@'localhost';
#REVOKE ALL TABLE ON DATABASE.TABLE FROM username@hoat
# alter table employees add column gender varchar(5);
select * from employees; 
alter table employees rename to emp;
select * from emp;
use company;
select * from framingham;