USE bank_system;

DECLARE @card_id INT;
SET @card_id = 12;


--SELECT * 
--FROM account
--WHERE account.id = 7

--UPDATE account 
--SET balance = 200
--WHERE account.id = 7

--SELECT * 
--FROM account
--WHERE account.id = 7


--SELECT * 
--FROM card
--WHERE card.id = @card_id

--UPDATE card
--SET balance = 30000
--WHERE card.id = @card_id

--SELECT * 
--FROM card
--WHERE card.id = @card_id


SELECT * 
FROM card

INSERT INTO card
VALUES
(100000, 3);

-- trigger for cards
-- corner cases
-- transaction rollback
-- get from return 
-- populate 