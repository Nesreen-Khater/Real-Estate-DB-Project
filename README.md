# 🏡 Real Estate DB Project
## 📌 Project Overview

This project demonstrates the complete process of building a database system for a Real Estate Firm.
Starting from ERD Mapping, the conceptual design was converted into a Physical Schema using SQL (DDL commands), and populated with sample data using DML commands.

The database models real-world real estate operations, including sales offices, employees, properties, and owners.

 # 🗄️ Database Description

The system manages:

Sales Offices: Identified by Office Number & Location.

Employees: Assigned to offices, with one employee managing each office.

Properties: Each property belongs to one sales office and has a detailed location.

Owners: Each property can have one or more owners, with ownership percentage tracked.

# ✅ Features & Topics Covered
🔹 DDL (Data Definition Language)

CREATE TABLE with constraints:

Primary Keys

Foreign Keys with referential integrity

NOT NULL, UNIQUE, CHECK constraints

ALTER TABLE to add/remove constraints

DROP TABLE to remove tables

🔹 DML (Data Manipulation Language)

INSERT INTO → add employees, offices, properties, and owners

UPDATE → modify office location or employee assignment

DELETE → remove records (with handling for foreign key constraints)

SELECT → query relationships between employees, offices, and properties

## 🗺️ ERD Diagram  
<img width="880" height="550" alt="Real State ERD" src="https://github.com/user-attachments/assets/375a5480-55e6-4aec-9aa0-e4ce42f32e82" />




## 🧩 ERD Mapping (Logical Design) 
<img width="818" height="574" alt="RealState Mapping" src="https://github.com/user-attachments/assets/d91f78da-a2ac-4de0-910d-2e5443729ff1" />



## 🗄️ Physical Schema (Database Tables) 
<img width="958" height="566" alt="RealState Phy Schema" src="https://github.com/user-attachments/assets/376f1163-3afc-4f85-93a7-a5f50db35be4" />

# 🛠️ Example DDL
CREATE TABLE SalesOffice (
    Office_No INT PRIMARY KEY,
    Location VARCHAR(100) NOT NULL
);

CREATE TABLE Employee (
    Employee_ID INT PRIMARY KEY,
    Employee_Name VARCHAR(100) NOT NULL,
    Office_No INT,
    CONSTRAINT FK_Employee_Office FOREIGN KEY (Office_No) 
        REFERENCES SalesOffice(Office_No)
        ON DELETE CASCADE
);

CREATE TABLE Property (
    Property_ID INT PRIMARY KEY,
    Address VARCHAR(150) NOT NULL,
    City VARCHAR(50),
    State VARCHAR(50),
    Zip_Code VARCHAR(10),
    Office_No INT NOT NULL,
    CONSTRAINT FK_Property_Office FOREIGN KEY (Office_No)
        REFERENCES SalesOffice(Office_No)
);

CREATE TABLE Owner (
    Owner_ID INT PRIMARY KEY,
    Owner_Name VARCHAR(100) NOT NULL
);

CREATE TABLE Own_Percentage (
    Owner_ID INT,
    Property_ID INT,
    Percentage DECIMAL(5,2),
    PRIMARY KEY (Owner_ID, Property_ID),
    CONSTRAINT FK_Owner FOREIGN KEY (Owner_ID) REFERENCES Owner(Owner_ID),
    CONSTRAINT FK_Property FOREIGN KEY (Property_ID) REFERENCES Property(Property_ID)
);

🛠️ Example DML
-- Insert sample offices
INSERT INTO SalesOffice VALUES (1, 'New York'), (2, 'Chicago');

-- Insert employees
INSERT INTO Employee VALUES (101, 'Alice Johnson', 1), (102, 'Mark Smith', 2);

-- Insert properties
INSERT INTO Property VALUES (201, '123 Main St', 'New York', 'NY', '10001', 1);

-- Insert owners
INSERT INTO Owner VALUES (301, 'John Doe'), (302, 'Emily Brown');

-- Ownership relation
INSERT INTO Own_Percentage VALUES (301, 201, 60.00), (302, 201, 40.00);


# 🚀 How to Use

Create a new database in SQL Server:

CREATE DATABASE RealEstate;
USE RealEstate;


Run RealEstate_DDL.sql to create tables.

Run RealEstate_DML.sql to insert and manipulate data.

Explore relationships and run custom queries.

# 📈 Key Learning Outcomes

Converting ERD into Physical Schema

Applying DDL constraints for data integrity

Using DML for database population and updates

Handling foreign key conflicts (CASCADE, manual deletes)

Practical database design & normalization principles
