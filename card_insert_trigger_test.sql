USE bank_system;

SELECT * 
FROM card
JOIN account
	ON account.id = card.account_id
WHERE account.id = 4;

---success 
INSERT INTO card
VALUES
(100, 4);

SELECT * 
FROM card
JOIN account
	ON account.id = card.account_id
WHERE account.id = 4;


---failure
---Cards sum balance is more than account balance, the trigger will raise error and rollback transaction
INSERT INTO card
VALUES
(10000, 4);


SELECT * 
FROM card
JOIN account
	ON account.id = card.account_id
WHERE account.id = 4;