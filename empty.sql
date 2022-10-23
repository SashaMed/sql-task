--sql task
USE bank_system;


--firts task
--SELECT DISTINCT bank.name,
--		city.name
--FROM city
--JOIN branch
--	ON branch.city_id = city.id
--JOIN bank
--	ON bank.id = branch.bank_id
--WHERE city.name = 'minsk';



--second task
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


--third task
--WITH temp (card_sum, account_id) AS 
--	(SELECT SUM(balance),
--		 account_id
--	FROM card
--	GROUP BY  card.account_id)
--SELECT *
--FROM temp
--JOIN account
--	ON account.id = temp.account_id
--WHERE temp.card_sum != account.balance


--temp table because of ambiguity column name "name" in several tables 
WITH t (card_id, soc_id, soc_name)
as 
(SELECT card.id as card_id, social_status.id as soc_id , social_status.name as soc_name
FROM card
JOIN account
	ON account.id = card.account_id
JOIN client 
	ON client.id = account.client_id
JOIN social_status 
	ON social_status.id = client.soc_status_id
	)
SELECT COUNT(soc_name) as c, t.soc_name FROM t
GROUP BY soc_name
