@ECHO off
SETLOCAL EnableDelayedExpansion

ECHO.
ECHO # Building .NET platform
REM vswhere is an optional component for Visual Studio and also installed with Build Tools. 
REM vswhere will look for Community, Professional, and Enterprise editions of Visual Studio
REM (only works with Visual Studio 2017 Update 2 or newer installed)
SET vswhere="%ProgramFiles(x86)%\Microsoft Visual Studio\Installer\vswhere.exe"

for /f "usebackq tokens=*" %%i in (`!vswhere! -latest -products * -requires Microsoft.Component.MSBuild -property installationPath`) do (
  set VSInstallDir=%%i
)

ECHO.
ECHO # Finding VSTest
SET VSTestDir=%VSInstallDir%\Common7\IDE\CommonExtensions\Microsoft\TestWindow

IF NOT EXIST "%VSTestDir%\vstest.console.exe" (
	ECHO "vstest.console.exe" could not be found at "%VSTestDir%"
	EXIT /B
) 

set configuration=Release
ECHO # Running .NET Tests
SET testcontainer=
FOR /R %%f IN (*Tests.dll) DO (
	(ECHO "%%f" | FIND /V "\bin\%configuration%" 1>NUL) || (
		SET testcontainer=!testcontainer! "%%f"
	)
)
ECHO "!VsTestDir!\vstest.console"
CALL "!VsTestDir!\vstest.console" /Parallel %testcontainer% --no-build --no-restore --test-adapter-path:. --logger:Appveyor Test
IF %ERRORLEVEL% NEQ 0 GOTO TEST_ERROR