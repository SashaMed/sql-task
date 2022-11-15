USE bank_system;

DECLARE @card_id INT;
SET @card_id = 12;


SELECT * 
FROM account
WHERE account.id = 4

---when the balance is set to less than 2400, the trigger will rollback transaction
---cards sum is 2400 for account on populate
UPDATE account 
SET balance = 2400
WHERE account.id = 4

SELECT * 
FROM account
WHERE account.id = 4


SELECT * 
FROM card
WHERE card.id = @card_id

--when the balance is set to more than 5000, the trigger will rollback transactions
---account balance is 5000 for account on populate
UPDATE card
SET balance = 450
WHERE card.id = @card_id

SELECT * 
FROM card
WHERE card.id = @card_id


SELECT * 
FROM card

INSERT INTO card
VALUES
(100000, 3);

