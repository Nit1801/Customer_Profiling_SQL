show databases;
create database Customer_profiling;
use Customer_profiling;

CREATE table Customers(
	CustomerID int primary key,
    FirstName varchar(50),
    LastName varchar(50),
    Email varchar(50),
    Gender varchar(10),
    Age int,
    City varchar(50),
    State varchar(50)
);

CREATE table Transactions(
	TransactionID int primary key,
    CustomerID int,
    TransactionDate DATE,
    Amount DECIMAL(10,2),
    Product varchar(100),
    Category varchar(50)
);

INSERT into Customers values
	(101, 'Michael' , 'Williams' , 'michael@example.com' , 'Male' , 25 , 'Chicago' , 'IL'),
    (102, 'Emily' , 'Davis' , 'emily@example.com' , 'Female' , 35 , 'Houston' , 'TX'),
    (103, 'David' , 'Miller' , 'david@example.com' , 'Male' , 28 , 'Miami' , 'FL'),
    (104, 'Sarah' , 'Brown' , 'sarah@example.com' , 'Female' , 22 , 'San Francisco' , 'CA'),
    (105, 'Daniel' , 'Jones' , 'daniel@example.com' , 'Male' , 40 , 'Seattle' , 'WA'),
    (106, 'Olivia' , 'Martinez' , 'olivia@example.com' , 'Female' , 29 , 'Boston' , 'MA'),
    (107, 'James' , 'Taylor' , 'james@example.com' , 'Male' , 31 , 'Denver' , 'CO'),
    (108, 'Sophia' , 'Anderson' , 'sophia@example.com' , 'Female' , 27 , 'Dallas' , 'TX'),
    (109, 'Ethan' , 'Johnson' , 'ethan@example.com' , 'Male' , 23 , 'Phoenix' , 'AZ'),
    (110, 'Ava' , 'Brown' , 'ava@example.com' , 'Female' , 26 , 'Atlanta' , 'GA'),
    (111, 'Liam' , 'Wilson' , 'liam@example.com' , 'Male' , 33 , 'Chicago' , 'IL'),
    (112, 'Emma' , 'Garcia' , 'emma@example.com' , 'Female' , 31 , 'Miami' , 'FL'),
    (113, 'Noah' , 'Lee' , 'noah@example.com' , 'Male' , 29 , 'Los Angeles' , 'CA'),
    (114, 'Olivia' , 'Smith' , 'olivia@example.com' , 'Female' , 28 , 'New York' , 'NY'),
    (115, 'William' , 'Davis' , 'william@example.com' , 'Male' , 27 , 'Houston' , 'TX');
    
INSERT INTO Transactions VALUES
	(221, 103, '2023-03-10', 90.00, 'Headphones', 'Electronics'),
	(222, 104, '2023-04-05', 120.00, 'Dress', 'Fashion'),
	(223, 105, '2023-05-15', 50.00, 'Books', 'Education'),
	(224, 106, '2023-06-20', 35.00, 'Sunglasses', 'Fashion'),
	(225, 107, '2023-07-08', 180.00, 'Laptop', 'Electronics'),
	(226, 108, '2023-08-12', 65.00, 'Jeans', 'Fashion'),
	(227, 109, '2023-09-25', 110.00, 'Smartwatch', 'Electronics'),
	(228, 110, '2023-10-30', 70.00, 'T-shirt', 'Fashion'),
	(229, 111, '2023-11-12', 25.00, 'Notebook', 'Education'),
	(230, 112, '2023-12-18', 40.00,'Sneakers', 'Fashion'),
	(231, 113, '2024-01-05', 60.00, 'Camera', 'Electronics'),
	(232, 114,'2024-02-20' , 80.00, 'Jacket', 'Fashion'),
	(233, 115, '2024-03-15', 70.00, 'Tablet', 'Electronics');

SELECT 
	case 
		WHEN Age<25 Then 'Young'
        WHEN Age BETWEEN 25 and 40 then 'Middle-aged'
        else 'Senior'
	End as AgeSegment,
    COUNT(*) as CustomerCount
from Customers
group by AgeSegment;

SELECT
	case 
		WHEN Age<25 Then 'Young'
        WHEN Age BETWEEN 25 and 40 then 'Middle-aged'
        else 'Senior'
	End as AgeSegment,
    Avg(Amount) as AverageTransactionAmount,
    COUNT(*) as TransactionCount
FROM Customers
JOIN Transactions on Customers.CustomerID = Transactions.CustomerID
group by Age;