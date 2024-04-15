Tasks 1: Database Design:
1. Create the database named "HMBank"
2. Define the schema for the Customers, Accounts, and Transactions tables based on the
provided schema.
4. Create an ERD (Entity Relationship Diagram) for the database.
5. Create appropriate Primary Key and Foreign Key constraints for referential integrity.
6. Write SQL scripts to create the mentioned tables with appropriate data types, constraints,
and relationships.
• Customers
• Accounts
• Transactions


use BankingSystem
create table customers(customer_id int Primary Key,
first_name varchar(20),
last_name varchar(20),
DOB Date,
email varchar(20),
phone_number int,
address varchar(20)
)

create table Accounts(
account_id int Primary Key,
customer_id int references customers(customer_id),
account_type varchar(10),
balance int);

create table Transactions(
transaction_id int Primary Key,
account_id int references Accounts(account_id),
transaction_type varchar(20),
amount int,
transaction_date date)


Tasks 2: Select, Where, Between, AND, LIKE:
1. Insert at least 10 sample records into each of the following tables.
• Customers
• Accounts
• Transactions


insert into Customers values(1,'John','ABC','2001-01-01','JohnABC@gmail.com',246646,'Pune')
insert into Customers values(2,'Virat','Kohli','2002-01-01','Kohli@gmail.com',246746,'Chennai')
insert into Customers values(3,'Sachin','Tendulkar','2001-07-07','Tendulkar@gmail.com',246846,'Goa')
insert into Customers values(4,'Ravi','Bishnoi','2003-01-01','Bishnoi@gmail.com',346646,'Mumbai')
insert into Customers values(5,'Steve','Smith','2001-12-01','Smith@gmail.com',446646,'Pune')
insert into Customers values(6,'Rohit','Sharma','2002-11-01','Sharma@gmail.com',546646,'Mumbai')
insert into Customers values(7,'Chris','Gayle','2001-01-11','Gayle@gmail.com',646646,'Goa')
insert into Customers values(8,'Harbajan','Singh','1999-01-06','Singh@gmail.com',946646,'Pune')
insert into Customers values(9,'Jasprit','Bumrah','1998-05-01','Bumrah@gmail.com',116646,'Nagar')
insert into Customers values(10,'Shubman','Gill','1997-03-02','Gill@gmail.com',206646,'Nagpur')


insert into Accounts values(101,1,'savings,',50000)
insert into Accounts values(102,2,'zero_bal',60000)
insert into Accounts values(103,3,'current,',70000)
insert into Accounts values(104,4,'savings,',100000)
insert into Accounts values(105,5,'zero_bal',40000)
insert into Accounts values(106,6,'current',50000)
insert into Accounts values(107,7,'current',60000)
insert into Accounts values(108,8,'savings,',10000)
insert into Accounts values(109,9,'current',20000)
insert into Accounts values(110,10,'zero_bal',30000)

insert into Transactions values(1101,109,'deposit',10000,'2020-12-12')
insert into Transactions values(1102,109,'withdrawal',100000,'2020-12-12')
insert into Transactions values(1103,104,'transfer',20000,'2020-12-12')
insert into Transactions values(1104,105,'deposit',30000,'2020-12-12')
insert into Transactions values(1105,101,'deposit',70000,'2020-12-12')
insert into Transactions values(1106,101,'transfer',10000,'2020-12-12')
insert into Transactions values(1107,110,'transfer',80000,'2020-12-12')
insert into Transactions values(1108,101,'withdrawal',90000,'2020-12-12')
insert into Transactions values(1109,102,'deposit',10101,'2020-12-12')
insert into Transactions values(1110,106,'withdrawal',20202,'2020-12-12')


2. Write SQL queries for the following tasks:
1. Write a SQL query to retrieve the name, account type and email of all customers.

select first_name,last_name,
(select account_type from accounts
where customers.customer_id=accounts.customer_id) as AccType,
email from customers


2. Write a SQL query to list all transaction corresponding customer.

Select * from Transactions

3. Write a SQL query to increase the balance of a specific account by a certain amount.
select * from Accounts
update Accounts 
set balance=balance + 2000
where balance<11000

4. Write a SQL query to Combine first and last names of customers as a full_name.
Select concat(first_name,' ',last_name) as Full_Name From customers

5. Write a SQL query to remove accounts with a balance of zero where the account
type is savings.

delete from Accounts where balance=0 and account_type='savings,'

6. Write a SQL query to Find customers living in a specific city.

select * from customers where address = 'pune'

7. Write a SQL query to Get the account balance for a specific account.

Select balance from Accounts where account_id=101

8. Write a SQL query to List all current accounts with a balance greater than $1,000.

select * from accounts where balance>1000

9. Write a SQL query to Retrieve all transactions for a specific account. 

Select * from Transactions where amount=10000

10. Write a SQL query to Calculate the interest accrued on savings accounts based on a
given interest rate.

11. Write a SQL query to Identify accounts where the balance is less than a specified
overdraft limit.

Select * from Accounts where balance<12121

12. Write a SQL query to Find customers not living in a specific city.

Select * from customers where address not in ('pune')











Tasks 3: Aggregate functions, Having, Order By, GroupBy and Joins:
1. Write a SQL query to Find the average account balance for all customers.

Select sum(balance)/count(account_id) from Accounts

2. Write a SQL query to Retrieve the top 10 highest account balances.

Select * from Accounts
order by balance desc

3. Write a SQL query to Calculate Total Deposits for All Customers in specific date.

select sum(amount) as TotalDeposits from Transactions where transaction_type='deposit'

4. Write a SQL query to Find the Oldest and Newest Customers.


5. Write a SQL query to Retrieve transaction details along with the account type.

Select Transactions.transaction_id,Transactions.transaction_type,Accounts.account_type from Transactions 
inner join Accounts on Accounts.account_id=Transactions.account_id

6. Write a SQL query to Get a list of customers along with their account details.

Select customers.customer_id,Accounts.account_id,customers.first_name,customers.last_name,
customers.DOB,customers.email,customers.phone_number,customers.address,Accounts.account_type,Accounts.balance
from customers 
inner join Accounts on Accounts.customer_id=customers.customer_id

7. Write a SQL query to Retrieve transaction details along with customer information for a
specific account.

Select * from Accounts
Select * from customers
Select * from Transactions

Select * from Transactions inner join Accounts on
Transactions.account_id=Accounts.account_id
inner join customers on Accounts.customer_id=customers.customer_id
where accounts.account_id=110

8. Write a SQL query to Identify customers who have more than one account.

select customer_id   from accounts
group by customer_id
having count(customer_id)>0




9. Write a SQL query to Calculate the difference in transaction amounts between deposits and
withdrawals.

Select Sum(amount)-(Select Sum(amount) from Transactions where transaction_type='withdrawal') 
from Transactions where transaction_type='deposit'


10. Write a SQL query to Calculate the average daily balance for each account over a specified
period.

select * from Accounts
Select customer_id,sum(balance)/count(customer_id) as AverageBal from Accounts group by customer_id

11. Calculate the total balance for each account type.

Select account_type,sum(balance) from Accounts group by account_type


12. Identify accounts with the highest number of transactions order by descending order.

Select account_id,count(account_id) from Transactions
group by account_id
order by count(account_id) desc

13. List customers with high aggregate account balances, along with their account types.

select * from Accounts
where balance=(select max(balance) from Accounts)

14. Identify and list duplicate transactions based on transaction amount, date, and account.







Tasks 4: Subquery and its type:
1. Retrieve the customer(s) with the highest account balance.

Select * from Accounts
where balance =(Select max(balance ) from accounts)



2. Calculate the average account balance for customers who have more than one account.

Select customer_id,count(Customer_ID),sum(balance)/count(customer_id) from Accounts
group by customer_id



3. Retrieve accounts with transactions whose amounts exceed the average transaction amount.

Select * from accounts
where balance>(Select avg(balance) from Accounts)



4. Identify customers who have no recorded transactions.

select Accounts.account_id,count(Transactions.account_id) as TotalTransactions
from  Transactions right outer join accounts on Accounts.account_id=Transactions.account_id
group by Accounts.account_id
having count(Transactions.account_id) =0


5. Calculate the total balance of accounts with no recorded transactions.

select Accounts.account_id,sum(Accounts.balance) as Total_Balance
from  Transactions right outer join accounts on Accounts.account_id=Transactions.account_id
group by Accounts.account_id
having count(Transactions.account_id) =0

6. Retrieve transactions for accounts with the lowest balance.

Select * from accounts
where balance = (select min(balance) from accounts)


7. Identify customers who have accounts of multiple types.

Select 
(Select concat(first_name,' ',last_name) as FullName from customers
where customers.customer_id=Accounts.customer_id),customer_id from accounts 
group by customer_id
having count(customer_id)>1

8. Calculate the percentage of each account type out of the total number of accounts.

Select account_type,
count(account_id)*100/(Select count(account_id) from Accounts) as PercentageOfAcc from Accounts
group by account_type



9. Retrieve all transactions for a customer with a given customer_id.
 
Select * from customers
Select * from Accounts

DECLARE @customer_id INT; 
SET @customer_id = 1;
Select Accounts.customer_id,Accounts.account_id,Transactions.transaction_id,Transactions.transaction_type,Transactions.transaction_date,Transactions.amount
from Transactions inner join Accounts on
Transactions.account_id=Accounts.account_id
where customer_id= @customer_id
 




10. Calculate the total balance for each account type, including a subquery within the SELEC_t
clause.


