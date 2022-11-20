USE bank_system;

DECLARE @card_id INT;
SET @card_id = 12;

SELECT * 
FROM card
WHERE card.id = @card_id

---success 
UPDATE card
SET balance = 500
WHERE card.id = @card_id

SELECT * 
FROM card
WHERE card.id = @card_id


---failure
---Cards sum balance is more than account balance, the trigger will raise error and rollback transaction
UPDATE card
SET balance = 6000
WHERE card.id = @card_id

SELECT * 
FROM card
WHERE card.id = @card_id


--SELECT * 
--FROM card

--INSERT INTO card
--VALUES
--(100000, 3);