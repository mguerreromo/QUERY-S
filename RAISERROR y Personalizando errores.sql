DECLARE @DataBaseID int = DB_NAME();
DECLARE @DataBaseName sysname = DB_NAME() ;
RAISERROR
(N'Currernt database ID:%dn dabatabe name %s.',
10, -- Severity
1, -- State
@DataBaseID, -- Firt subtitution argument.
@DataBaseName); -- Second subtitution argument.

--Elevando errors usando THROW
THROW 51245, 'Not Happy now', 1;
--los numero de error deben estar por encima de los 50,000, porque por debajo estan reservados.

--Usando @@ERROR

RAISERROR(N'Message', 16, 1);
IF @@ERROR <>0
	PRINT 'ERROR =' + CAST(@@ERROR AS VARCHAR(8));
GO

DECLARE @errorValue INT;
RAISERROR(N'Message', 16,1);
SET @errorValue = @@ERROR;
IF @errorValue <> 0 
	PRINT 'ERROR =' + CAST(@errorValue AS VARCHAR(8));

--Elevando errors Personalizados
EXECUTE sp_addmessage 61484, 10,
	'Current DatabaseID: %d, DatabaseName: %s';
GO

DECLARE @DataBaseID INT = DB_ID();
DECLARE @DataBaseName SYSNAME = DB_NAME();

RAISERROR (61484, 10, @DataBaseID, @DataBaseName );