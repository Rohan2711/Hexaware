use hexaware
;
create table Member(EmpID int primary key,EmpName varchar(20) Not Null,Salary int check(salary>5000),city varchar(20) default'Pune',DeptId int references Dept(DeptId));
create table Dept(DeptId int primary key,Dname varchar(20));

insert into Dept values (101,'Sales');
insert into Dept values (102,'Accounts');
insert into Dept values (103,'Technical');
insert into Dept values (104,'Non Tech');
insert into Dept values (105,'Sales');
Select * from Dept;
alter table Dept alter column DeptId int;











CREATE TABLE Employee1 (Empid int Primary key, Empname varchar(20) NOT NULL, Salary int check (Salary > 5000) , city varchar(10) default 'Pune', Deptid int references Dept(Deptid))

Insert into Employee1 values(1003,'ABC',8000,'MUMBAI',101)

Insert into Employee1 values(1005,'ABZ',9000,DEFAULT,105)
Insert into Employee1 values(1007,'Jack',10000,'Goa',105)

Insert into Employee1 values(1009,'John',40000,'Delhi',102)


Select * from Employee1
 

 
Select * from Dept

Select sum(Salary) as TotalSalary from Employee1

Select Max(Salary) as HighestSal from Employee1;

Select Min(Salary) as LowestSal from Employee1

Select Avg(Salary) as AverageSal from Employee1



Select abs(-101)
select square(100)
select radians(90)
Select sqrt (1010)
select ceiling(33.44)
Select FLOOR(202.7)

Select GETDATE()
Select year(GETDATE())
Select DATEDIFF(year, '2030-11-11',GETDATE())
Select DATEDIFF(day, '2030-11-11',GETDATE())




Select DATEADD(DAY,10,GETDATE())


create table Students(
   student_id int PRIMARY KEY,
   first_name varchar(20) Not null,
   last_name varchar(20) Not Null,
   date_of_birth date Not Null,
   email varchar(35) unique Not Null,
   phone_number int  Not Null)

Select * from Students

create table Courses (
   course_id INT PRIMARY KEY,
   course_name varchar(20) Not Null,
   instructor_name varchar(20) Not Null,
   start_date date Not Null,
   end_date date Not Null,
   CHECK (start_date < end_date))

   create table Enrollments (
   enrollment_id INT PRIMARY KEY,
   student_id int REFERENCES Students(student_id),
   course_id int REFERENCES Courses(course_id),
   enrollment_date date, )
 
 insert into Students values(101,'Rohan','Tagalpallewar','2001-11-27','Rohan@gmail.com',7620477)
 insert into Students values(102,'Ravi','ABC','2002-12-27','ABC@gmail.com',711111) 
 insert into Students values(103,'Rahul','XYZ','2003-03-12','Rahul@gmail.com',732132)
 insert into Students values(104,'Ramesh','MNO','2001-01-17','Ramesh@gmail.com',909090)
 insert into Students values(105,'Rajesh','X','2004-11-27','Rajesh@gmail.com',989898)

 insert into courses values(11,'Science','John','2011-11-30','2012-11-30')
insert into courses values(13,'Sci','JAy','2011-12-30','2012-12-30')
insert into courses values(12,'Engg','Jam','2010-11-30','2012-11-30')
insert into courses values(14,'MBA','Jack','2010-01-30','2012-01-30')
insert into courses values(15,'MBBS','Johnny','2013-11-30','2014-11-30')
 insert into Enrollments values (1111,101,11,'2011-11-30');
 insert into Enrollments values (1112,101,12,'2011-11-30');
 insert into Enrollments values (1113,101,13,'2011-11-30');
 insert into Enrollments values (1114,102,11,'2011-11-30');
 insert into Enrollments values (1115,103,14,'2011-11-30');

 Select  course_id , count(student_id ) from Enrollments Group By  course_id

 Select course_id,Count(student_id) from Enrollments 
 Group By  course_id
 Having Count(Student_id)>1;

 Select instructor_name,count(course_name) from Courses
 Group by instructor_name
  

Select  enrollment_id from Enrollments where enrollment_date<(Select GETDATE())

Select email,len(email) as StringLength from Students 

Select CONCAT(first_name,last_name) as Joined from Students

Select UPPER(instructor_name) as Caps from Courses




create table Employee2(
employee_id varchar(20), 
first_name varchar(20), 
last_name varchar(20),
department varchar(20),
position varchar(20),
salary int,
hire_date date);
insert into Employee2 values(101,'Virat','Kohli','Sales','Head',100000,'2011-12-12')
insert into Employee2 values(102,'Sachin','Tendulkar','Sales','Employee',10000,'2017-12-12')

insert into Employee2 values(103,'Suresh','Raina','Tech','Head',200000,'2012-12-12')

insert into Employee2 values(104,'Rohit','Sharma','Tech','Engineer',50000,'2016-12-30')

insert into Employee2 values(105,'Ashish','Nehra','Marketing','Head',100000,'2022-11-11')

Select * from Employee2 where first_name like 'S%'

Select * from Employee2 where first_name like 'Sachin'

Select * from Employee2 
where hire_date between '2000-11-11' and '2012-11-11'

Select * from Employee2 
where hire_date >'2000-11-11' and hire_date < '2012-11-11'

Select * from Employee2 
where Salary >0 and Salary < 100001
Select * from Employee2 
where position ='head' or position = 'Employee'

Select * from Employee2 
where department ='Sales' or department = 'Tech' or department='Marketing'
















