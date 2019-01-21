ECHO ==============================JAVASCRIPT TESTS START==============================

npm run test

:TEST_ERROR
ECHO JavaScript Test failure(s) found!
EXIT /b 1



IF %ERRORLEVEL% NEQ 0 (
	ECHO # JS Test failure(s) found!
	EXIT /b %ERRORLEVEL%
)
	
ECHO ============================== JAVASCRIPT TESTS END ==============================