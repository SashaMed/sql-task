USE bank_system;

GO

CREATE TRIGGER account_update
ON account 
FOR UPDATE 
AS 
BEGIN
BEGIN TRY
	DECLARE @id INT, @balance INT, @bank_id INT

    SELECT @id = INSERTED.id,
		@balance = INSERTED.balance,
		@bank_id = INSERTED.bank_id       
	FROM INSERTED

	--PRINT @id
	--PRINT @balance
	--PRINT @bank_id  		

	DECLARE @difference_balance INT, @temp INT

	SELECT @temp = account.balance
	FROM account
	WHERE account.id = @id;

	SET @temp = (SELECT SUM(balance)
	FROM card
	WHERE account_id = @id
	GROUP BY  card.account_id)


	IF @temp IS NULL
		THROW 50505, 'No cards for this account.',1

	IF @balance < @temp
		THROW 50505, 'Account balance less than cards sum balance.',1

END TRY
BEGIN CATCH
    DECLARE @ErrorSeverity INT, @ErrorState INT, @ErrorMessage VARCHAR(100); 
    SELECT @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE(), @ErrorMessage = ERROR_MESSAGE(); 
    RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
	ROLLBACK TRANSACTION; 
END CATCH

END