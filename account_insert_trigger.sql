USE bank_system;

GO

CREATE TRIGGER card_insert
ON card 
FOR INSERT 
AS 
BEGIN
BEGIN TRY
	DECLARE @id INT, @balance INT, @account_id INT

    SELECT @id = INSERTED.id,
		@balance = INSERTED.balance,
		@account_id = INSERTED.account_id       
	FROM INSERTED

	PRINT @id
	PRINT @balance
	PRINT @account_id  		


	DECLARE  @temp INT, @account_balance INT

	SELECT @temp = account.id
	FROM account
	WHERE account.id = @account_id;
	IF @temp IS NULL
		THROW 50505, 'no account for this card',1

	SELECT @account_balance = account.balance
	FROM account
	WHERE account.id = @account_id;

	SET @temp = (SELECT SUM(balance)
	FROM card
	WHERE account_id = @account_id
	GROUP BY  card.account_id)


	IF @temp IS NULL
		THROW 50505, 'no cards for this account',1

	IF @balance > @account_balance
		THROW 50505, 'cards sum balance more than account balance',1

END TRY
BEGIN CATCH
    DECLARE @ErrorSeverity INT, @ErrorState INT, @ErrorMessage VARCHAR(100); 
    SELECT @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE(), @ErrorMessage = ERROR_MESSAGE(); 
    ROLLBACK TRANSACTION; 
    RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
END CATCH



END 