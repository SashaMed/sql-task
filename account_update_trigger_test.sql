USE bank_system;


SELECT * 
FROM account
WHERE account.id = 4


---success 
UPDATE account 
SET balance = 5100
WHERE account.id = 4

SELECT * 
FROM account
WHERE account.id = 4


---failure
---Account balance less than cards sum balance, the trigger will raise error and rollback transaction
UPDATE account 
SET balance = 1000
WHERE account.id = 4


SELECT * 
FROM account
WHERE account.id = 4

