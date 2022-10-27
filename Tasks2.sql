CREATE TABLE Salesman(
salesman_id int  Primary key,
name varchar(20),
city varchar(15),
commission decimal(7,2)
);
insert into Salesman
     values(5001,'James Hoog','New York',0.15),
	        (5002,'NAil knite','Paris',0.13),
			 (5005,'Pit Alex','London',0.11),
			 (5006,'Mc Lyon','PAris',0.14),
			 (5007,'Paul Adam','Rome',0.13),
			 (5003,'LAuson','San Jose',0.12);
			 select * from Salesman
CREATE TABLE Customer(
  customer_id  int,
  cust_name varchar(20),
  city VARCHAR(20),
  grade  int,
  salesman_id int);

  insert into Customer
    values(3002,'Nick Rimando','New York',100,5001),
	       (3007,'Brad Davis','New York',200,5001),
		    (3005,'Graham Zusi','California',200,5002),
			(3008, 'Julian Green','London',300,5002),
            (3004,'Fabian Johnson','Paris',300,5006),
			(3009,'Geoff Cameron','Berlin',100,5003);
select  * from Customer
1) select c.cust_name,s.name,s.city from Salesman s, Customer c  where c.city=s.city;

2)select c.cust_name,s.name from Salesman s,Customer c   where c.salesman_id=s.salesman_id;

CREATE TABLE Foods(
  Item_id int,
  item_name varchar(20),
  item_unit varchar(20),
  company_id  int);
    insert into Foods 
  values(1,'Chex Mix','Pcs',16),
  (6,'Cheez -It','Pcs',15),
  (2,'BN Biscuit','Pcs',15),
  (3,'Mighty Munch','Pcs',17),
  (4,'Pot Rice','Pcs',15),
  (5,'Jaffa Cakes','Pcs',18),
  (7,'Salt n Shakes','Pcs',null);
  select  * from Foods
 
 CREATE TABLE Company(
 company_id int,
 company_name Varchar(20),
 company_city varchar(15));

 insert into Company 
 values(18,'Order All','Boston'),
 (15,'Jack HIll Ltd','London'),
 (16,'Akas Foods','Delhi'),
 (17,'Foodies','London'),
 (19,'sip-n-Bite','New York');
 select * from Company

 3)Select c.company_id,c.company_name,f.company_id,f.item_name,f.item_unit  from Company c left join Foods f on c.company_id=f.company_id;
 

 CREATE TABLE Counter_sale(
   Bill_no int,
   item_id  int,
   SL_QTY int,
   SL_RATE int,
   BILL_AMT  int);

   insert into Counter_sale 
   Values(1003,6,15,20,300),
         (1004,4,18,30,540),
		 (1005,7,10,60,600),
		 (1006,3,25,25,625),
		 (1001,4,20,30,600),
		 (1002,1,40,50,2000);
select * from Counter_sale

4)select b.Bill_no, f.item_name, b.BILL_AMT from Counter_sale b LEFT JOIN Foods f ON  b.item_id=f.Item_id where b.BILL_AMT>500;

5)SELECT  b.Bill_no,f.Item_name,c.company_name,c.company_city,b.BILL_AMT from Counter_sale b  LEFT JOIN Foods f ON b.item_id=f.Item_id
  LEFT JOIN Company c ON c.company_id=f.company_id WHERE c.company_name is NOT NULL  ORDER BY b.Bill_no; 

  6)SELECT c.company_id,c.company_name,c.company_city, f.company_id,f.item_name FROM Company c RIGHT JOIN Foods f ON c.company_id=f.company_id;
 
 7)SELECT a.company_name ,a.company_city b.company_name FROM company a, company b WHERE a.company_city=b.company_city;


	
drop table Agent;
CREATE TABLE agent(
   Agent_code varchar(20),
	Agent_name  varchar(20),
	Working_Area varchar(20),
	Commission decimal(7,2),
	Phone_No varchar(20),
	Country  Varchar(30));
insert into agent
	values('A007','Ramasundar','Bangalore',0.15,'077-25814763','null'),
	       ('A003','Alex','London',0.13,'075-12458969','null'),
		   ('A008','Alford','New York',0.12,'044-25874365','null'),
		   ('A011','Ravi Kumar','Bangalore',0.15,'077-45625874','null'),
		   ('A010','Santakumar','Chennai',0.14,'007-22388644','null'),
		   ('A012','Lucida','San Jose',0.12,'044-52981425','null'),
		   ('A005','Anderson','Brisban',0.13,'045-21447739','null'),
		   ('A001','Subbarao','Bangalore',0.14,'077-12346674','null');

select * from agent

CREATE TABLE Orders(
        Ord_num int,
		Ord_Amount  int,
		Advance_Amount int,
		Ord_Date  Varchar(20),
		Cust_code varchar(15),
		Agent_code varchar(10),
		Ord_Description char(20));
insert into Orders
    values(200114,3500,2000,'15-AUG-08','C00002','A008',null),
	       (200122,2500,400,'16-SEP-08','C00003','A004',null),
		   (200118,500,100,'20-JUL-08','C00023','A006',null),
		   (200119,4000,700,'16-SEP-08','C00007','A010',null),
		   (200121,1500,600,'23-SEP-08','C00008','A004',null),
		   (200130,2500,400,'30-JUL-08','C00025','A011',null),
		    (200134,4200,1800,'25-SEP-08','C00004','A005',null),
			(200108,4000,600,'15-FEB-08','C00008','A004',null),
			  (200103,1500,700,'15-MAY-08','C00021','A005',null);
			  select * from Orders;

8)Select  ag.Agent_code,ag.Agent_name ,SUM(ob.Advance_Amount) AS "SUM(ob.Advance_Amount)"  FROM Orders ob,agent ag WHERE ag.Agent_code=ob.Agent_code GROUP BY ag.Agent_code,ag.Agent_name ORDER BY ag.Agent_code; 

9)ALTER TABLE Company ALTER  COLUMN company_id int NOT NULL ;
ALTER TABLE Company ADD PRIMARY KEY (company_id);

ALTER TABLE Foods ADD FOREIGN KEY (company_id) REFERENCES Company(company_id);

SELECT f.item_name,f.item_unit ,c.company_name,c.company_city FROM Foods f ,Company c WHERE  f.company_id=c.company_id AND c.company_city='LONDON';

CREATE TABLE Despatch(
  des_num  varchar(10),
  des_date varchar(20),
  des_amount int,
  ord_num int,
  ord_date varchar(20),
  ord_amount int,
  Agent_code varchar(10));
  insert into Despatch 
  values('D002','10-JUN-08',2000,200112,'30-MAY-08',2000,'A007'),
         ('D005','19-OCT-08',4000,200119,'16-SEP-08',4000,'A010'),
		 ('D001','12-JAN-08',3800,200113,'10-JUN-08',4000,'A002'),
		 ('D003','25-OCT-08',900,200117,'20-OCT-08',800,'A001'),
		 ('D004','20-AUG-08',450,200120,'20-JULY-08',500,'A002'),
		 ('D006','24-JUl-08',4500,200128,'20-JULY-08',3500,'A002');
select * from Despatch;
10)SELECT a.des_num,a.des_date ,SUM(b.Ord_Amount) As "SUM(b.Ord_Amount)" FROM Orders b,Despatch a WHERE a.ord_amount=b.Ord_Amount GROUP BY a.des_num,a.des_date;

11)SELECT Ord_num,Ord_Amount,Ord_Date,Cust_code,Agent_code FROM Orders WHERE Agent_code IN (Select Agent_code FROM agent WHERE Working_Area='Bangalore');

CREATE TABLE Customers(
 Cust_code varchar(20),
 Cust_name varchar(20),
 Cust_city varchar(15),
 Working_area  varchar(15),
 Cust_country varchar(10),
 grade int,
 Opening_Amt int,
 Receive_Amt  int);
 Drop Table Customers;
 CREATE TABLE Customers1(
 Cust_code varchar(20),
 Cust_name varchar(20),
 Cust_city varchar(15),
 Working_area  varchar(15),
 Cust_country varchar(10),
 grade int,
 Opening_Amt int,
 Receive_Amt  int);
 insert into Customers1 
 values('C00013','Holmes','London','London','UK',2,6000.00,5000.00),
       ('C00001','Micheal','New York','New York','USA',2,3000.00,5000.00),
	   ('C00020','Albert','New York','New York','USA',3,5000.00,7000.00),
	   ('C00025','Ravindran','Bangalore','Bangalore','India',3,5000.00,7000.00),
	   ('C00024','Cook','London','London','UK',2,4000.00,9000.00),
	   ('C00015','Stuart','London','London','UK',1,6000.00,8000.00),
	   ('C00002','Bolt','New York','New York','USA',3,5000.00,7000.00);
	   select * from Customers1;

12)SELECT  Cust_country, COUNT(grade) AS "COUNT(GRADE)" FROM Customers1 GROUP BY Cust_country HAVING COUNT(grade)>2;

