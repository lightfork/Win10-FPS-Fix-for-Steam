@ECHO OFF
COLOR 1F
TITLE "Valve/Steam FPS Fix for Windows 10"

ECHO Valve/Steam FPS Fix for Windows 10 
ECHO -------------------------------------------
ECHO ** Run this as administrator **
ECHO.
ECHO Your OS version:

ver

ECHO.
ECHO [x] Disable GameDVR
ECHO [x] Disable AllowGameDVR
ECHO.
CHOICE /M "Press Y to continue or N to stop" /c YN
ECHO.

IF errorlevel 2 (
	ECHO Bye.
	PAUSE
	EXIT

) ELSE IF errorlevel 1 (
	ECHO Disable GameDVR

	REG ADD HKEY_CURRENT_USER\System\GameConfigStore /v GameDVR_Enabled /t REG_DWORD /d 0 /f

	ECHO.

	ECHO Disable AllowGameDVR

	REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\ /v AllowGameDVR /t REG_DWORD /d 0 /f 
	
	ECHO.
	ECHO Done. If Access Denied appears above, run this as administrator by right clicking on it.
	ECHO.

	PAUSE
)
