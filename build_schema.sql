DROP DATABASE IF EXISTS BANK;
create schema BANK;
USE BANK;

CREATE TABLE BRANCH
( 
	BranchID	INT			NOT NULL, 
    Assets		INT 		NOT NULL, 
    Name 		VARCHAR (30)	NOT NULL, 
    Address		VARCHAR (30), 
    City		VARCHAR (15), 
    primary key (BranchID)
); ### This is 3NF 

CREATE TABLE EMPLOYEE
(
	SSN		CHAR(9)			NOT NULL, 
    Name 	VARCHAR (30)	NOT NULL, 
    TelephoneNo		VARCHAR(11) NOT NULL, 
    StartDate 		DATE, 
    LengthOfEmployment		DECIMAL(10, 2),
    BBranchID		INT 	NOT NULL,
    primary key (SSN), 
    CONSTRAINT emp_fk_branch foreign key (BBranchID) references BRANCH(BranchID)
); ### This is 3NF

CREATE TABLE CUSTOMER
(
	SSN		CHAR(9)		NOT NULL, 
    Name 	VARCHAR(30)	NOT NULL, 
    ApartmentNo VARCHAR(3), 
    StreetNO 	INT, 
    STATE	CHAR(2), 
    CITY	VARCHAR(15), 
    ZIP		VARCHAR(5), 
    ESSN	CHAR(9)		NOT NULL, 
    BBranchID 	INT		NOT NULL, 
    primary key (SSN), 
    constraint cus_fk_branch foreign key (BBranchID) references BRANCH(BranchID), 
    constraint cus_fk_emp foreign key (ESSN) references EMPLOYEE(SSN)
    
);

CREATE TABLE DEPENDENTS
(
	ESSN	CHAR(9)		NOT NULL, 
    Name 	VARCHAR(30) NOT NULL, 
    primary key (ESSN, Name), 
    constraint dep_fk_emp foreign key (ESSN) references EMPLOYEE(SSN)
);

CREATE TABLE ACCOUNT
(
	AccountNo	INT 	NOT NULL, 
    Balance		DECIMAL(10, 2), 
    Type		VARCHAR(15),
    primary key (AccountNo)
);

CREATE TABLE TRANSACTION
(
	TransactionCode		INT		NOT NULL, 
    TypeOfName		VARCHAR(15)	NOT NULL, 
    TransTime		DATE, 
    Amount			DECIMAL(10, 2),
    primary key (TransactionCode)    
);

CREATE TABLE LOAN
(
	LoanNo	INT NOT NULL, 
    LoanAmount Decimal(10, 2), 
    MonthlyRepaymentAmount DECIMAL(10, 2), 
    FixedInterestRate DECIMAL(10, 2), 
    BBranchID INT NOT NULL, 
    Primary key (LoanNo), 
    constraint loan_fk_acc foreign key (LoanNo) references ACCOUNT(AccountNo), 
    constraint loan_fk_branch foreign key (BBranchID) references BRANCH(BranchID)
);

CREATE TABLE SAVINGS
(
	AccountNumber INT NOT NULL, 
    FixedInterestRate DECIMAL(10, 2), 
    Primary key (AccountNumber), 
    constraint sav_fk_acc foreign key (AccountNumber) references ACCOUNT(AccountNo) 
);

CREATE TABLE CHECKING
(
	AccountNumber INT NOT NULL, 
    Overdraft INT, 
    Primary key (AccountNumber), 
    constraint check_fk_acc foreign key (AccountNumber) references ACCOUNT(AccountNo) 
);

CREATE TABLE MONEY_MARKET
(
	AccountNumber INT NOT NULL, 
    VariableInterestRate DECIMAL(10, 2), 
    Primary key (AccountNumber), 
    constraint market_fk_acc foreign key (AccountNumber) references ACCOUNT(AccountNo) 
);

CREATE TABLE OWN
(
	AccountNumber INT NOT NULL, 
    CSSN CHAR(9) NOT NULL, 
    Primary key (AccountNumber, CSSN), 
    constraint own_fk_acc foreign key (AccountNumber) references ACCOUNT(AccountNo), 
    constraint own_fk_cus foreign key (CSSN) references CUSTOMER(SSN)
);

CREATE TABLE PERFORM
(
	TransCode INT NOT NULL, 
    AccountNumber INT NOT NULL, 
    primary key (TransCode), 
    constraint per_fk_trans foreign key (TransCode) references TRANSACTION(TransactionCode),
    constraint per_fk_acc foreign key (AccountNumber) references ACCOUNT(AccountNo)
);

CREATE TABLE TAKE_OUT
(
	CSSN CHAR(9) NOT NULL, 
    LoanNumber INT NOT NULL, 
    primary key (CSSN, LoanNumber), 
    constraint tkout_fk_cus foreign key (CSSN) references CUSTOMER(SSN), 
    constraint tkout_fk_loan foreign key (LoanNumber) references LOAN(LoanNo)
);

CREATE TABLE LAST_ACCESS_DATE
(
	CSSN CHAR(9) NOT NULL, 
    AccountNumber INT NOT NULL, 
    AccessDate DATE, 
    primary key (CSSN, AccountNumber), 
    constraint last_fk_cus foreign key (CSSN) references CUSTOMER(SSN), 
    constraint last_fk_acc foreign key (AccountNumber) references ACCOUNT(AccountNo)
);

