-- Insert Data into BRANCH
INSERT INTO BRANCH (BranchID, Assets, Name, Address, City) VALUES
(1, 5000000, 'Main Branch', '123 Main St', 'New York'),
(2, 3500000, 'Downtown Branch', '456 Market St', 'Los Angeles'),
(3, 2700000, 'Suburban Branch', '789 Oak St', 'Chicago'),
(4, 4000000, 'City Center Branch', '321 Elm St', 'Houston'),
(5, 3200000, 'Westside Branch', '654 Pine St', 'San Francisco');

-- Insert Data into EMPLOYEE
INSERT INTO EMPLOYEE (SSN, Name, TelephoneNo, StartDate, LengthOfEmployment, BBranchID) VALUES
('111223333', 'Alice Johnson', '5551234567', '2015-06-10', 8.5, 1),
('444556666', 'Bob Smith', '5552345678', '2018-09-15', 5.2, 2),
('777889999', 'Charlie Davis', '5553456789', '2017-03-20', 6.8, 3),
('222334444', 'David Lee', '5554567890', '2016-11-01', 7.9, 4),
('555667777', 'Emma Wilson', '5555678901', '2020-05-25', 3.5, 5);

-- Insert Data into CUSTOMER
INSERT INTO CUSTOMER (SSN, Name, ApartmentNo, StreetNO, STATE, CITY, ZIP, ESSN, BBranchID) VALUES
('111223333', 'John Doe', 'A12', 100, 'NY', 'New York', '10001', '111223333', 1),
('444556666', 'Jane Smith', 'B45', 200, 'CA', 'Los Angeles', '90001', '444556666', 2),
('777889999', 'Michael Johnson', 'C78', 300, 'IL', 'Chicago', '60601', '777889999', 3),
('222334444', 'Emily Davis', 'D90', 400, 'TX', 'Houston', '77001', '222334444', 4),
('555667777', 'Chris Brown', 'E11', 500, 'CA', 'San Francisco', '94101', '555667777', 5);

-- Insert Data into ACCOUNT
INSERT INTO ACCOUNT (AccountNo, Balance, Type) VALUES
(1001, 5000.00, 'Savings'),
(1002, 1500.00, 'Checking'),
(1003, 7000.00, 'Savings'),
(1004, 2000.00, 'Checking'),
(1005, 8000.00, 'Money Market'),
(1006, 3500.00, 'Checking'),
(1007, 6200.00, 'Savings'),
(1008, 9000.00, 'Money Market'),
(1009, 2200.00, 'Checking'),
(1010, 7500.00, 'Savings'),
(1011, 10000.00, 'Loan'),
(1012, 20000.00, 'Loan'),
(1013, 15000.00, 'Loan'),
(1014, 25000.00, 'Loan');

-- Insert Data into LOAN
INSERT INTO LOAN (LoanNo, LoanAmount, MonthlyRepaymentAmount, FixedInterestRate, BBranchID) VALUES
(1011, 10000.00, 250.00, 3.5, 1),
(1012, 20000.00, 500.00, 4.2, 2),
(1013, 15000.00, 375.00, 3.8, 3),
(1014, 25000.00, 625.00, 4.5, 4);

-- Insert Data into SAVINGS
INSERT INTO SAVINGS (AccountNumber, FixedInterestRate) VALUES
(1001, 1.2),
(1003, 1.5),
(1007, 1.8),
(1010, 2.0);

-- Insert Data into CHECKING
INSERT INTO CHECKING (AccountNumber, Overdraft) VALUES
(1002, 500),
(1004, 600),
(1006, 700),
(1009, 1000);

-- Insert Data into MONEY_MARKET
INSERT INTO MONEY_MARKET (AccountNumber, VariableInterestRate) VALUES
(1005, 2.2),
(1008, 2.5);

-- Insert Data into OWN (Linking customers to accounts)
INSERT INTO OWN (AccountNumber, CSSN) VALUES
(1001, '111223333'),
(1002, '111223333'),
(1003, '444556666'),
(1004, '444556666'),
(1005, '777889999'),
(1006, '777889999'),
(1007, '222334444'),
(1008, '222334444'),
(1009, '555667777'),
(1010, '555667777'),
(1011, '111223333'),
(1012, '444556666'),
(1013, '777889999'),
(1014, '222334444');

-- Insert Data into TRANSACTION
INSERT INTO TRANSACTION (TransactionCode, TypeOfName, TransTime, Amount) VALUES
(5001, 'Deposit', '2024-01-15', 1000.00),
(5002, 'Withdrawal', '2024-02-10', 500.00),
(5003, 'Deposit', '2024-03-05', 2000.00),
(5004, 'Withdrawal', '2024-04-20', 1000.00),
(5005, 'Transfer', '2024-05-01', 300.00);

-- Insert Data into PERFORM (Linking transactions to accounts)
INSERT INTO PERFORM (TransCode, AccountNumber) VALUES
(5001, 1001),
(5002, 1002),
(5003, 1003),
(5004, 1004),
(5005, 1005);

-- Insert Data into TAKE_OUT (Linking customers to loans)
INSERT INTO TAKE_OUT (CSSN, LoanNumber) VALUES
('111223333', 1011),
('444556666', 1012),
('777889999', 1013),
('222334444', 1014);

-- Insert Data into LAST_ACCESS_DATE (Tracking last account access)
INSERT INTO LAST_ACCESS_DATE (CSSN, AccountNumber, AccessDate) VALUES
('111223333', 1001, '2024-01-20'),
('111223333', 1002, '2024-02-15'),
('444556666', 1003, '2024-03-10'),
('444556666', 1004, '2024-04-05'),
('777889999', 1005, '2024-05-01');
