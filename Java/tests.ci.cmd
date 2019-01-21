ECHO ==============================JAVA TESTS START==============================

mvn clean install --batch-mode

:TEST_ERROR
ECHO Java Test failure(s) found!
EXIT /b 1
	
ECHO ============================== JAVA TESTS END ==============================