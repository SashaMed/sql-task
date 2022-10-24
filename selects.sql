USE bank_system;


SELECT *
FROM social_status
JOIN client
	ON client.soc_status_id = social_status.id
JOIN account
	ON client.id = account.client_id
JOIN card
	ON card.account_id = account.id
ORDER BY social_status.name




