use Assignment2
create table Students(
student_id int Primary Key,
first_name varchar(20),
last_name varchar(20),
date_of_birth date,
email varchar(30),
phone_number int)
 create table Courses(
course_id int Primary Key,
course_name varchar(20),
credits int,
teacher_id int references Teacher(teacher_id))
create table Enrollments(
enrollment_id int Primary Key,
student_id int references Students(student_id),
course_id int references courses(course_id),
enrollment_date date)
create table Teacher(
teacher_id int Primary Key,
first_name varchar(20),
last_name varchar(20),
 email varchar(40))
create table Payments(
payment_id int Primary Key,
student_id int references Students(Student_id),
 amount int,
payment_date date)

insert into students values (1,'John',	'Doe',	'1998-05-20',	'john.doe@example.com',	123456)
insert into students values (2,	'Emily'	,'Smith',	'1999-09-15',	'emily.smith@example.com',	234567)
insert into students values (3	,'Michael'	,'Johnson'	,'2000-03-10'	,'michael.j@example.com	',345678)
insert into students values (4,	'Sarah',	'Brown',	'1997-11-25',	'sarah.b@example.com',	456789)
insert into students values (5	,'David',	'Martinez'	,'1996-07-08',	'david.m@example.com',	567890)
insert into students values (6	,'Jessica'	,'Lee'	,'1999-01-30'	,'jessica.lee@example.com',	678901)
insert into students values (7	,'Daniel'	,'Wang',	'2001-08-12',	'daniel.wang@example.com'	,789012)
insert into students values (8,	'Olivia',	'Nguyen',	'1998-04-05'	,'olivia.nguyen@example.com',	890123)
insert into students values (9	,'Ethan'	,'Kim',	'1997-12-18',	'ethan.kim@example.com',	901234)
insert into students values (10	,'Sophia',	'Garcia'	,'2000-06-29'	,'sophia.garcia@example.com',3456789)


insert into Teacher values (101,'Virat' ,'Kohli','Virat@gmail.com')
insert into Teacher values (102,'Steve' ,'Smaith','Smaith@gmail.com')
insert into Teacher values (103,'Sachin' ,'T','Sachin@gmail.com')
insert into Teacher values (104,'Suresh' ,'Raina','Suresh@gmail.com')
insert into Teacher values (105,'Ashish' ,'Nehra','Ashish@gmail.com')
insert into Teacher values (106,'Sushant' ,'Singh','Sushant@gmail.com')
insert into Teacher values (106,'Ravi' ,'Shastri','Ravi@gmail.com')
insert into Teacher values (107,'Rohit' ,'Sharma','Rohit@gmail.com')
insert into Teacher values (108,'Hardik' ,'Pandya','Hardik@gmail.com')
insert into Teacher values (109,'Krunal' ,'PAndya','Krunal@gmail.com')
insert into Teacher values (110,'Shbman' ,'Gill','Shbman@gmail.com')
Select * from teacher

insert into Courses values (1001,'Electronics' ,10,110)
insert into Courses values (1002,'Science' ,12,101)
insert into Courses values (1003,'Computer' ,11,105)
insert into Courses values (1004,'Mech' ,7,107)
insert into Courses values (1005,'Graphics' ,4,106)
insert into Courses values (1006,'AI' ,8,110)
insert into Courses values (1007,'ML' ,10,103)
insert into Courses values (1008,'Electrical' ,1,108)
insert into Courses values (1009,'Maths' ,2,109)
insert into Courses values (1010,'AIML' ,10,108)

insert into Enrollments values(10001,10,1009,'2012-12-12')
insert into Enrollments values(10002,9,1006,'2012-12-12')
insert into Enrollments values(10004,8,1005,'2012-12-12')
insert into Enrollments values(10005,7,1004,'2012-12-12')
insert into Enrollments values(10006,6,1003,'2012-12-12')
insert into Enrollments values(10007,5,1009,'2012-12-12')
insert into Enrollments values(10008,4,1001,'2012-12-12')
insert into Enrollments values(10009,3,1003,'2012-12-12')
insert into Enrollments values(10010,2,1002,'2012-12-12')
insert into Enrollments values(10003,1,1007,'2012-12-12')


insert into payments values(100001,10,10000,'2012-11-12')
insert into payments values(100002,8,10100,'2012-11-12')
insert into payments values(100003,9,10200,'2012-7-12')
insert into payments values(100004,7,10500,'2012-8-12')
insert into payments values(100005,6,20000,'2012-11-12')
insert into payments values(100006,4,10000,'2012-11-12')
insert into payments values(100007,5,60000,'2012-10-12')
insert into payments values(100008,3,80000,'2012-10-12')
insert into payments values(100009,2,1000,'2012-11-12')
insert into payments values(100010,1,100000,'2012-11-12')

select * from Teacher
select * from Courses
select * from Payments
select * from Students
select * from Enrollments
3. Update the email address of a specific teacher in the "Teacher" table. Choose any teacher and
modify their email address.

Update Teacher 
set first_name='Shubman'
where first_name='Shbman'

5. Update the "Courses" table to assign a specific teacher to a course. Choose any course and
teacher from the respective tables.

Update Courses 
set teacher_id='102'
where course_id='1001'

7. Update the payment amount for a specific payment record in the "Payments" table. Choose any
payment record and modify the payment amount.

Update payments 
set amount=amount*2
where amount<5000

6. Delete a specific student from the "Students" table and remove all their enrollment records
from the "Enrollments" table. Be sure to maintain referential integrity.

ALTER TABLE Enrollments
ADD CONSTRAINT constraint_name
FOREIGN KEY (foreign_key_column)
REFERENCES referenced_table(referenced_column)
ON DELETE CASCADE;











1. Write an SQL query to calculate the total payments made by a specific student. You will need to
join the "Payments" table with the "Students" table based on the student_ID

Select Student_id,Sum(Amount) from Payments
group by student_id;

2. Write an SQL query to retrieve a list of courses along with the count of students enrolled in each
course. Use a JOIN operation between the "Courses" table and the "Enrollments" table.

Select courses.course_name,count(courses.course_id) as total_students from courses inner join Enrollments on  
 Enrollments.course_id=courses.course_id
 group by courses.course_name



 3. Write an SQL query to find the names of students who have not enrolled in any course. Use a
LEFT JOIN between the "Students" table and the "Enrollments" table to identify students
without enrollments.

Select * from Students
Select * from courses
Select * from Enrollments

Select CONCAT(first_name,' ',last_name),enrollment_id 
from Students left outer join Enrollments
on Students.student_id = Enrollments.student_id
where Enrollments.student_id is null

4. Write an SQL query to retrieve the first name, last name of students, and the names of the
courses they are enrolled in. Use JOIN operations between the "Students" table and the
"Enrollments" and "Courses" tables.

SELECT 
   CONCAT(first_name,' ',last_name) AS FullName,
  Courses.course_name
  
FROM 
   Enrollments
INNER JOIN 
   Courses ON Enrollments.course_id = courses.course_id
INNER JOIN 
   Students ON Enrollments.student_id = students.student_id;


5. Create a query to list the names of teachers and the courses they are assigned to. Join the
"Teacher" table with the "Courses" table.

SELECT 
   CONCAT(first_name,' ',last_name) AS FullName,
  Courses.course_name  
FROM 
   Teacher
INNER JOIN 
   Courses ON teacher.teacher_id = courses.teacher_id


6. Retrieve a list of students and their enrollment dates for a specific course. 
You will need to join the "Students" table with the "Enrollments" and "Courses" tables.


SELECT 
   CONCAT(first_name,' ',last_name) AS FullName,course_name,
  Enrollments.enrollment_date
  
FROM 
   students
INNER JOIN 
   enrollments ON Enrollments.student_id = students.student_id
INNER JOIN 
   courses ON courses.course_id = Enrollments.course_id;


   select * from Teacher
select * from Courses
select * from Enrollments
select * from Students
select * from Payments

7. Find the names of students who have not made any payments. Use a LEFT JOIN between the
"Students" table and the "Payments" table and filter for students with NULL payment records.


Select CONCAT(first_name,' ',last_name),amount
from Students left outer join Payments
on Students.student_id = Payments.student_id
where amount is null


8. Write a query to identify courses that have no enrollments. You will need to use a LEFT JOIN
between the "Courses" table and the "Enrollments" table and filter for courses with NULL
enrollment records.

Select Courses.course_name,student_id
from Courses left outer join Enrollments
on Courses.course_id = Enrollments.course_id
where student_id is null

9. Identify students who are enrolled in more than one course. Use a self-join on the "Enrollments"
table to find students with multiple enrollment records.






Task 4. Subquery and its type:
1. Write an SQL query to calculate the average number of students enrolled in each course. Use
aggregate functions and subqueries to achieve this.

Select course_id,
count(student_id)*100/(select count(enrollment_id) from Enrollments) 
from Enrollments 
group by course_id

2. Identify the student(s) who made the highest payment. Use a subquery to find the maximum
payment amount and then retrieve the student(s) associated with that amount.


Select * from Students where student_id=(
Select student_id from Payments
where amount=(select max(amount) from Payments))

3. Retrieve a list of courses with the highest number of enrollments. Use subqueries to find the
course(s) with the maximum enrollment count.

SELECT c.course_name, COUNT(e.course_id) AS enrollment_count
FROM Courses c
INNER JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_name
HAVING COUNT(e.course_id) = (
    SELECT MAX(enrollment_count)
    FROM (
        SELECT course_id, COUNT(*) AS enrollment_count
        FROM Enrollments
        GROUP BY course_id
    ) AS subquery
);

4. Calculate the total payments made to courses taught by each teacher. Use subqueries to sum
payments for each teachers courses.

select * from Teacher
select * from Payments
select * from Courses
select * from Students
select * from Enrollments

SELECT t.teacher_id, t.first_name, t.last_name, SUM(p.amount) AS total_payments
FROM Teacher t
INNER JOIN Courses c ON t.teacher_id = c.teacher_id
INNER JOIN Enrollments e ON c.course_id = e.course_id
INNER JOIN Payments p ON e.student_id = p.student_id
GROUP BY t.teacher_id, t.first_name, t.last_name;




5. Identify students who are enrolled in all available courses. Use subqueries to compare a
students enrollments with the total number of courses.

SELECT student_id, first_name, last_name
FROM Students
WHERE (
    SELECT COUNT(DISTINCT course_id)
    FROM Courses
) = (
    SELECT COUNT(DISTINCT course_id)
    FROM Enrollments
    WHERE Enrollments.student_id = Students.student_id
);

6. Retrieve the names of teachers who have not been assigned to any courses. Use subqueries to
find teachers with no course assignments.

SELECT first_name, last_name
FROM Teacher
WHERE teacher_id NOT IN (
    SELECT DISTINCT teacher_id
    FROM Courses
);


7. Calculate the average age of all students. Use subqueries to calculate the age of each student
based on their date of birth.

SELECT AVG(age) AS average_age
FROM (
    SELECT DATEDIFF(YEAR, date_of_birth, GETDATE()) AS age
    FROM Students
) AS student_ages;




8. Identify courses with no enrollments. Use subqueries to find courses without enrollment
records.

SELECT course_id, course_name
FROM Courses
WHERE course_id NOT IN (
    SELECT course_id
    FROM Enrollments
);


9. Calculate the total payments made by each student for each course they are enrolled in. Use
subqueries and aggregate functions to sum payments.



10. Identify students who have made more than one payment. Use subqueries and aggregate
functions to count payments per student and filter for those with counts greater than one.

SELECT student_id, first_name, last_name
FROM Students
WHERE student_id IN (
    SELECT student_id
    FROM Payments
    GROUP BY student_id
    HAVING COUNT(*) > 1
);


11. Write an SQL query to calculate the total payments made by each student. Join the "Students"
table with the "Payments" table and use GROUP BY to calculate the sum of payments for each
student.


SELECT Students.student_id, Students.first_name, Students.last_name, SUM(Payments.amount) AS total_payments
FROM Students 
LEFT JOIN Payments  ON Students.student_id = Payments.student_id
GROUP BY Students.student_id, Students.first_name, Students.last_name;

12. Retrieve a list of course names along with the count of students enrolled in each course. Use
JOIN operations between the "Courses" table and the "Enrollments" table and GROUP BY to
count enrollments.

SELECT c.course_name, COUNT(e.student_id) AS enrollment_count
FROM Courses c
LEFT JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_name;

13. Calculate the average payment amount made by students. Use JOIN operations between the
"Students" table and the "Payments" table and GROUP BY to calculate the average.

SELECT AVG(Payments.amount) AS avg_amt
FROM Payments 
INNER JOIN Students  ON Payments.student_id = Students.student_id;