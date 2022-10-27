CREATE TABLE employees(
   emp_id int primary key,
   emp_name varchar(15),
   job_name varchar(10),
   manager_id int,
   hire_date date,
   salary decimal(10,2),
   commission  decimal(7,2),
   dep_id  int);
   insert into employees
  values(68319,'KAYLING','PRESIDENT',null,'1991-11-18',6000.00,null,1001),
        (66928,'BLAZE','MANAGER',68319,'1991-05-01',2750.00,null,3001),
		(67832,'CLARE','MANAGER',68319,'1991-06-09',2550.00,null,1001),
		(65646,'JONAS','MANAGER',68319,'1991-04-02',2957.00,null,2001),
		(67858,'SCARLET','ANALYST',65646,'1997-04-19',3100.00,null,2001),
		(69062,'FRANK','ANALYST',65646,'1991-12-03',3100.00,null,2001),
		(63679,'SANDRINE','CLERK',69062,'1990-12-18',900.00,null,2001),
		(64989,'ADELYN','SALESMAN',66928,'1991-02-20',1700.00,400.00,3001),
		(65271,'WADE','SALESMAN',66928,'1991-02-22',1350.00,600.00,3001),
		(66564,'MADDEN','SALESMAN',66928,'1991-09-28',1350.00,1500.00,3001),
		(68454,'TUCKER','SALESMAN',66928,'1991-09-08',1600.00,0.00,3001),
		(68736,'ADNRES','CLERK',67858,'1997-05-23',1200.00,null,2001),
		(69000,'JULIUS','CLERK',66928,'1997-05-23',1200.00,null,3001),
		(69324,'MARKER','CLERK',67832,'1992-01-23',1400.00,null,1001);
SELECT * from employees;

CREATE TABLE salary_grade(
  grade int  primary key,
  min_salary int,
  max_salary int
  );
  insert into Salary_grade
  values(1,800,1300),
      (2,1301,1500),
	  (3,1501,2100),
	  (4,2101,3100),
	  (5,3101,9999);
CREATE TABLE department(
  dep_id int,
  dep_name varchar(20),
  dep_location  varchar(15),
  );
   insert into department 
  values(1001,'FINANCE','SYDNEY'),
  (2001,'AUDIT','MELBOURNE'),
  (3001,'MARKETING','PERTH'),
  (4001,'PRODUCTION','BRISBANE');
  SELECT * from salary_grade;
 SELECT* from department;
1)SELECT * from employees;

2)SELECT salary from employees;

3) SELECT distinct job_name from employees;

 4)SELECT emp_name, format(1.15*salary,'C') AS "Salary" FROM employees;

  5)SELECT  emp_name  +space(1) +job_name AS "Employee & Job" from employees;

  6)SELECT emp_id,emp_name,salary,FORMAT(hire_date,'MMMM dd,yyyy')as "hire date" from employees;

  7) SELECT  LEN(emp_name)   from employees;


   8)SELECT emp_id,salary ,commission  from employees;

    9) SELECT * from   employees   WHERE  dep_id  NOT IN(2001);

	  10)SELECT * from employees  WHERE hire_date<'1991';

	   11)SELECT  avg(salary) as "AVG"  from employees  WHERE (job_name='ANALYST');

	   12)SELECT * from employees  WHERE(emp_name='Blaze');

	   13) SELECT * from  employees  WHERE(1.25*salary)>3000;

	    14)SELECT * from employees  WHERE MONTH(hire_date)=01;


	15) SELECT emp_id,emp_name,hire_date,salary from employees WHERE(hire_date<'1991-04-01');

	
	16)SELECT e.emp_name,e.salary from employees e,Salary_grade s  WHERE e.emp_name='FRANK' AND e.salary BETWEEN s.min_salary AND s.max_salary AND e.salary=s.max_salary;

	17)SELECT * from  employees  WHERE job_name NOT IN('PRESIDENT','MANAGER') ORDER BY Salary ASC; 

	18)SELECT MAX(salary) As MAX from employees;

	19)SELECT job_name,avg(salary) as "avg",avg(salary+commission) as "avg" from employees GROUP By job_name;

  20)SELECT e.emp_name,d.dep_id ,d.dep_location,d.dep_name from employees e,department d WHERE e.dep_id=d.dep_id and e.dep_id in('1001','2001');

 21)SELECT w.manager_id,count(*) from employees w, employees m  WHERE w.manager_id =m.emp_id GROUP BY w.manager_id ORDER BY w.manager_id ASC;

 22)SELECT dep_id,COUNT(*) from employees GROUP BY dep_id HAVING  count(*)>=2;

 23)SELECT * from  employees WHERE emp_name LIKE '%AR%';
  
 24) ALTER TABLE employees ADD gender varchar(20);
  SELECT * from employees;

  UPDATE employees set gender='MALE' WHERE  emp_id IN ('68319','66928','65646','69062','68454','69324'); 

  UPDATE employees set gender='FEMALE' WHERE emp_id NOT IN('68319','66928','65646','69062','68454','69324');
  SELECT * from employees;

  25)SELECT * from employees where job_name NOT IN('MANAGER ','PRESIDENT');

  26) select job_name,
   case
     when job_name in ('PRESIDENT','MANAGER','ANALYST') then 'Management Level'
    when  job_name in ('SALESMAN','CLERK') then 'Employee Level'
   end as 'label'
   from employees;
27)update employees set commission =650.00  where job_name='ANALYST' and exists(select job_name from employees where job_name='ANALYST');
  SELECT * from employees;
