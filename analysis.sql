# get the total number of employees in each branch 
Select * FROM employee;

SELECT BBranchID, COUNT(*) as NumOfEmployees 
FROM EMPLOYEE
GROUP BY BBranchID;

SELECT * FROM TRANSACTION;
SELECT TypeOfName, COUNT(*) AS TransactionCount 
FROM TRANSACTION 
GROUP BY TypeOfName
Having TypeOfName = 'Deposit';

SELECT SSN, Name, BBranchID, LengthOfEmployment
FROM EMPLOYEE
WHERE LengthOfEmployment > ALL (
SELECT LengthOfEmployment FROM EMPLOYEE 
Where BBranchID = 4);