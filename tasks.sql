--sql task
USE bank_system;


--firts task ----------------------------------------------
--SELECT DISTINCT bank.name,
--		city.name
--FROM city
--JOIN branch
--	ON branch.city_id = city.id
--JOIN bank
--	ON bank.id = branch.bank_id
--WHERE city.name = 'minsk';



--second task ----------------------------------------------
--SELECT 	client.name,
--		 card.balance,
--		 bank.name
--FROM card
--JOIN account
--	ON card.account_id = account.id
--JOIN client
--	ON account.client_id = client.id
--JOIN bank
--	ON bank.id = account.bank_id;



--third task ----------------------------------------------
--WITH temp (card_sum, account_id) AS 
--	(SELECT SUM(balance),
--		 account_id
--	FROM card
--	GROUP BY  card.account_id)
--SELECT  account.id AS account_id,
--		temp.card_sum AS cards_sum_balance,
--		account.balance,
--		account.balance - temp.card_sum AS balance_difference
--FROM temp
--JOIN account
--	ON account.id = temp.account_id
--WHERE temp.card_sum != account.balance



--fourth task ----------------------------------------------
--group by variant
--temp table because of ambiguity column name "name" in several tables 
--WITH t (card_id, soc_id, soc_name) AS 
--	(SELECT card.id AS card_id,
--		 social_status.id AS soc_id ,
--		 social_status.name AS soc_name
--	FROM card
--	JOIN account
--		ON account.id = card.account_id
--	JOIN client
--		ON client.id = account.client_id
--	JOIN social_status
--		ON social_status.id = client.soc_status_id )
--SELECT t.soc_name,
--		 COUNT(soc_name) AS c
--FROM t
--GROUP BY  soc_name


--fourth task
--subquery variant
--SELECT social_status.name,
		 
--	(SELECT COUNT(card.id)
--	FROM client
--	JOIN account
--		ON account.client_id = client.id
--	JOIN card
--		ON card.account_id = account.id
--	WHERE client.soc_status_id = social_status.id ) AS soc_count
--FROM social_status
--ORDER BY social_status.name;



--fifth task ----------------------------------------------
--DECLARE @temp_id INT
--SET @temp_id = 2


--SELECT account.id,
--		 client.name,
--		 account.balance
--FROM account
--JOIN client
--	ON client.id = account.client_id
--JOIN social_status
--	ON social_status.id = client.soc_status_id
--WHERE social_status.id = @temp_id; 


--EXEC add_10_by_soc_status @temp_id;


--SELECT account.id,
--		 client.name,
--		 account.balance
--FROM account
--JOIN client
--	ON client.id = account.client_id
--JOIN social_status
--	ON social_status.id = client.soc_status_id
--WHERE social_status.id = @temp_id;



---sixth task


WITH temp (card_sum, account_id) AS 
	(SELECT SUM(balance),
		 account_id
	FROM card
	GROUP BY  card.account_id)
SELECT client.name,
		account.id AS account_id,
		temp.card_sum AS cards_sum_balance,
		account.balance AS account_balance,
		account.balance - temp.card_sum AS balance_difference
FROM temp
JOIN account
	ON account.id = temp.account_id
JOIN client
	ON client.id = account.client_id
--WHERE temp.card_sum != account.balance

