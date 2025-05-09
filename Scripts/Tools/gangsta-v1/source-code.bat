::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFCldTwyDLm+GIrAP4/z0/9bW8h1EBew6aovd27eLH7FCuhW1JNgk1XU6
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+IeA==
::cxY6rQJ7JhzQF1fEqQJhZksaHErSXA==
::ZQ05rAF9IBncCkqN+0xwdVsFAlTMbCXqZg==
::ZQ05rAF9IAHYFVzEqQIXKRVTXxCDfF+yA/Uy7fr/jw==
::eg0/rx1wNQPfEVWB+kM9LVsJDAODMmypErRS6unvjw==
::fBEirQZwNQPfEVWB+kM9LVsJDAODMmypErR8
::cRolqwZ3JBvQF1fEqQITOh5VWAGGfEmjRpsT/N/+5viD7ANTGqx/Tqrp4/SgBdI3qwSlFQ==
::dhA7uBVwLU+EWHeL4HU1IQlQDDSQM2+vBaEV5+bojw==
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATE2k1wJxVRDCeDLm6pZg==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRmS8VApaBhbQwji
::Zh4grVQjdCyDJGyX8VAjFCldTwyDLm+GIrAP4/z0/9aAo0MaR/Y+NZjS1OfcbuUL7yU=
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
setlocal enabledelayedexpansion
for /f "tokens=2 delims==" %%a in ('wmic os get locale /value') do set language=%%a

if "%language%"=="0416" (
	goto pt_br
) else (
	goto eng
)

:pt_br
if "%1" == "-save-on" (
    set output=%2
    if exist !output! (
	echo.
	powershell -Command "Write-Host 'Error: Arquivo [!output!] ja Existe!' -ForegroundColor Red
	exit /b 1
    )
    (
	echo Criado por NotWeird
	echo Dispositivos Conectados na Rede:
    	arp -a | find "192.168.1" | findstr /V "Interface"
    	echo ---------------------------------------------------------------
    ) > !output!
    if exist !output! (
	echo.
	powershell -Command "Write-Host 'Arquivo [!output!] criado com Sucesso' -ForegroundColor Green
	exit /b 0
    )
)
echo.
powershell -Command "Write-Host 'Criado por alguem na Internet chamado ' -NoNewline; Write-Host 'NotWeird' -ForegroundColor Green"
echo Hackeou seu Amiguinho... PROBLEMA NAO E MEU
echo.
echo Dispositivos Conectados na Rede:
arp -a | find "192.168.1" | findstr /V "Interface"
exit /b




:eng
if "%1" == "-save-on" (
    set output=%2
    if exist !output! (
	echo.
	powershell -Command "Write-Host 'Error: File [!output!] already Exists!' -ForegroundColor Red
	exit /b 1
    )
    (
	echo Created by NotWeird
	echo Connected Devices:
    	arp -a | find "192.168.1" | findstr /V "Interface"
    	echo ---------------------------------------------------------------
    ) > !output!
    if exist !output! (
	echo.
	powershell -Command "Write-Host 'File [!output!] created Successfully' -ForegroundColor Green
	exit /b 0
    )
)
echo.
powershell -Command "Write-Host 'Created By ' -NoNewline; Write-Host 'NotWeird' -ForegroundColor Green"
echo I have no Responsibility for WHAT HELL You do With Gangsta
echo.
echo Connected Devices:
arp -a | find "192.168.1" | findstr /V "Interface"
exit /b