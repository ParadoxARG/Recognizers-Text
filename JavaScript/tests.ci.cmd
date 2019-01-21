ECHO ==============================JAVASCRIPT TESTS START==============================

npm run test

IF %ERRORLEVEL% NEQ 0 (
	ECHO # JS Test failure(s) found!
	EXIT /b %ERRORLEVEL%
)
	
ECHO ============================== JAVASCRIPT TESTS END ==============================