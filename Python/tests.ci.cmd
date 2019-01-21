ECHO ==============================PYHTON TESTS START==============================

pip install -e .\libraries\recognizers-text\

pip install -e .\libraries\recognizers-number\

pip install -e .\libraries\recognizers-number-with-unit\

pip install -e .\libraries\recognizers-date-time\

pip install -e .\libraries\recognizers-sequence\

pip install -e .\libraries\recognizers-suite\

pip install -r .\tests\requirements.txt

pytest --tb=line

:TEST_ERROR
ECHO Python Test failure(s) found!
EXIT /b 1


ECHO ============================== PYHTON TESTS END ==============================