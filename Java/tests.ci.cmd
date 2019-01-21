ECHO ==============================JAVA TESTS START==============================

mvn clean install --batch-mode

IF %ERRORLEVEL% NEQ 0 (
	ECHO Java Test failure(s) found!
	EXIT /b %ERRORLEVEL%
)

ECHO ============================== JAVA TESTS END ==============================