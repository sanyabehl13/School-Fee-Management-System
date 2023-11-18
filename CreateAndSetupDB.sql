
-- if not exist Create Database
CREATE DATABASE IF NOT EXISTS SchoolFeesManagementSystem;

-- Create User
USE SchoolFeesManagementSystem;


-- MYSQL SCRIPT
Create Table Student(
    AdmNo int NOT NULL,
    AdmDate datetime NOT NULL,
    StudentName varchar(255) NOT NULL,
    Class INT,
    Section CHAR(1),
    RollNo INT,
    PRIMARY KEY (AdmNo)
);
ALTER TABLE Student MODIFY AdmNo int AUTO_INCREMENT;


Create Table StudentFeeReceiptDetail(
    StudentFeeReceiptID int NOT NULL,
    AdmNo int,
    DateOfPayment datetime,
    FeeAmount decimal DEFAULT 0,
    LateCharge decimal DEFAULT 0,
    FullyPaidFlag CHAR(1) NOT NULL DEFAULT 'N',
    FOREIGN KEY (AdmNo) REFERENCES Student(AdmNo),
    PRIMARY KEY (StudentFeeReceiptID)
);
ALTER TABLE StudentFeeReceiptDetail MODIFY StudentFeeReceiptID int AUTO_INCREMENT;


-- Write queries to insert dummy data into Student Table
Insert into Student (AdmDate, StudentName, Class, Section, RollNo) values ('2006-01-01', 'Amit Singh', 12, 'A', 1);
Insert into Student (AdmDate, StudentName, Class, Section, RollNo) values ('2006-01-01', 'Sumit Tripathi', 12, 'A', 2);
Insert into Student (AdmDate, StudentName, Class, Section, RollNo) values ('2006-01-01', 'Rishab Jain', 12, 'A', 3);
Insert into Student (AdmDate, StudentName, Class, Section, RollNo) values ('2006-01-01', 'Aditya Gulia', 12, 'A', 4);
Insert into Student (AdmDate, StudentName, Class, Section, RollNo) values ('2006-01-01', 'Anubhav Shukla', 12, 'A', 5);
Insert into Student (AdmDate, StudentName, Class, Section, RollNo) values ('2006-01-01', 'Priya Gulia', 12, 'A', 6);
Insert into Student (AdmDate, StudentName, Class, Section, RollNo) values ('2006-01-01', 'Shreya Khanna', 12, 'A', 7);
Insert into Student (AdmDate, StudentName, Class, Section, RollNo) values ('2006-01-01', 'Ritu Joshi', 12, 'A', 8);
Insert into Student (AdmDate, StudentName, Class, Section, RollNo) values ('2006-01-01', 'Praveen Tambe', 12, 'A', 9);
Insert into Student (AdmDate, StudentName, Class, Section, RollNo) values ('2006-01-01', 'Krishul Sharma', 12, 'A', 10);
Insert into Student (AdmDate, StudentName, Class, Section, RollNo) values ('2006-01-01', 'Aditya Pratap ', 12, 'B', 1);
Insert into Student (AdmDate, StudentName, Class, Section, RollNo) values ('2006-01-01', 'Rahul Singh', 12, 'B', 2);
Insert into Student (AdmDate, StudentName, Class, Section, RollNo) values ('2006-01-01', 'Rahul Tripathi', 12, 'B', 3);
Insert into Student (AdmDate, StudentName, Class, Section, RollNo) values ('2006-01-01', 'Reveena Singh', 12, 'B', 4);
Insert into Student (AdmDate, StudentName, Class, Section, RollNo) values ('2006-01-01', 'Anuj Neegi', 12, 'B', 5);
Insert into Student (AdmDate, StudentName, Class, Section, RollNo) values ('2006-01-01', 'Preet Singhania', 12, 'B', 6);
Insert into Student (AdmDate, StudentName, Class, Section, RollNo) values ('2006-01-01', 'Ravi Singla', 12, 'B', 7);
Insert into Student (AdmDate, StudentName, Class, Section, RollNo) values ('2006-01-01', 'Adeesh Chauhan', 12, 'B', 8);
Insert into Student (AdmDate, StudentName, Class, Section, RollNo) values ('2006-01-01', 'Ravi Sharma', 12, 'B', 9);
Insert into Student (AdmDate, StudentName, Class, Section, RollNo) values ('2006-01-01', 'Aakash Gupta', 12, 'B', 10);
Insert into Student (AdmDate, StudentName, Class, Section, RollNo) values ('2006-01-01', 'Ritul Singh', 12, 'C', 1);
Insert into Student (AdmDate, StudentName, Class, Section, RollNo) values ('2006-01-01', 'Rishi Tripathi', 12, 'C', 2);
Insert into Student (AdmDate, StudentName, Class, Section, RollNo) values ('2006-01-01', 'Praveen Singh', 12, 'C', 3);
Insert into Student (AdmDate, StudentName, Class, Section, RollNo) values ('2006-01-01', 'Anju Neegi', 12, 'C', 4);
Insert into Student (AdmDate, StudentName, Class, Section, RollNo) values ('2006-01-01', 'Preeti Singhania', 12, 'C', 5);
Insert into Student (AdmDate, StudentName, Class, Section, RollNo) values ('2006-01-01', 'Ravish Singhla', 12, 'C', 6);
Insert into Student (AdmDate, StudentName, Class, Section, RollNo) values ('2006-01-01', 'Adi Chauhan', 12, 'C', 7);
Insert into Student (AdmDate, StudentName, Class, Section, RollNo) values ('2006-01-01', 'Ritruraj Sharma', 12, 'C', 8);
Insert into Student (AdmDate, StudentName, Class, Section, RollNo) values ('2006-01-01', 'Amit Gupta', 12, 'C', 9);
Insert into Student (AdmDate, StudentName, Class, Section, RollNo) values ('2006-01-01', 'Ramesh Singh', 12, 'C', 10);

-- Write queries to insert dummy data into StudentFeeReceiptDetail Table
Insert into StudentFeeReceiptDetail (AdmNo, DateOfPayment, FeeAmount, LateCharge, FullyPaidFlag) values (1, '2006-01-01', 7000, 0, 'Y');
Insert into StudentFeeReceiptDetail (AdmNo, DateOfPayment, FeeAmount, LateCharge, FullyPaidFlag) values (1, '2006-02-01', 7000, 0, 'Y');
Insert into StudentFeeReceiptDetail (AdmNo, DateOfPayment, FeeAmount, LateCharge, FullyPaidFlag) values (1, '2006-03-01', 7000, 0, 'Y');
Insert into StudentFeeReceiptDetail (AdmNo, DateOfPayment, FeeAmount, LateCharge, FullyPaidFlag) values (1, '2006-04-01', 7000, 0, 'Y');
Insert into StudentFeeReceiptDetail (AdmNo, DateOfPayment, FeeAmount, LateCharge, FullyPaidFlag) values (1, '2006-05-01', 7000, 0, 'Y');
Insert into StudentFeeReceiptDetail (AdmNo, DateOfPayment, FeeAmount, LateCharge, FullyPaidFlag) values (1, '2006-06-01', 7100, 100, 'Y');
Insert into StudentFeeReceiptDetail (AdmNo, DateOfPayment, FeeAmount, LateCharge, FullyPaidFlag) values (1, '2006-07-01', 7000, 0, 'Y');
Insert into StudentFeeReceiptDetail (AdmNo, DateOfPayment, FeeAmount, LateCharge, FullyPaidFlag) values (1, '2006-08-01', 5000, 0, 'N');
Insert into StudentFeeReceiptDetail (AdmNo, DateOfPayment, FeeAmount, LateCharge, FullyPaidFlag) values (2, '2006-01-01', 7000, 0, 'Y');
Insert into StudentFeeReceiptDetail (AdmNo, DateOfPayment, FeeAmount, LateCharge, FullyPaidFlag) values (2, '2006-02-01', 7200, 200, 'Y');
Insert into StudentFeeReceiptDetail (AdmNo, DateOfPayment, FeeAmount, LateCharge, FullyPaidFlag) values (2, '2006-03-01', 7000, 0, 'Y');
Insert into StudentFeeReceiptDetail (AdmNo, DateOfPayment, FeeAmount, LateCharge, FullyPaidFlag) values (2, '2006-04-01', 7000, 0, 'Y');
Insert into StudentFeeReceiptDetail (AdmNo, DateOfPayment, FeeAmount, LateCharge, FullyPaidFlag) values (2, '2006-05-01', 7000, 0, 'Y');
Insert into StudentFeeReceiptDetail (AdmNo, DateOfPayment, FeeAmount, LateCharge, FullyPaidFlag) values (2, '2006-06-01', 7000, 0, 'Y');
Insert into StudentFeeReceiptDetail (AdmNo, DateOfPayment, FeeAmount, LateCharge, FullyPaidFlag) values (2, '2006-07-01', 7000, 0, 'Y');
Insert into StudentFeeReceiptDetail (AdmNo, DateOfPayment, FeeAmount, LateCharge, FullyPaidFlag) values (2, '2006-08-01', 4100, 100, 'N');
Insert into StudentFeeReceiptDetail (AdmNo, DateOfPayment, FeeAmount, LateCharge, FullyPaidFlag) values (3, '2006-01-01', 7000, 0, 'Y');
Insert into StudentFeeReceiptDetail (AdmNo, DateOfPayment, FeeAmount, LateCharge, FullyPaidFlag) values (3, '2006-02-01', 7000, 0, 'Y');
Insert into StudentFeeReceiptDetail (AdmNo, DateOfPayment, FeeAmount, LateCharge, FullyPaidFlag) values (3, '2006-03-01', 7000, 0, 'Y');
Insert into StudentFeeReceiptDetail (AdmNo, DateOfPayment, FeeAmount, LateCharge, FullyPaidFlag) values (3, '2006-04-01', 7000, 0, 'Y');
Insert into StudentFeeReceiptDetail (AdmNo, DateOfPayment, FeeAmount, LateCharge, FullyPaidFlag) values (3, '2006-05-01', 7000, 0, 'Y');
Insert into StudentFeeReceiptDetail (AdmNo, DateOfPayment, FeeAmount, LateCharge, FullyPaidFlag) values (3, '2006-06-01', 7300, 300, 'Y');
Insert into StudentFeeReceiptDetail (AdmNo, DateOfPayment, FeeAmount, LateCharge, FullyPaidFlag) values (3, '2006-07-01', 7000, 0, 'Y');
Insert into StudentFeeReceiptDetail (AdmNo, DateOfPayment, FeeAmount, LateCharge, FullyPaidFlag) values (3, '2006-08-01', 7000, 0, 'Y');
Insert into StudentFeeReceiptDetail (AdmNo, DateOfPayment, FeeAmount, LateCharge, FullyPaidFlag) values (4, '2006-01-01', 7000, 0, 'Y');
Insert into StudentFeeReceiptDetail (AdmNo, DateOfPayment, FeeAmount, LateCharge, FullyPaidFlag) values (4, '2006-02-01', 7100, 100, 'Y');
Insert into StudentFeeReceiptDetail (AdmNo, DateOfPayment, FeeAmount, LateCharge, FullyPaidFlag) values (4, '2006-03-01', 7000, 0, 'Y');
Insert into StudentFeeReceiptDetail (AdmNo, DateOfPayment, FeeAmount, LateCharge, FullyPaidFlag) values (4, '2006-04-01', 7000, 0, 'Y');
Insert into StudentFeeReceiptDetail (AdmNo, DateOfPayment, FeeAmount, LateCharge, FullyPaidFlag) values (4, '2006-05-01', 7000, 0, 'Y');
Insert into StudentFeeReceiptDetail (AdmNo, DateOfPayment, FeeAmount, LateCharge, FullyPaidFlag) values (4, '2006-06-01', 7000, 0, 'Y');
Insert into StudentFeeReceiptDetail (AdmNo, DateOfPayment, FeeAmount, LateCharge, FullyPaidFlag) values (4, '2006-07-01', 7000, 0, 'Y');
Insert into StudentFeeReceiptDetail (AdmNo, DateOfPayment, FeeAmount, LateCharge, FullyPaidFlag) values (4, '2006-08-01', 7000, 0, 'Y');
Insert into StudentFeeReceiptDetail (AdmNo, DateOfPayment, FeeAmount, LateCharge, FullyPaidFlag) values (5, '2006-01-01', 7000, 0, 'Y');
Insert into StudentFeeReceiptDetail (AdmNo, DateOfPayment, FeeAmount, LateCharge, FullyPaidFlag) values (5, '2006-02-01', 7100, 100, 'Y');
Insert into StudentFeeReceiptDetail (AdmNo, DateOfPayment, FeeAmount, LateCharge, FullyPaidFlag) values (5, '2006-03-01', 7000, 0, 'Y');
Insert into StudentFeeReceiptDetail (AdmNo, DateOfPayment, FeeAmount, LateCharge, FullyPaidFlag) values (5, '2006-04-01', 7000, 0, 'Y');
Insert into StudentFeeReceiptDetail (AdmNo, DateOfPayment, FeeAmount, LateCharge, FullyPaidFlag) values (5, '2006-05-01', 7000, 0, 'Y');
Insert into StudentFeeReceiptDetail (AdmNo, DateOfPayment, FeeAmount, LateCharge, FullyPaidFlag) values (5, '2006-06-01', 7000, 0, 'Y');
Insert into StudentFeeReceiptDetail (AdmNo, DateOfPayment, FeeAmount, LateCharge, FullyPaidFlag) values (5, '2006-07-01', 7000, 0, 'Y');
Insert into StudentFeeReceiptDetail (AdmNo, DateOfPayment, FeeAmount, LateCharge, FullyPaidFlag) values (5, '2006-08-01', 7000, 0, 'Y');
