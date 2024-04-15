use HEXAWARE
Select * from Employee1
Select * from Dept

Select Empname,Dname from
Employee1 inner join Dept
on Employee1.Deptid=Dept.DeptId

Select Empname,Dname from
Employee1 left outer join Dept
on Employee1.Deptid=Dept.DeptId

Select Empname,Dname from
Employee1 right outer join Dept
on Employee1.Deptid=Dept.DeptId

Select Empname,Dname from
Employee1 full outer join Dept
on Employee1.Deptid=Dept.DeptId

Select E.Empid,E.Empname,E.Salary, d.DeptId,d.Dname 
from Employee1 E INNER JOIN DEPT d
on E.Deptid =d.Deptid

Select * from Employee CROSS JOIN Dept


create table Salaries(DeptID int,Sal int);
insert into Salaries values(101,10000)insert into Salaries values(102,20000)
insert into Salaries values(103,30000)
insert into Salaries values(104,40000)
insert into Salaries values(105,50000)
insert into Salaries values(106,60000)
Select * from Salaries



create table IDs(EmployeeID int,Name varchar(20),ManagerID int);
insert into IDs values(1,'John',6);
insert into IDs values(2,'Steve',5);
insert into IDs values(3,'James',4);
insert into IDs values(4,'Smaith',3);
insert into IDs values(5,'Harry',2);
insert into IDs values(6,'Jonny',1);

create database TechShop
use TechShop

create table Customers(
CustomerID int Primary Key,
FirstName varchar(20),
LastName varchar(20),
Email varchar(40),
Phone int,
Address varchar(40))


create table Products(
ProductID int Primary Key,
ProductName varchar(20),
Description varchar(40),
Price int)

create table  Orders(
OrderID int Primary Key,
CustomerID int references Customers(CustomerID),
OrderDate date,
TotalAmount int)

create table OrderDetails(
OrderDetailID int Primary Key,
OrderID int references Orders(OrderID),
ProductID int references Products(Productid),
Quantity int);


create table Inventory(
InventoryID int Primary Key,
ProductID int references Products(productid),
QuantityInStock int,
LastStockUpdate date)

insert into Customers values(1,'John','ABC','JohnABC@gmail.com',246646,'Pune')
insert into Customers values(2,'Virat','Kohli','Kohli@gmail.com',246746,'Chennai')
insert into Customers values(3,'Sachin','Tendulkar','Tendulkar@gmail.com',246846,'Goa')
insert into Customers values(4,'Ravi','Bishnoi','Bishnoi@gmail.com',346646,'Mumbai')
insert into Customers values(5,'Steve','Smith','Smith@gmail.com',446646,'Pune')
insert into Customers values(6,'Rohit','Sharma','Sharma@gmail.com',546646,'Mumbai')
insert into Customers values(7,'Chris','Gayle','Gayle@gmail.com',646646,'Goa')
insert into Customers values(8,'Harbajan','Singh','Singh@gmail.com',946646,'Pune')
insert into Customers values(9,'Jasprit','Bumrah','Bumrah@gmail.com',116646,'Nagar')
insert into Customers values(10,'Shubman','Gill','Gill@gmail.com',206646,'Nagpur')


insert into Products values(101,'Lenevo','Laptop',50000)
insert into Products values(102,'Dell','Laptop',60000)
insert into Products values(103,'HP','Laptop',70000)
insert into Products values(104,'MacBook','Laptop',100000)
insert into Products values(105,'Asus','Laptop',40000)
insert into Products values(106,'Apple','Mobile',50000)
insert into Products values(107,'Samsung','Mobile',60000)
insert into Products values(108,'Oppo','Mobile',10000)
insert into Products values(109,'Mi','Mobile',20000)
insert into Products values(110,'Viv0','Mobile',30000)


insert into orders values(1101,9,'2020-12-12',10000)
insert into orders values(1102,9,'2020-12-12',100000)
insert into orders values(1103,4,'2020-12-12',20000)
insert into orders values(1104,5,'2020-12-12',30000)
insert into orders values(1105,1,'2020-12-12',70000)
insert into orders values(1106,10,'2020-12-12',10000)
insert into orders values(1107,10,'2020-12-12',80000)
insert into orders values(1108,1,'2020-12-12',90000)
insert into orders values(1109,2,'2020-12-12',40000)
insert into orders values(1110,6,'2020-12-12',10000)


insert into OrderDetails values(2101,1101,101,100)
insert into OrderDetails values(2102,1102,101,202)
insert into OrderDetails values(2103,1103,101,200)
insert into OrderDetails values(2104,1104,107,2012)
insert into OrderDetails values(2105,1105,106,700)
insert into OrderDetails values(2106,1106,105,100)
insert into OrderDetails values(2107,1107,104,800)
insert into OrderDetails values(2108,1108,102,900)
insert into OrderDetails values(2109,1109,110,400)
insert into OrderDetails values(2110,1110,107,100)

insert into Inventory values(100001,101,100,'2010-12-12');
insert into Inventory values(100002,102,200,'2010-12-12');
insert into Inventory values(100003,103,300,'2010-12-12');
insert into Inventory values(100004,104,400,'2010-12-12');
insert into Inventory values(100005,105,500,'2010-12-12');
insert into Inventory values(100006,106,600,'2010-12-12');
insert into Inventory values(100007,107,700,'2010-12-12');
insert into Inventory values(100008,108,800,'2010-12-12');
insert into Inventory values(100009,109,900,'2010-12-12');
insert into Inventory values(100010,101,100,'2010-12-12');

Select * from Customers
Select * from Orders
Select * from OrderDetails
Select * from Inventory
Select * from Products

1. Write an SQL query to retrieve the names and emails of all customers.
Select firstname,lastname,email From Customers

2.Write an SQL query to list all orders with their order dates and corresponding customer names.

select customers.firstname,Orders.OrderID,Orders.OrderDate from Orders inner join Customers
on Orders.CustomerID=customers.CustomerID;

3.Write an SQL query to insert a new customer record into the "Customers" table. Include
customer information such as name, email, and address.


insert into Customers values(11,'David','Warner','Warner@gmail.com',546646,'Australia')

4. Write an SQL query to update the prices of all electronic gadgets in the "Products" table by
increasing them by 10%.

update  products 
set price = 1.1*price

Select * from Products

6. Write an SQL query to insert a new order into the "Orders" table. Include the customer ID,
order date, and any other necessary information

insert into orders values(1111,7,'2020-12-12',12000)

10. Write an SQL query to insert a new electronic gadget product into the "Products" table,
including product name, category, price, and any other relevant details.

insert into Products values(111,'Micromax','Mobile',5000)

12. Write an SQL query to calculate and update the number of orders placed by each customer
in the "Customers" table based on the data in the "Orders" table.

select CustomerID,count(OrderID) as TotalOrders from Orders group by customerID



Task 3. Aggregate functions, Having, Order By, GroupBy and Joins:
1. Write an SQL query to retrieve a list of all orders along with customer information (e.g.,
customer name) for each order.

select CONCAT(customers.firstname,' ',Customers.lastname) As FullName,Orders.OrderID,Orders.OrderDate from Orders inner join Customers
on Orders.CustomerID=customers.CustomerID;

2. Write an SQL query to find the total revenue generated by each electronic gadget product.
Include the product name and the total revenue.

select Products.ProductID,Products.price*Inventory.QuantityInStock As Totalrevenue from Products inner join Inventory
on Products.ProductID=Inventory.ProductID;

3.Write an SQL query to list all customers who have made at least one purchase. Include their
names and contact information.


select CONCAT(customers.firstname,' ',Customers.lastname)As FullName,Customers.Phone,count(customerId from Customers inner join orders
on Orders.CustomerID=customers.CustomerID
group by 


4. Write an SQL query to find the most popular electronic gadget, which is the one with the highest
total quantity ordered. Include the product name and the total quantity ordered.

Select ProductID,Sum(QuantityInStock) as Total from Inventory
Group by ProductID
order by Total desc;
Select * from Inventory