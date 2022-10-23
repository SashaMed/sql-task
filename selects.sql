USE bank_system;

SELECT * 
FROM bank;

SELECT * 
FROM city;

SELECT * 
FROM branch
	JOIN bank ON bank.id = branch.bank_id;
