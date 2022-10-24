USE bank_system;
GO

--this procedure adds 10$ to all client accounts with social_status_id = @soc_id
--returns 0 if there is no issues
--returns -1 if there is no such social status
--returns -2 if there is no accounts with this social status
CREATE PROCEDURE add_10_by_soc_status @soc_id INT
AS
BEGIN
DECLARE @check_var INT

SET @check_var = 
	(SELECT social_status.id
	FROM social_status
	WHERE social_status.id = @soc_id)

IF @check_var IS NULL
BEGIN
	PRINT 'no such social status'
	RETURN -1;
END

SET @check_var = 
(SELECT COUNT(account.id)
	FROM account
	JOIN client
		ON client.id = account.client_id
	JOIN social_status
		ON social_status.id = client.soc_status_id
	WHERE social_status.id = @soc_id)

IF @check_var = 0
BEGIN
	PRINT 'no accounts for this social status id'
	RETURN -2;
END

UPDATE account SET account.balance = account.balance + 10
WHERE account.id IN
	(SELECT account.id
	FROM account
	JOIN client
		ON client.id = account.client_id
	JOIN social_status
		ON social_status.id = client.soc_status_id
	WHERE social_status.id = @soc_id ) 
	
	RETURN 0;
END;