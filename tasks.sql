--sql task
USE bank_system;


--firts task ----------------------------------------------
WITH temp (bank_name, city_name) AS 
(SELECT  bank.name,
		city.name
FROM city
JOIN branch
	ON branch.city_id = city.id
JOIN bank
	ON bank.id = branch.bank_id
WHERE city.name = 'minsk')
SELECT DISTINCT * 
FROM temp;



--second task ----------------------------------------------
SELECT 	client.name,
		 card.balance,
		 bank.name
FROM card
JOIN account
	ON card.account_id = account.id
JOIN client
	ON account.client_id = client.id
JOIN bank
	ON bank.id = account.bank_id;



--third task ----------------------------------------------
WITH temp (card_sum, account_id) AS 
	(SELECT SUM(balance),
		 account_id
	FROM card
	GROUP BY  card.account_id)
SELECT  account.id AS account_id,
		temp.card_sum AS cards_sum_balance,
		account.balance,
		account.balance - temp.card_sum AS balance_difference
FROM temp
JOIN account
	ON account.id = temp.account_id
WHERE temp.card_sum != account.balance;



--fourth task ----------------------------------------------
--group by variant
--temp table because of ambiguity column name "name" in several tables 
WITH t (card_id, soc_id, soc_name) AS 
	(SELECT card.id AS card_id,
		 social_status.id AS soc_id ,
		 social_status.name AS soc_name
	FROM social_status
	LEFT JOIN client
		ON client.soc_status_id = social_status.id
	LEFT JOIN account
		ON account.client_id = client.id
	LEFT JOIN card
		ON card.account_id = account.id )
SELECT t.soc_name,
		 COUNT(card_id) AS c
FROM t
GROUP BY soc_name


--fourth task
--subquery variant
SELECT social_status.name,
		 
	(SELECT COUNT(card.id)
	FROM client
	JOIN account
		ON account.client_id = client.id
	JOIN card
		ON card.account_id = account.id
	WHERE client.soc_status_id = social_status.id ) AS soc_count
FROM social_status
ORDER BY social_status.name;



--fifth task ----------------------------------------------
DECLARE @temp_id INT
SET @temp_id = 2


SELECT account.id,
		 client.name,
		 account.balance
FROM account
JOIN client
	ON client.id = account.client_id
JOIN social_status
	ON social_status.id = client.soc_status_id
WHERE social_status.id = @temp_id; 


EXEC add_10_by_soc_status @temp_id;


SELECT account.id,
		 client.name,
		 account.balance
FROM account
JOIN client
	ON client.id = account.client_id
JOIN social_status
	ON social_status.id = client.soc_status_id
WHERE social_status.id = @temp_id;



---sixth task



WITH temp (account_sum, client_id) AS 
	(SELECT SUM(balance),
		 client_id
	FROM account
	GROUP BY  account.client_id)
SELECT client.id AS client_id,
		client.name,
		(temp.account_sum - (SELECT SUM(card.balance)
		FROM card
		JOIN account
			ON account.id = card.account_id
		JOIN client
			ON client.id = account.client_id
		WHERE client.id = temp.client_id
		GROUP by client.id)) AS available_money
FROM temp
RIGHT JOIN client
	ON client.id = temp.client_id;


---seventh task
---success 
SELECT * 
FROM account
JOIN card
	ON card.account_id = account.id
WHERE account.id = 4

EXEC add_money_to_card 100, 4

SELECT * 
FROM account
JOIN card
	ON card.account_id = account.id
WHERE account.id = 4


---failure
---sum to add is more than the balance
SELECT * 
FROM account
JOIN card
	ON card.account_id = account.id
WHERE account.id = 4

EXEC add_money_to_card 10000, 4

SELECT * 
FROM account
JOIN card
	ON card.account_id = account.id
WHERE account.id = 4