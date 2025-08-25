-- Creation Tables ------------- 

CREATE DATABASE RealEstate
USE RealEstate

-- creation Office Table
CREATE TABLE Office (
       Office_No int primary key ,
	   Location varchar (250)  not null
	   )

-- Creation employee table
create table employee (
       Employee_id int primary key,
	   Employee_name varchar (100) not null ,
	   Office_No int foreign key references Office (Office_No )
	  )

-- Creation owner table 
create table owner (
	   Owner_id int primary key ,
	   Owner_name varchar (100) not null  
	   )

-- Creation Property table
CREATE TABLE Property (
       Property_ID INT PRIMARY KEY,   
       Address VARCHAR(200) NOT NULL,
       City VARCHAR(50) NOT NULL,
       State VARCHAR(50) NOT NULL,
       Zip_Code VARCHAR(10) NOT NULL,
       Office_No INT NOT NULL foreign key references  Office (Office_No )
)

-- creation property table 
Create table Own_percentage (
       Owner_ID INT NOT NULL,
       Property_ID INT NOT NULL,
	   Percent_Owned DECIMAL(5,2) CHECK (Percent_Owned BETWEEN 0 AND 100),
       PRIMARY KEY (Owner_ID, Property_ID) ,
	   constraint Owner_id_fk foreign key (Owner_ID) references Owner(Owner_ID) ,
	   constraint Property_id_fk foreign key (Property_ID) references Property (Property_ID) 
	   )

Alter table Office add Manager_id int foreign key references employee(Employee_id)


-- Insert Data --

--Table Employee
INSERT INTO Employee (Employee_id , Employee_name) VALUES (101, 'John Smith')
INSERT INTO Employee (Employee_id , Employee_name) VALUES (102, 'Alice Johnson')
INSERT INTO Employee (Employee_id , Employee_name) VALUES (201, 'Michael Brown')


--Table Office 
INSERT INTO Office VALUES (1, 'New York',101)
INSERT INTO Office VALUES (2, 'California',101)

--Table Employee for office
UPDATE Employee
SET Office_No = 1
WHERE Employee_ID = 101

UPDATE Employee
SET Office_No = 2
WHERE Employee_ID = 102

UPDATE Employee
SET Office_No = 1
WHERE Employee_ID = 201


-- Table Property
INSERT INTO Property VALUES (1001, '123 Main St', 'New York', 'NY', '10001', 1)
INSERT INTO Property VALUES (1002, '456 Park Ave', 'New York', 'NY', '10002', 1)
INSERT INTO Property VALUES (2001, '789 Sunset Blvd', 'Los Angeles', 'CA', '90001', 2)


--Table Owner
INSERT INTO Owner VALUES (501, 'David Wilson')
INSERT INTO Owner VALUES (502, 'Emma Davis')

--Table Own_percentage
INSERT INTO Own_percentage VALUES (501, 1001, 60.50)
INSERT INTO Own_percentage VALUES (502, 1001, 43.00)
INSERT INTO Own_percentage VALUES (502, 2001, 100.00)

Update Owner
set Owner_name = 'Emma John'
where Owner_id = 502 


Delete from Own_percentage 
Where Property_ID = 2001

DELETE FROM Property
WHERE Property_ID = 2001



