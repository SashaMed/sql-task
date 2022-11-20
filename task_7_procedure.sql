USE bank_system;
GO

CREATE PROCEDURE add_money_to_card  @sum_to_add INT, @card_id INT
AS
BEGIN
	BEGIN TRANSACTION trac

	PRINT @@TRANCOUNT

	DECLARE  @check_var INT, @account_id INT


	SET @check_var = 
		(SELECT card.id 
		FROM card
		WHERE card.id = @card_id);

	IF @check_var IS NULL
	BEGIN
		PRINT 'no such card';
		ROLLBACK TRANSACTION trac
		RETURN -1
	END


	SET @account_id = 
		(SELECT card.account_id 
		FROM card
		WHERE card.id = @card_id);

	SET @check_var = 
		(SELECT account.id 
		FROM account
		WHERE account.id = @account_id);

	IF @check_var IS NULL
	BEGIN
		PRINT 'no account for this card';
		ROLLBACK TRANSACTION 
		RETURN -1
	END

	DECLARE @cards_sum INT;

	SET @cards_sum = 
		(SELECT SUM(balance)
		FROM card
		WHERE card.account_id = @account_id
		GROUP BY  card.account_id);

	PRINT @cards_sum


	DECLARE @account_balance INT;

	SET @account_balance = 
		(SELECT account.balance
		FROM account 
		WHERE account.id = @account_id)

	PRINT @account_balance

	IF @account_balance - @cards_sum < @sum_to_add
	BEGIN
		PRINT 'cant add to card'
		ROLLBACK TRANSACTION
		RETURN -2
	END
	ELSE
	BEGIN

		UPDATE card SET card.balance = card.balance + @sum_to_add 
		WHERE card.id = @card_id

		PRINT @@TRANCOUNT

		IF @@TRANCOUNT > 0
			COMMIT TRANSACTION
	END

END